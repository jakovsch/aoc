F ← {⊃ ∩ / ∪ ¨ ⊂[2] 2 ((≢ ⍵)÷2) ⍴ ⍵}
G ← {'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' ⍳ ⍵}
H ← {+ / ⍉ {G ⊃ ⍵} ⍵}
R ← H F ⎕FIO[49] 'input.txt'
R
