a_and_b =: 3 : 0
 (3 : '((call y) equ 5) disj ((call y) equ 6) (fresh y)') conj ((call y) equ 7) (fresh y) 
)

fives =: 4 : 0
 c =. x
 f =. y
 (('(',(5!:5 <'c'),')','fives','(',(5!:5 <'f'),')')"_) disj (x equ 5) y
)
