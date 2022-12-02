: rps 2 1 3 ;
: 3nip nip nip nip ;
: A rps ;
: B rps -rot ;
: C rps -rot -rot ;
: X
    0 pick
    0 + 3nip + ;
: Y
    1 pick
    3 + 3nip + ;
: Z
    2 pick
    6 + 3nip + ;

0
s" input.txt" included
. bye
