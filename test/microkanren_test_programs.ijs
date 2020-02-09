a_and_b =: 3 :'(3 : ''((call y) equ 5) disj ((call y) equ 6) (fresh y)'') conj ((call y) equ 7) (fresh y)'

fives =: 4 :'(x equ 5) disj ((<''('',(5!:5 <''x''),'')fives('',(5!:5 <''y''),'')'')"_) y'

sixes =: 4 :'(x equ 6) disj ((<''('',(5!:5 <''x''),'')sixes('',(5!:5 <''y''),'')'')"_) y'

fives_and_sixes =: 3 :'(3 : ''(call y) fives (fresh y)'') disj (3 : ''(call y) sixes (fresh y)'') y'

appendo =: 2 : 0
 a =. call y
 d =. call@fresh y
 res =. call@(fresh^:2) y
 e =. ((5!:5)<'u')
 f =. ((5!:5)<'d')
 g =. ((5!:5)<'res')
 s =. '<''(',f,')(',e,') appendo (',g,')('',((5!:5)<''y''),'')'''
 (('' equ x) conj (u equ v)) disj (((a;d) equ x) conj (((a;res) equ v) conj (3 : s))) y
)

(5) (6) appendo (5;6) ('';~0)
(<5) (<6) appendo (5;6) ('';~0)
(,<5) (,<6) appendo (5;6) ('';~0)