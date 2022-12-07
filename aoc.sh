#!/usr/bin/env bash
set -eu

cd "$(dirname "$0")"
test -f ".env" && source $_

Y=${YEAR:-$(date +%Y)}
D=${DAY:-$(date +%-d)}
C="session=${COOKIE:?Missing session cookie.}"
HEAD=$(cat <<'EOF'
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8"/>
<style>
    body { font-family: "Ubuntu", "Segoe UI", sans-serif; line-height: 1.3em; }
    input~span:before, .leaderboard-entry, .privboard-row { font-family: "Source Code Pro", monospace; letter-spacing: -1px; }
    body * { text-shadow: none !important; }
    article em { font-weight: bold; }
    main>article, main>p, pre.calendar, form, .leaderboard-entry { width: 40em !important; margin: auto; }
    header div { text-align: center; margin: auto; }
</style>
</head>
<body>
EOF
)

prepend() {
    echo -ne "$@" && cat -
}

echo "Year $Y, day $D"
mkdir -p "./$Y/$D"
curl \
    -sSL \
    -b "$C" \
    "https://adventofcode.com/$Y/day/$D/input" \
    -o "./$Y/$D/input.txt"
curl \
    -sSL \
    -b "$C" \
    "https://adventofcode.com/$Y/day/$D" \
    | sed -n '/<main>/,$p' \
    | prepend "$HEAD\n" \
    | sed '/\/main/,/\/body/{//!d}' \
    > "./$Y/$D/problem.html"
