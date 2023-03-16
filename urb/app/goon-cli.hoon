/+  goon, *etui, goon-lib, default-agent
|%
+$  card  card:agent:gall
+$  sack
  $:  =dude:gall
      =path
      scope=_[w=80 h=40]
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
    =/  =sack  [%pals /pals [80 40]]
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
      ++  status  3
      --
    ::
    ++  sa-user-belt
      |=  belt=dill-belt:dill
      =-  sa-draw(path.sack -)
      ?+  belt  path.sack
        %j  (move:sa-thugs path.sack |)
        %k  (move:sa-thugs path.sack &)
        %l  (sink:sa-thugs path.sack)
        %h  (soar:sa-thugs path.sack)
      ==
    ++  sa-draw
      =/  =blit:dill  sa-draw-main
      =/  =cage  dill-blit+!>(`blit:dill`[%mor ~[hop/0 clr/~ blit]])
      =/  card   [%give %fact ~[/dill/[id]] cage]
      =.  main  (emit card)
      sa-core
    ++  sa-draw-main
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
