a_and_b =: 3 : 0
 (3 : '((call y) equ 5) disj ((call y) equ 6) (fresh y)') conj ((call y) equ 7) (fresh y) 
)

fives =: 4 : 0
 (x equ 5) disj ((<'(',(5!:5 <'x'),')fives(',(5!:5 <'y'),')')"_) y
)

sixes =: 4 : 0
 (x equ 6) disj ((<'(',(5!:5 <'x'),')sixes(',(5!:5 <'y'),')')"_) y
)

fives_and_sixes =: 3 : 0
 (3 : '(call y) fives (fresh y)') disj (3 : '(call y) sixes (fresh y)') y
)

appendo =: 2 : 0 NB.reference, don't touch!
x;u;v;y
 ns =. cocreate''
 a__ns =. call y
 d__ns =. call@fresh y
 res__ns =. call@(fresh^:2) y
 s__ns =. u
 
 ((a__ns;res__ns) equ v) conj (ns&(4 : '<''('',((5!:5)<''d''[d=.d__x),'')('',((5!:5)<''s''[s=.s__x),'')appendo('',((5!:5)<''res''[res=.res__x),'')('',((5!:5)<''y''),'')'' ')) y
)

appendo =: 2 : 0
x;u;v;y
 ns =. cocreate''
 a__ns =. call y
 d__ns =. call@fresh y
 res__ns =. call@(fresh^:2) y
 s__ns =. u
 
  ((a__ns;res__ns) equ v) conj (ns&(4 : '<''('',((5!:5)<''d''[d=.d__x),'')('',((5!:5)<''s''[s=.s__x),'')appendo('',((5!:5)<''res''[res=.res__x),'')('',((5!:5)<''y''),'')'' ')) y
)

NB.(1) (2) appendo (1 2) ES NB.should return a thunk. Possible?
NB.((1) (2) appendo (1 2) ES) ES NB.should return a state/counter
