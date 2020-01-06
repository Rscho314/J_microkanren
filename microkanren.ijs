ERR_MSG_TYPE =: 'ERROR: wrong type'
ES =: 0;~'';''

var =: 3 : 0
 if. (1&=(3!:0) y) +. (4&=(3!:0) y)
  do. if. 0&=@#@$ y
       do. 1$y
      else. ERR_MSG_TYPE
      end.
 else. ERR_MSG_TYPE
 end.
)
varu =: 3 : '(1&=@#@$y) *. (1&=@(3!:0) +. 4&=@(3!:0)) y'
walk =: 4 : 0
 if. (''-:x)
  do. ''
 elseif. (varu x) *. (x e. 0&{::y)
  do. (0&{::(x i.~0&{::y){1&{::y) walk y
 else. x
 end.
)
exts =: 2 : 0
 if. (varu u) *. y -: '';''
  do. (u&, &.> {.y) , ((<v)&, &.> }.y)
 elseif. varu u
  do. (u&, &.> {.y) , (v&; &.> }.y)
 else. ERR_MSG_TYPE
 end.
)
pairu =: 3 : '(0&<@# *. 32&=@(3!:0)) y'
unify =: 2 : 0
 a =. u walk y
 b =. v walk y

 if. (varu a) *. (a -: b)
  do. y
 elseif. varu a
  do. a exts b y
 elseif. varu b
  do. b exts a y
 elseif. (pairu a) *. (pairu b)
  do. (0&{::a) unify (0&{::b) ((}.a) unify (}.b) y)
 elseif. a -: b
  do. y
 else. 0
 end.
)
equ =: 2 : 0
 s =. u unify v (0&{::y)
 if. s ~: 0
  do. <(s ; }.y) NB.should we really box (=unit)??
 else. ''
 end.
)
call =: 3 : 'var 1&{:: y'
fresh =: 3 : '({.y),(>:&.>}.y)'
mplus =: 2 : 0
 if. ((2&=@(3!:0)@((0;0)&{::) *. 32&=@(3!:0)) :: 0)u`''
  do. (v mplus (u''))"_
 elseif. u -: ''
  do. v
 else. ({.u),((}.u) mplus v)
 end.
)
bind =: 2 : 0
 if. ((2&=@(3!:0)@((0;0)&{::) *. 32&=@(3!:0)) :: 0)u`''
  do. ((u'') bind v)"_
 elseif. u -: ''
  do. ''
 else. (v (0&{::u)) mplus ((}.u) bind v)
 end.
)
disj =: 2 : 0
 (u y) mplus (v y)
)
conj =: 2 : 0
 (u y) bind v
)