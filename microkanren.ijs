var =: 1&$
varu =: *./@((1&=@#)`(1&=@#@$)`((1&= +. 4&=)@(3!:0))`:0)
walk =: ([`(]$:~]{::~(>:^:2@i.~1&{::))@.(*./@,@(varu@[`(e.1&{::)`:0)) :: 0)
exts =: 2 :'(<v),~{.,<@(u,~1&{::),2&}.'
pairu =: *./@,@((0&<@#)`(32&=@(3!:0))`:0)
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
 elseif. do. 0
 end.
)

equ =: 2 : '(<@(u unify v))`(''''"_)@.(0&-:@(u unify v))y'
call =: var@(0&{::)
fresh =: 3 : '(>:&.>0{y)0}y'
procu =: *./@,@((2&=@(3!:0)@>)`(32&=@(3!:0))`(1&=@#)`:0)
mplus =: 2 : 0
 if. u-:''
  do. v
 elseif.  procu u
  do. <'(',((5!:5)<'v'),') mplus (',((5!:5)<'a'),')'[a =. ".@(0&{::) u
 elseif. do. ({.u),((}.u) mplus v)
 end.
)
bind =: 2 : 0
 if. u-:''
  do. ''
 elseif. procu u
  do. <'(',((5!:5)<'a',') bind (',((5!:5)<'v'),')'[a=.".@(0&{::) u)
 elseif. do. (v@(0&{::) u) mplus ((}.u) bind v)
 end.
)
disj =: 2 : '(u y) mplus (v y)'
conj =: 2 : '(u y) bind v'
