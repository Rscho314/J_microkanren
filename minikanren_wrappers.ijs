NB.TODO: implement macros if possible
ES =: 0;~'';''
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
