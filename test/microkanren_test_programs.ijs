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
 (3 : '(call y) fives (fresh y)') disj (3 : '(call y) sixes (fresh y)') y
)


threes =: 4 : 0
 (x equ 3) disj ((<'(',(5!:5 <'x'),')threes(',(5!:5 <'y'),')')"_) y
)

fours =: 4 : 0
 (x equ 4) disj ((<'(',(5!:5 <'x'),')fours(',(5!:5 <'y'),')')"_) y
)

threes_and_fours =: 3 : 0
 (3 : '(call y) threes (fresh y)') disj (3 : '(call y) fours (fresh y)') y
)

NB. fails
NB.5 take threes_and_fours ES