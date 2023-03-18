/+  goon, *etui, goon-lib, default-agent
|%
+$  card  card:agent:gall
++  slav
  |=  [p=@ta q=@t]
  ?.  =(p %f)
    (slav p q)
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
  ==
+$  state-0
  $:  sacks=(map @ta sack)
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
    sa-abet:(sa-belt:(sa-abed:sa-core ses) belt)
  ++  dill-watch
    |=  ses=@ta
    =/  =sack  [%pals /pals [80 40] ~]
    =.  sacks  (~(put by sacks) ses sack)
    sa-abet:sa-init:(sa-abed:sa-core ses)
  ++  sa-core
    |_  [id=@ta =sack]
    ++  sa-abet
      main(sacks (~(put by sacks) id sack))
    ++  sa-abed
      |=  i=@ta
      sa-core(id i, sack (~(got by sacks) i))
    ++  sa-core  .
    ++  sa-peek
      .^  goad:goon
          %gx 
          /(scot %p our.bowl)/[dude.sack]/(scot %da now.bowl)/goon/noun
      ==
    ++  sa-thugs  ~(. thug:goon-lib ~[sa-peek])
    ++  sa-init
      sa-draw
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
      =.  editing.sack  ~
      sa-draw:(sa-poke-agent new-val)
    ::
    ++  sa-poke-agent
      |=  =iota:goon
      ~&  poke-agent/[path.sack iota]
      sa-core
    ::
    ++  sa-belt-ret
      =/  =goad:goon  (need (get:sa-thugs path.sack))
      ?>  ~(edit has:goon q.goad)
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
      =;  pax=(unit path)
        ?^  pax
          sa-draw(path.sack u.pax)
        (sa-blit bel/~)
      ?+  belt  `path.sack
        %j  `(move:sa-thugs path.sack |)
        %k  `(move:sa-thugs path.sack &)
        %l  (sink:sa-thugs path.sack)
        %h  `(soar:sa-thugs path.sack)
      ==
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
        |-  
        ?~  acts  zo
        =/  info  (cat 3 info.q.i.acts ' | ')
        =.  zo
          (zo-cord:zo spot info)
        =.  x.spot  (add x.spot (met 3 info))
        $(acts t.acts)
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
      =/  children=(list goad:goon)  ~[sa-peek]
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
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
++  on-leave  on-leave:def
--
