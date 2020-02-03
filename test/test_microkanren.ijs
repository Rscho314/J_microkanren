load'~Projects/j_microkanren/release/microkanren.ijs'
load'~Projects/j_microkanren/test/microkanren_test_programs.ijs'

test_var =: 3 : 0
 assert. (<'v0') -: var <'v0'
)

test_varu =: 3 : 0
 assert. 0 -: varu 1$3
 assert. 0 -: varu 1$3.3
 assert. 0 -: varu 'a'
 assert. 0 -: varu 'v'
 assert. 0 -: varu 'v1'
 assert. 1 -: varu <'v1'
)

test_exts =: 3 : 0
 assert. (((<'v0'),'');<(<0),'') -: (<'v0') exts 0 '';''
 assert. (((<'v0'),'');<(<<'v1'),'') -: (<'v0') exts (<'v1') '';''
 assert. (('v1';'v0');<((<'v0');0),'') -: (<'v1') exts (<'v0') (<'v0') exts 0 '';''
 assert. (('v1';'v0');<((<'v0');(<<'v1')),'') -: (<'v1') exts (<'v0') (<'v0') exts (<'v1') '';''
)

test_walk =: 3 : 0
 assert. (<'v0') -: (<'v0') walk '';''
 assert. 0 -: (<'v0') walk (((<'v0'),'');<(<0),'')
 assert. 0 -: (<'v1') walk (('v1';'v0');<((<'v0');0),'')
 assert. 'a' -: 'a' walk (('v1';'v0');<((<'v0');0),'')
 assert. '' -: '' walk (('v1';'v0');<((<'v0');0),'')
)

test_pairu =: 3 : 0
 assert. pairu (<3),''
 assert. pairu (<''),''
 assert. pairu 3;2
 assert. pairu 'v0';'v1'
 assert. -. pairu 3
 assert. -. pairu ''
 assert. -. pairu (<'')
)

test_unify =: 3 : 0
 assert. ((<'v0') exts (<2) (0&{::ES))-: (1;'v0';3) unify (1;2;3) (0&{::ES)
)

test_equ =: 3 : 0
 assert. (<(1;~(<'v0') exts 5 (0&{::ES))) -: (<'v0') equ 5 (1;~('';''))
)

test_call =: 3 : 0
 assert. (<'v0') -: call ES
)

test_fresh =: 3 : 0
 assert. (1;~('';'')) -: fresh ES
)

test_conj =: 3 : 0
 assert. (,<(<(<,<'v0'),<,<5),<1)-:call (2 : '((u y) equ 5) conj ((u y) equ 5) (v y)') fresh ES
 assert. '' -: call (2 : '((u y) equ 5) conj ((u y) equ 6) (v y)') fresh ES
)

test_2nd_set_t1 =: 3 : 0
 assert. (((,<'v0');<(<5),'');1) -: 0&{::(3 : '(call y) equ 5 (fresh y)') ES
)

test_2nd_set_t2 =: 3 : 0
 assert. '' -: }.(3 : '(call y) equ 5 (fresh y)') ES
)

test_2nd_set_t3 =: 3 : 0
 assert. ((<(<'v0';'v1'),<7;5),<2) -: 0&{:: a_and_b ES
)

test_2nd_set_t3_take =: 3 : 0
 assert. (<(<(<'v0';'v1'),<7;5),<2) -: {. a_and_b ES
 assert. (,<(<(<'v0';'v1'),<7;5),<2) -: 1 take a_and_b ES
)

test_2nd_set_t4 =: 3 : 0
 assert. ((<(<'v0';'v1'),<7;6),<2) -: 1&{:: a_and_b ES
)

test_2nd_set_t5 =: 3 : 0
 assert. '' -: 2&}. a_and_b ES
)

test_who_cares =: 3 : 0
 assert. (,<(<(<,<'v0'),<,<5),<1) -: 1 take (call ES) fives (fresh ES)
 assert. (,~<(<(<,<'v0'),<,<5),<1) -: 2 take (call ES) fives (fresh ES)
 assert. ((,<(<(<,<'v0'),<,<5),<1),(,<(<(<,<'v0'),<,<6),<1))-:2 take fives_and_sixes ES
)

test_take_2_a_and_b_stream =: 3 : 0
 assert. ((<(<(<'v0';'v1'),<7;5),<2),(<(<(<'v0';'v1'),<7;6),<2))-:2&{.a_and_b ES
 assert. ((<(<(<'v0';'v1'),<7;5),<2),(<(<(<'v0';'v1'),<7;6),<2))-:2 take a_and_b ES
)

test_take_all_a_and_b_stream =: 3 : 0
 assert. ((<(<(<'v0';'v1'),<7;5),<2),(<(<(<'v0';'v1'),<7;6),<2))-:_&{.a_and_b ES
 assert. ((<(<(<'v0';'v1'),<7;5),<2),(<(<(<'v0';'v1'),<7;6),<2))-:take_all a_and_b ES
)