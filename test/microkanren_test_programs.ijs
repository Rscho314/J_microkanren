a_and_b =: (3 : '(call y) equ 5 (fresh y)') disj (3 : '(call y) equ 6 (fresh y)')

a_and_b =: 3 : 0
 NB.Are anonymous subverbs definitions authorized??
 lft =. (3 : '(call y) equ 7 (fresh y)')
 rgt =. (3 : '(call y) equ 5 (fresh y)') disj (3 : '(call y) equ 6 (fresh y)')
 
 NB.lft conj rgt y NB.value error: lft
 NB.(lft y) bind rgt NB.value error: rgt
 NB.rgt (0&{:: lft y) NB.yields correct answer...
 NB.(}. lft y) bind rgt NB.yields nil
 NB. (rgt (0&{:: lft y)) mplus '' NB.also correct
 NB.(rgt (0&{:: lft y)) mplus ((}. lft y) bind rgt) NB.correct
)