a_and_b =: 3 : 0
 (3 : '((call y) equ 5) disj ((call y) equ 6) (fresh y)') conj ((call y) equ 7) fresh y
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

appendo =: 2 : 0 NB. reference, don't touch!
 ns =. cocreate''
 a__ns =. call y
 d__ns =. call@fresh y
 res__ns =. call@(fresh^:2) y
 s__ns =. u
 new_state =. fresh^:3 y
 (('' equ x) conj (v equ y)) disj ((a__ns;d__ns) equ x) conj ((a__ns;res__ns) equ v) conj (ns&(4 : '<''('',((5!:5)<''d''[d=.d__x),'')('',((5!:5)<''s''[s=.s__x),'')appendo('',((5!:5)<''res''[res=.res__x),'')('',((5!:5)<''y''),'')'' ')) new_state
)

appendo =: 2 : 0
x;u;v;y
 ns =. cocreate''
 a__ns =. call y
 d__ns =. call@fresh y
 res__ns =. call@(fresh^:2) y
 s__ns =. u
 new_state =. fresh^:3 y
 ((a__ns;res__ns) equ v) conj (ns&(4 : '<''('',((5!:5)<''d''[d=.d__x),'')('',((5!:5)<''s''[s=.s__x),'')appendo('',((5!:5)<''res''[res=.res__x),'')('',((5!:5)<''y''),'')'' ')) new_state
)

appendo =: 2 : 0
x;u;v;y
 ns =. cocreate''
 a__ns =. call y
 d__ns =. call@fresh y
 res__ns =. call@(fresh^:2) y
 s__ns =. u
 NB.(('' equ x) conj (u equ v)) disj ((a__ns;d__ns) equ v) conj ((a__ns;res__ns) equ v) conj (ns&(4 : '<''('',((5!:5)<''d''[d=.d__x),'')('',((5!:5)<''s''[s=.s__x),'')appendo('',((5!:5)<''res''[res=.res__x),'')('',((5!:5)<''y''),'')'' ')) (fresh^:3 y)
 step1 =. ((a__ns;res__ns) equ v) conj (ns&(4 : '<''('',((5!:5)<''d''[d=.d__x),'')('',((5!:5)<''s''[s=.s__x),'')appendo('',((5!:5)<''res''[res=.res__x),'')('',((5!:5)<''y''),'')'' ')) (fresh^:3 y)
 step2 =. ((a__ns;d__ns) equ x) conj step1 (fresh^:2 y)
 NB.step3 =. (('' equ x) conj (u equ v)) disj step2 (fresh y)
)
NB.(,<5) (,<6) appendo (5;6) ES
NB.(<5) (<6) appendo (5;6) ES
NB.(5) (6) appendo (5;6) ES

NB.(5) (6) appendo (5 6) ES
NB.(<5) (<6) appendo (5 6) ES
NB.(,<5) (,<6) appendo (5 6) ES
