/+  goon, *etui, goon-lib, default-agent
|%
++  inc-mod
  |=  [x=@ud len=@ud]
  ?:  =(+(x) len)
    0
  +(x)
++  dec-mod
  |=  [x=@ud len=@ud]
  ?.  =(0 x)
    (dec x)
  (dec len)
++  drop-r
  |*  =(list)
  =.  list  (flop list)
  ?~  list  ~
  (flop t.list)
::
++  snug
  |*  [a=@ b=(list)]
  ^-  (unit _?>(?=(^ b) i.b))
  ?~  b
    ~
  ?:  =(a 0)
    `i.b
  $(a (dec a), b t.b)
+$  card  card:agent:gall
++  is-ascii-num
  |=  a=@
  &((lte a 57) (gte a 49))
++  from-ascii-num
  |=  a=@
  `@ud`(sub a 48)
++  slav
  |=  [p=@ta q=@t]
  ?.  =(p %f)
    (^slav p q)
  ?:  =('&' q)
    &
  ?:  =('|' q)
    |
  !!
+$  sack
  $:  =dude:gall
      =path
      scope=_[w=80 h=40]
      editing=(unit cord)
      curr=(list goad:goon)
  ==
::
+$  sock
  $:  sel=@ud
      bros=(list dude:gall)
      scope=_[w=80 h=40]
       ~
  ==
::
+$  state-0
  $:  sacks=(map @ta sack)
      socks=(map @ta sock)
      ~
  ==
+$  action
  $%  [%connect p=@ta q=dude:gall]
  ==
--
=|  state-0
=*  state  -
=>
  |_  [=bowl:gall cards=(list card)]
  ++  abet
    [(flop cards) state]
  ++  main  .
  ++  emit  |=(=card main(cards [card cards]))
  ++  dill-poke
    |=  [ses=@ta belt=dill-belt:dill]
    ?:  (~(has by sacks) ses)
      ~&  %sack
      sa-abet:(sa-belt:(sa-abed:sa-core ses) belt)
    ~&  %sock
    ~&  belt/belt
    so-abet:(so-belt:(so-abed:so-core ses) belt)
  ++  dill-watch
    |=  ses=@ta
    =/  =sock  [0 ~ [80 40] ~]
    =.  socks  (~(put by socks) ses sock)
    so-abet:so-init:(so-abed:so-core ses)
  ::
  ++  on-agent
    |=  [=(pole knot) =sign:agent:gall]
    ^+  main
    ?+    pole  ~|(weird-agent-take/pole !!)
        [%sack ses=@ t=*]
      sa-abet:(sa-agent-sign:(sa-abed:sa-core ses.pole) t.pole sign)
    ==
  ++  so-core
    |_  [id=@ta =sock]
    ++  so-abet
      main(socks (~(put by socks) id sock))
    ++  so-abed
      |=  i=@ta
      so-core(id i, sock (~(got by socks) i))
    ++  so-core  .
    ++  so-blit
      |=  =blit:dill
      =/  =cage  dill-blit+!>(blit)
      =/  card   [%give %fact ~[/dill/[id]] cage]
      =.  main  (emit card)
      so-core
    ++  so-bell
      (so-blit bel/~)
    ++  so-belt
      |=  belt=dill-belt:dill
      ^+  so-core
      ~&  belt/belt
      ?+  belt  so-bell
        [%hey ~]  so-core
        [%yow *]  so-draw
        [%cru *]  ~&(%error so-core)
        [%aro %u]  so-draw(sel.sock (dec-mod sel.sock (lent bros.sock)))
        [%aro %d]  so-draw(sel.sock (inc-mod sel.sock (lent bros.sock)))
        [%rez *]   so-core(scope.sock [p q]:belt)
      ==
    ::
    ++  so-desks
      ^-  (set desk)
      =-  ~&(desks/- -)
      =-  ~(key by -)
      .^  (map desk *)
        /gx/(scot %p our.bowl)/hood/(scot %da now.bowl)/kiln/pikes/noun
      ==
    ::
    ++  so-update-bros
      =-  so-core(bros.sock -)
      ^-  (list dude:gall)
      =-  ~&(dudes/- -)
      %-  zing
      %+  turn  ~(tap in so-desks)
      |=  =desk
      ^-  (list ^desk)
      =-  (turn - head)
      =-  ~(tap in -)
      .^  (set [=dude:gall liv=?])
        %ge
        /(scot %p our.bowl)/[desk]/(scot %da now.bowl)
      ==
    ::
    ++  so-init  
      ~&  'foo'
      ~&  desks/so-desks
      =.  so-core
        so-update-bros
      so-draw
    ++  so-draw
      ^+  so-core
      =/  ls=(list dude:gall)  :: todo: unstub
        bros.sock
      =/  zo   (zo-apex:zo [0 0] scope.sock)
      =|  y=@ud
      |-
      ?~  ls
        (so-blit zo-abet:zo)
      =/  =stye
        :_  [~ ~]
        ?.  =(y sel.sock)
          ~
        (silt %un ~)
      =.  zo  (zo-stub:zo [0 y] ~[[stye (tuba (trip i.ls))]])
      $(y +(y), ls t.ls)
    --
  ++  sa-core
    |_  [id=@ta =sack]
    ++  sa-abet
      main(sacks (~(put by sacks) id sack))
    ++  sa-abed
      |=  i=@ta
      sa-core(id i, sack (~(got by sacks) i))
    ++  sa-core  .
    ++  sa-fill
      =-  sa-core(curr.sack ~[-])
      .^  goad:goon
          %gx 
          /(scot %p our.bowl)/[dude.sack]/(scot %da now.bowl)/goon/noun
      ==
    ++  sa-thugs  ~(. thug:goon-lib curr.sack)
    ++  sa-dock   [our.bowl dude.sack]
    ++  sa-init   sa-watch
    ++  sa-area  `wire`/sack/[id]
    ++  sa-watch
      =.  main  (emit %pass (snoc sa-area %watch) %agent sa-dock %watch /goon)
      sa-core
    ::
    ++  sa-stab
      |=  =blade:goon
      =/  =cage  goon-stab+!>(`stab:goon`[path.sack blade])
      =/  =wire  (snoc sa-area %poke)
      =.  main   (emit %pass wire %agent sa-dock %poke cage)
      sa-core
    ::  TODO: actually cleanup
    ++  sa-cleanup
      |=  =tang
      %-  (slog leaf/"goon: unrecoverable error, cleaning up" tang)
      sa-core
    ::
    ++  sa-agent-sign
      |=  [=wire =sign:agent:gall]
      ?+    wire  ~|(sa-bad-agent-sign/wire !!)
          [%watch ~]
        ?+    -.sign  ~|(sa-bad-watch-sign/-.sign !!)
            %watch-ack
          ?~  p.sign  sa-draw:sa-fill
          (sa-cleanup leaf/"nacked /goon subscription" u.p.sign)
        ::
            %fact
          ?>  =(%goon-redraw p.cage.sign)
          sa-draw:sa-fill
        ==
      ::
          [%poke ~]
        ?>  ?=(%poke-ack -.sign)
        ?^  p.sign
          %-  (slog leaf/"nacked stab" u.p.sign)
          sa-core
        sa-draw:sa-fill
      ==
    ++  sa-belt
      |=  belt=dill-belt:dill
      ^+  sa-core
      ?+  belt  (sa-user-belt belt)
      ::
          [%yow *]  sa-draw
          [%cru *]  ~&(%error sa-draw)
          [%rez *]  (sa-size [p q]:belt)
      ==
    ::
    ++  sa-size
      |=  =size
      sa-core(scope.sack size)
    ++  sa-geo
      |%
      ++  status  4
      --
    ::
    ++  sa-edit-belt
      |=  [input=@t belt=dill-belt:dill]
      ?@  belt
        =/  new-value=cord
          (crip (tufa (snoc (tuba (trip input)) belt)))
        =.  editing.sack  `new-value
        sa-draw
      ?:  ?=([%bac ~] belt)
        =.  editing.sack
          `(crip (tufa (drop-r (tuba (trip input)))))
        sa-draw
      ~&  funny-belt/belt
      ?:  ?=([%ret ~] belt)
        (sa-finalize-edit input)
      sa-core
    ::
    ++  sa-finalize-edit
      |=  input=@t
      =/  =goad:goon  (need (get:sa-thugs path.sack))
      =/  new-val=iota:goon
        =/  val  (need ~(value has:goon q.goad))
        ?@  val  input
        [p.val (slav p.val input)]
      =/  add=?  ~(add has:goon q.goad)
      =.  editing.sack  ~
      sa-draw:(sa-stab ?:(add [%add new-val] [%edit new-val]))
    ::
    ++  sa-poke-agent
      |=  =iota:goon
      sa-core
    ::
    ++  sa-belt-ret
      =/  =goad:goon  (need (get:sa-thugs path.sack))
      ?>  |(~(add has:goon q.goad) ~(edit has:goon q.goad))
      =.  editing.sack
        `*@t
      sa-draw
    ::
    ++  sa-user-belt
      |=  belt=dill-belt:dill
      ?^  editing.sack 
        (sa-edit-belt u.editing.sack belt)
      ?:  =([%ret ~] belt)
        sa-belt-ret
      ?:  &(?=(@ belt) (is-ascii-num belt))
        (sa-act-belt (from-ascii-num belt))
      =;  pax=(unit path)
        ?^  pax
          sa-draw(path.sack u.pax)
        (sa-blit bel/~)
      ~&  belt/`*`belt
      ?+  belt  `path.sack
        %j  `(move:sa-thugs path.sack |)
        %k  `(move:sa-thugs path.sack &)
        %l  (sink:sa-thugs path.sack)
        %h  `(soar:sa-thugs path.sack)
      ==
    ::
    ++  sa-act-belt
      |=  idx=@ud
      ~&  sa-act-belt/idx
      ?~  god=(get:sa-thugs path.sack)
        ~|  atheist-path/path.sack  !! :: TODO: fix
      ?~  act=(snug (dec idx) ~(act has:goon q.u.god))
        sa-core
      ~&  act/q.u.act
      (sa-stab %act p.u.act)
    ::
    ++  sa-blit
      |=  =blit:dill
      =/  =cage  dill-blit+!>(blit)
      =/  card   [%give %fact ~[/dill/[id]] cage]
      =.  main  (emit card)
      sa-core
    ::
    ++  sa-draw
      =/  tree=blit:dill  sa-draw-tree
      =/  stat=blit:dill  sa-draw-status
      (sa-blit [%mor ~[hop/0 clr/~ tree stat]])
    ++  sa-draw-status
      ^-  blit:dill
      ?~  god=(get:sa-thugs path.sack)
        mor/~
      =/  zo   (zo-apex:zo [[0 0] [w.scope.sack status:sa-geo]])
      =/  ifo  ~(info has:goon q.u.god)
      =/  acts  ~(act has:goon q.u.god)
      =/  edit  ~(edit has:goon q.u.god)
      =.  zo  
        ?^  ifo
          (zo-cord:zo [0 0] u.ifo)
        (zo-cord:zo [0 0] (crip (reap (dec w.scope.sack) ' ')))
      =.  zo
        =/  =spot  [0 1]
        =.  zo
          (zo-cord:zo spot 'actions: ')
        =.  x.spot  (add x.spot 10)
        =/  act-idx=@ud  1
        |-  
        ?~  acts  zo
        =/  info
          (rap 3 '(' (crip "{(scow %ud act-idx)}") ') ' info.q.i.acts ' | ' ~)
        =.  zo
          (zo-cord:zo spot info)
        =.  x.spot  (add x.spot (met 3 info))
        $(acts t.acts, act-idx +(act-idx))
      =?  zo  ?=(^ editing.sack)
        (zo-cord:zo [0 2] (cat 3 'new value: ' u.editing.sack))
      =.  zo
        (zo-cord:zo [0 (dec status:sa-geo)] (crip (reap (dec w.scope.sack) '-')))
      zo-abet:zo
    ++  sa-draw-tree
      =|  nex=(list goad:goon)
      =|  =spot
      =|  idx=@ud
      =|  curr-wid=@ud
      =|  path-idx=(list @ud)
      =/  children=(list goad:goon)  curr.sack
      =/  zo  (zo-apex:zo [[0 status:sa-geo] [w.scope.sack (sub h.scope.sack status:sa-geo)]])
      |-  
      ^-  blit:dill
      =*  goad  i.children
      =/  is-highlighted=?
        ?&  ?=(^ path.sack)
            ?=(^ children)
            =(i.path.sack (scod:goon p.i.children))
        ==
      =?  nex  ?&(?=(^ children) is-highlighted)
        r.i.children
      ?~  children
        ?~  nex  zo-abet:zo
        %=  $
          children   nex
          nex        ~
          path.sack  ?~(path.sack ~ t.path.sack)
          spot       [:(add 2 x.spot curr-wid) 0]
          curr-wid   0
        ==
      ?~  val=(rndr:goon-lib q.goad)
        $(children t.children)
      =.  curr-wid  (max curr-wid (met 3 u.val))
      =.  zo  
        ?:  ~(add has:goon q.goad)
          =/  =stye  
            :-  ?:(is-highlighted (silt %un ~) ~)
            [~ [0xdd.dddd 0xdd.dddd 0xdd.dddd]]
          (zo-stub:zo spot ~[[stye (tuba (trip u.val))]])
          
        ?.  is-highlighted 
          (zo-cord:zo spot u.val)
        =/  =stye  [(silt %un ~) ~ ~]
        (zo-stub:zo spot ~[[stye (tuba (trip u.val))]])
      $(children t.children, y.spot +(y.spot))
    --
  --
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    main  ~(. +> [bowl ~])
++  on-init
  `this
++  on-save  !>(state)
++  on-load
  |=  =vase
  =+  !<(old=state-0 vase)
  `this(state old)
++  on-poke
  |=  [=mark =vase]
  |^  ^-  (quip card _this)
  =^  cards  state
    ?+  mark  ~|(bad-mark/mark !!)
      %goon-cli-action  (on-action !<(action vase))
      %dill-poke        (on-dill-poke !<([@ta dill-belt:dill] vase))
    ==
  [cards this]
  ::
  ++  on-action
    |=  act=action 
    !!
  ++  on-dill-poke
    |=  [ses=@ta belt=dill-belt:dill]
    ^-  (quip card _state)
    abet:(dill-poke:main ses belt)
  --
++  on-watch
  |=  =(pole knot)
  ^-  (quip card _this)
  ?.  ?=([%dill ses=@ ~] pole)
    (on-watch:def pole)
  =^  cards  state
    abet:(dill-watch:main ses.pole)
  [cards this]
::
++  on-peek  on-peek:def
++  on-agent  
  |=  [=wire =sign:agent:gall]
  =^  cards  state
    abet:(on-agent:main wire sign)
  [cards this]
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
++  on-leave  on-leave:def
--
