fail =: 3 : 'assert. 0:y'
gensym =: 3 : 0
 curns =. coname''
 nms =. <''
 locs =. conl 0
 for_ijk. locs
  do. nms=.(nl''),nms[(18!:4) ijk
 end.
 (18!:4) curns
 y"_`fail@.((<,y)&e. +. (<y)&e.) nms
)
varu =: 1&=@# *. ('v'&-:@((0;0)&{::) *. 32&=@(3!:0))
var =: fail`gensym@.varu
walk =: 4 : 0
 if. ''-:x
  do. ''
 elseif. (varu x) *. (x e. 0&{::y)
  do. (0&{::(x i.~0&{::y){1&{::y) walk y
 else. x
 end.
)
exts =: 2 : 0
 (u&, &.> {.y) , ((<v)&, &.> }.y)
)
pairu =: 0&<@#@$ *. 32&=@(3!:0)
unify =: 2 : 0
 a =. u walk y
 b =. v walk y
 if. (''&-:a) *. (''&-:b)
  do. y
 elseif. (varu a) *. (a-:b)
  do. y
 elseif. varu a
  do. a exts b y
 elseif. varu b
  do. b exts a y
 elseif. (pairu a) *. (pairu b)
  do. ({.a) unify ({.b) ((}.a) unify (}.b) y)
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
call =: var@<@('v'&,)@":@(1&{::)
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
