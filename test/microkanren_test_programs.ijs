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

appendo =: 2 : 0 NB.The secret: the 1st&2nd conj do not take any y here!
((((,0);(,1)) equ x) conj ((((,0);(,2)) equ v) conj (u&(4 : '<''(,1)('',((5!:5)<''x''),'')appendo(,2)('',((5!:5)<''y''),'')'''))) )
)

appendo =: 2 : 0 NB.Probably correct, but fails bc x u c v y must eval to name!
(('' equ x) conj (u equ v)) disj ((((,0);(,1)) equ x) conj ((((,0);(,2)) equ v) conj (u&(4 : '<''(,1)('',((5!:5)<''x''),'')appendo(,2)('',((5!:5)<''y''),'')'''))) )
)

appendo =: 2 : 0
 ns =. cocreate''
 a__ns =. x
 b__ns =. u
 c__ns =. v
 alpha__ns =. call y
 s1 =. fresh y
 beta__ns =. call s1
 s2 =. fresh^:2 y
 gamma__ns =. call s2
((ns&(4 : ' '''' equ a__x y')) conj (ns&(4 : 'b__x equ c__x y'))) disj ((((,0);(,1)) equ x) conj ((ns&(4 : '(alpha__x;gamma__x) equ c__x (fresh^:2 y)')) conj (ns&(4 : '<''('',beta__x,'')('',b__x,'')appendo('',gamma__x,'')('',((5!:5)<''y''),'')''')))) y
)

NB.(,<5) (,<6) appendo (5;6) ES
NB.(<5) (<6) appendo (5;6) ES
NB.(5) (6) appendo (5;6) ES
NB.(5;6) appendo (5;6) ES
NB.((<5);<<6) appendo (5;6) ES
NB.(<3) (<4) appendo (3;4) ES
