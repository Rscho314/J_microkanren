fail =: (3 : 'assert. 0:y')
var =: fail`(s:@<@('v'&,)@":)@.(0&=@#@$ *. (1&= +. 4&=)@(3!:0))
varu =:  ((5 s:_6 s:i.0 s:0)e.~]) +. 'symbol'&-:@datatype
walk =: 4 : 0
 if. ''-:x
  do. ''
 elseif. varu x
  do. (0&{::(6 s:s:x)&{y) walk y
 else. x
 end.
)
exts =: 2 : 0
 if. varu u
  do. (<v)(6 s:s:u)}y
 else. fail ''
 end.
)
pairu =: 0&<@# *. 32&=@(3!:0)
unify =: 2 : 0
 a =. u walk y
 b =. v walk y
 if. (varu a) *. (a-:b)
  do. y
 elseif. varu a
  do. a exts b y
 elseif. varu b
  do. b exts a y
 elseif. (pairu a) *. (pairu b)
  do. (0&{::a) unify (0&{::b) ((}.a) unify (}.b) y)
 elseif. a-:b
  do. y
 else. 0
 end.
)
equ =: 2 : 0
 s =. u unify v (0&{::y)
 if. s ~: 0
  do. <(s ; }.y)
 else. ''
 end.
)
call =: var@(1&{::)
fresh =: {.,{.@:(>:@:]&.>{:)
mplus =: 2 : 0
 if. u-:''
  do. v
 elseif. (1&=@# *. 32&~:@(3!:0)@>) u NB.brittle!
  do.<'(',((5!:5)<'v'),') mplus (',((5!:5)<'a'[a=.".@(0&{::) u),')'
 else. ({.u),((}.u) mplus v)
 end.
)
bind =: 2 : 0
smoutput u
smoutput v
 if. u-:''
  do. ''
 elseif. (1&=@# *. 32&~:@(3!:0)@>) u NB.brittle!
  do. <'(',((5!:5)<'a'[a=.".@(0&{::) u),') bind (',((5!:5)<'v'),')'
 else. (v@(0&{::) u) mplus ((}.u) bind v)
 end.
)
disj =: 2 : 0
 (u y) mplus (v y)
)
conj =: 2 : 0
 (u y) bind v
)
