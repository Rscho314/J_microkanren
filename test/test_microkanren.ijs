load'~Projects/j_microkanren/release/microkanren.ijs'
load'~Projects/j_microkanren/test/microkanren_test_programs.ijs'

test_var =: 3 : 0
 assert. (s:<'v3')&-: var 3
 assert. (s:<'v4')&-: var 4
)

test_varu =: 3 : 0
 assert. varu <'v3'
 assert. varu@var 4
 assert. varu (5 s: var 4)
)

test_exts =: 3 : 0
 assert. ('';0;'') -: (5 s: var 3) exts 0 (}:@CS 0 s: 0)
 assert. ('';0;1) -: (5 s: var 4) exts 1 (5 s: var 3) exts 0 (}:@CS 0 s: 0)
 assert. ('';0;1) -: (<'v4') exts 1 (<'v3') exts 0 (}:@CS 0 s: 0)
)

test_walk =: 3 : 0
 assert. ''&-:'' walk (}:@CS 0 s: 0)
 assert. 0&-:(5 s: var 3) walk (5 s: var 3) exts 0 (}:@CS 0 s: 0)
 assert. 0&-:(5 s: var 4) walk (5 s: var 4) exts (5 s: var 3) (5 s: var 3) exts 0 (}:@CS 0 s: 0)
 assert. 0&-:(<'v4') walk (<'v4') exts (<'v3') (<'v3') exts 0 (}:@CS 0 s: 0)
)

test_pairu =: 3 : 0
 assert. pairu (<3),''
 assert. pairu (<''),''
 assert. pairu 3;2
 assert. pairu 5 s: s: 'v3';'v4'
 assert. -. pairu s: 'v3';'v4' NB.CAUTION, pairs are boxed
 assert. -. pairu 3
 assert. -. pairu ''
 assert. -. pairu s:<'v4'
 assert. pairu (<'') NB.CAUTION, this succeeds!
)
