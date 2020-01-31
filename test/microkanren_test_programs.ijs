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

appendo =: 2 : 0
u;v;y
NB.ah =.(3 : '<''('',((5!:5)<''d''[d=.call@fresh y),'')('' ',((5!:5)<'s'[s=.u),' '')appendo('',((5!:5)<''res''[res=.call@(fresh^:2) y),'')('',((5!:5)<''sres''[sres=.fresh^:3 y),'')'' ')
 NB.((call y) equ u) conj (3 : ah) y

NB. that's the right lead, persevere!!
ac=.'<('&,((5!:5)<'u')&,');((5!:5)<''res''[res=.call@(fresh^:2) y)' NB.don't touch ac (working model)
ad=.'<('&,((5!:5)<'u')&,');((5!:5)<''res''[res=.call@(fresh^:2) y)'
 (3 : ad) y
)
NB.1 appendo 5 ES

appendo =: 2 : 0 NB.reference: don't touch!
 a =. call y
 d =. call@fresh y
 res =. call@(fresh^:2) y
 ns =. fresh^:3 y NB. y is a state-counter such as ES

 (('' equ x) conj (u equ v)) disj ((a;d) equ x) conj ((a;res) equ v) conj ((<'(',(5!:5 <'d'),')(',(5!:5 <'u'),')appendo(',(5!:5 <'res'),')(',(5!:5 <'ns'),')')"_)
)

(1) (2) appendo (1 2) ES NB.should return a thunk. Possible?
((1) (2) appendo (1 2) ES) '' NB.should return a state/counter

(0 : 0)
APPENDO
-------
+ must be defined as two mutually recursive conjunctions
- takes 3 args
+ lvars a, d, res are (,0) (,1) and (,2)
- hypothesis: l is x, s is u, out is v, state/counter as y
)