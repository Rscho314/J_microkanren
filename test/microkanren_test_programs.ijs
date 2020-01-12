a_and_b =: 3 : 0
 (3 : '((call y) equ 5) disj ((call y) equ 6) (fresh y)') conj ((call y) equ 7) (fresh y) 
)

fives =: 4 : 0
 (('(',(5!:5 <'x'),')fives(',(5!:5 <'y'),')')"_) disj (x equ 5) y
)

sixes =: 4 : 0
 (('(',(5!:5 <'x'),')','sixes','(',(5!:5 <'y'),')')"_) disj (x equ 6) y
)

fives_and_sixes =: 3 :0
 ((call y) fives (fresh y)) disj ((call y) sixes (fresh y))
)

NB. fails
NB.fives_and_sixes ES