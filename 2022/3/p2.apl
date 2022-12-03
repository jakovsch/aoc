F ← {⊃ ∩ / ∪ ¨ ⍵}
G ← {'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' ⍳ ⍵}
H ← {+ / ⍉ {G ⊃ ⍵} ⍵}
IN ← ⎕FIO[49] 'input.txt'
R ← H F ((≢ IN)÷3) 3 ⍴ IN
R
