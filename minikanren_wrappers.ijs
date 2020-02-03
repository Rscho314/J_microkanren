NB.TODO: implement macros if possible
Zzz =: 2 : 0
 ((5!:5)<'u'),((5!:5)<'v')
)
conj_x =: 4 : 0 NB.Would a list of goals always be an array of boxed names?
 if. 1&<@# x
  do. (x`:6) Zzz y NB.single case boxed or not? (verb vs.adverb definition)
 else. ((({.x)`:6) Zzz y) conj ((}.x) conj_x) NB.multiple case is boxed
 end.
)
disj_x =: 4 : 0
 if. 1&<@# x
  do. (x`:6) Zzz y
 else. ((({.x)`:6) Zzz y) disj ((}.x) disj_x)
 end.
)
NB.'fresh' is a problem due to implicit args
conde =: 4 : 0 NB.2D boxed array of named goals
 (x conj_x y) disj_x y
)


ES =: |.@(];((<'')#~])) (0 s:0)
CS =: |.@(];((<'')#~]))
call_goal =: 1 : '(call ES) u (fresh ES)' NB. postfix
pull =: 3 : 0
 if. ''&-:y
  do. y
 elseif. (32&~:@(3!:0)@(0&{::)y)*.(1&=@#y)*.(32&=@(3!:0)y) NB.brittle!
  do. pull@".@(0&{::)y
 else. y
 end.
)
take_all =: 3 : 0
 s =. pull y
 if. ''&-:y
  do. y
 else. ({.s),(take_all (}.s))
 end.
)
take =: 4 : 0
 s =. pull y
 if. 0&= x
  do. ''
 elseif. ''&-:y
  do. y
 else. ,({.s),((<:x) take (}.s))
 end.
)
