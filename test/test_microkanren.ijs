load'~Projects/j_microkanren/release/microkanren.ijs'
load'~Projects/j_microkanren/test/microkanren_test_programs.ijs'

test_var =: 3 : 0
 assert. (1$3) -: var 3
)

test_varu =: 3 : 0
 assert. 1 -: varu (,3)
 assert. 0 -: varu (,3.3)
 assert. 0 -: varu 'a'
 assert. 0 -: varu ''
)

test_walk =: 3 : 0
 assert. (,0) -: (,0) walk ('';~0)
 assert. 5 -: (,0) walk 0;(0 2 1);5;(,0);'a'
 assert. 5 -: (,2) walk 0;(0 2 1);5;(,0);'a'
 assert. 'a' -: (,1) walk 0;(0 2 1);5;(,0);'a'
 assert. '' -: '' walk 0;(0 2 1);5;(,0);'a'
)

test_exts =: 3 : 0
 assert. (0;(,1);0) -: (,1) exts 0 ('';~0)
 assert. (0;3 1;'a';2) -: (,1) exts (2) (,3) exts 'a' ('';~0)
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
 assert. (0;(,0);2)-: (1;(1$0);3) unify (1;2;3) ('';~0)
 assert. 0&-: ((,5);3) unify ((,6);4) ('';~0)
 assert. 0&-: (3;(,5)) unify (4;(,6)) ('';~0)
 assert. (0;5 6;4;3)&-: (3;(,5)) unify ((,6);4) ('';~0)
)

test_equ =: 3 : 0
 assert. (<1;(,0);5) -: (,0) equ 5 ('';~1)
)

test_call =: 3 : 0
 assert. (,0) -: call ('';~0)
)

test_fresh =: 3 : 0
 assert. ('';~1) -: fresh ('';~0)
)

test_equ_call_fresh =: 3 : 0
 assert. (<1;(,0);5) -: (3 : '(call y) equ 5 (fresh y)') ('';~0)
)

test_fives_and_sixes =: 3 : 0
 assert. ((1;(,0);5);(1;(,0);6);(<1;(,0);5))&-:3 take fives_and_sixes ('';~0)
)

test_2nd_set_t1 =: 3 : 0
 assert. (1;(,0);5)&-: 0&{::(3 : '(call y) equ 5 (fresh y)') ('';~0)
)

test_2nd_set_t2 =: 3 : 0
 assert. ''&-: }.(3 : '(call y) equ 5 (fresh y)') ('';~0)
)

test_2nd_set_t3 =: 3 : 0
 assert. (2;1 0;5;7)&-: 0&{:: a_and_b ('';~0)
)

test_2nd_set_t3_take =: 3 : 0
 assert. (,<2;1 0;5;7)&-: 1 take a_and_b ('';~0)
)

test_2nd_set_t4 =: 3 : 0
 assert. (2;1 0;6;7)&-: 0&{:: }. a_and_b ('';~0)
)

test_2nd_set_t5 =: 3 : 0
 assert. ''&-: }.^:2 a_and_b ('';~0)
)

test_who_cares =: 3 : 0
 assert. (,<1;(,0);5)&-: 1 take (3 :'(call y) fives fresh y') ('';~0)
)

test_take_2_a_and_b_stream =: 3 : 0
 assert. ((2;1 0;5;7);<(2;1 0;6;7))&-: 2 take a_and_b ('';~0)
)

test_take_all_a_and_b_stream =: 3 : 0
 assert. ((2;1 0;5;7);<(2;1 0;6;7))&-: take_all a_and_b ('';~0)
)