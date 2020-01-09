load'~Projects/j_microkanren/release/microkanren.ijs'
load'~Projects/j_microkanren/test/microkanren_test_programs.ijs'

test_var =: 3 : 0
 assert. (1$3) -: var 3
 assert. ERR_MSG_TYPE -: var ''
)

test_varu =: 3 : 0
 assert. 1 -: varu 1$3
 assert. 0 -: varu 1$3.3
 assert. 0 -: varu 'a'
 assert. 0 -: varu ''
)

test_walk =: 3 : 0
 assert. (1$0) -: (1$0) walk '';''
 assert. 5 -: (1$0) walk (0 2 1);<(5;(1$0);'a')
 assert. 5 -: (1$2) walk (0 2 1);<(5;(1$0);'a')
 assert. 'a' -: (1$1) walk (0 2 1);<(5;(1$0);'a')
 assert. '' -: '' walk (0 2 1);<(5;(1$0);'a')
)

test_exts =: 3 : 0
 assert. ERR_MSG_TYPE -: 1 exts 0 '';''
 assert. ((1,'');<(<0),'') -: (1$1) exts 0 '';''
 assert.  ((1 3,'');<(2;'a'),'') -: (1$1) exts 2 (3;<<'a')
 assert. ERR_MSG_TYPE -: 1 exts 2 '';''
 assert. ERR_MSG_TYPE -: '' exts 2 '';''
)

test_walk_exts =: 3 : 0
 assert. 'a' -: (1$4) walk (1$1) exts 2 ((4 3);(<((1$3);'a')))
 assert. 2 -: (1$1) walk (1$1) exts 2 ('';'')
)

test_pairu =: 3 : 0
 assert. pairu (<3),''
 assert. pairu (<''),''
 assert. pairu 3;2
 assert. -. pairu 3
 assert. -. pairu ''
 assert. pairu (<'') NB.CAUTION, this succeeds!
)

test_unify =: 3 : 0
 assert. ((1$0) exts 2 (0&{::ES))-: (1;(1$0);3) unify (1;2;3) (0&{::ES)
)

test_equ =: 3 : 0
 assert. (<(1;~(1$0) exts 5 (0&{::ES))) -: (1$0) equ 5 (1;~('';''))
)

test_call =: 3 : 0
 assert. (1$0) -: call ES
)

test_fresh =: 3 : 0
 assert. (1;~('';'')) -: fresh ES
)

test_conj =: 3 : 0
 assert. (,<(<(<,0),<,<5),<1) -: (call (2 : '((u y) equ 5) conj ((u y) equ 5) (v y)') fresh ES)
 assert. '' -: call (2 : '((u y) equ 5) conj ((u y) equ 6) (v y)') fresh ES
)

test_equ_call_fresh =: 3 : 0
 assert. (<((0,'');<(<5),'');1) -: (3 : '(call y) equ 5 (fresh y)') ES
)

test_2nd_set_t1 =: 3 : 0
 assert. (((0,'');<(<5),'');1) -: 0&{::(3 : '(call y) equ 5 (fresh y)') ES
)

test_2nd_set_t2 =: 3 : 0
 assert. '' -: }.(3 : '(call y) equ 5 (fresh y)') ES
)

test_2nd_set_t3 =: 3 : 0
 assert. ((<(<0 1),<7;5),<2) -: 0&{:: a_and_b ES
)

test_2nd_set_t3_take =: 3 : 0
 assert. (<((<(<0 1),<7;5),<2)) -: {. a_and_b ES
)

test_2nd_set_t4 =: 3 : 0
 assert. ((<(<0 1),<7;6),<2) -: 1&{:: a_and_b ES
)

test_2nd_set_t5 =: 3 : 0
 assert. '' -: 2&}. a_and_b ES
)

test_who_cares =: 3 : 0
 assert. (,<(<(<,0),<,<5),<1) -: (3 : '(call y) fives (fresh y)') ES
)

test_take_2_a_and_b_stream =: 3 : 0
 assert. ((<((<(<0 1),<7;5),<2)),(<((<(<0 1),<7;6),<2))) -: 2&{.a_and_b ES
)

test_take_all_a_and_b_stream =: 3 : 0
 assert. ((<((<(<0 1),<7;5),<2)),(<((<(<0 1),<7;6),<2))) -: _&{.a_and_b ES
)