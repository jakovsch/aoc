: rps 6 0 3 ;
: 3nip nip nip nip ;
: A 1 ;
: B 2 ;
: C 3 ;
: X
    rps
    3 roll
    1 - pick
    1 + 3nip + ;
: Y
    rps rot
    3 roll
    1 - pick
    2 + 3nip + ;
: Z
    rps rot rot
    3 roll
    1 - pick
    3 + 3nip + ;

0
s" input.txt" included
. bye
