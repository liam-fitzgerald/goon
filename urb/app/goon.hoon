/+  shoe, default-agent, goon-test, goon, dbug, verb
/+  *etui
|%
+$  card  card:agent:gall
+$  state-0  
  $:  %0
      ses=@ta
      pos=(list @ud)  :: position indexes
      scope=size
      =path
  ==
++  def-path  /pals/list/(scot %p ~rovnys-ricfer)
+$  command
  $%  [%nex ~]
      [%pre ~]
      [%bak ~]
      [%fwd ~]
      [%pri ~]
  ==
++   items  `(list @t)`~['foo' 'bar' 'baz']
++  give-blit
  |=  [ses=@ta =blit:dill]
  ^-  card
  =/  =cage  dill-blit+!>(`blit:dill`[%mor ~[hop/0 clr/~ blit]])
  [%give %fact ~[/dill/[ses]] cage]
++  get-value
  |=  ls=(list attr:goon)
  ^-  (unit @t)
  =/  val  ~(value has:goon ls)
  =/  led  ~(lede has:goon ls)
  ?+    [val led]  ~
  ::
      [^ ^]
    ?>  &(?=(^ led) ?=(^ val))
    `(crip "{(trip u.led)}: {(trip (scod:goon u.val))}")
  ::
      [~ ^]   led
  ::
      [^ ~]   
    ?>  ?=(^ val)
    `(scod:goon u.val)
  ==
::
++  draw-children
  =|  nex=(list goad:goon)
  =|  =spot
  =|  idx=@ud
  =|  curr-wid=@ud
  =|  path-idx=(list @ud)
  |=  [ses=@ta =path children=(list goad:goon) scop=size]
  =/  zo  (zo-apex:zo [[0 status-height] [w.scop (sub h.scop status-height)]])
  |-  
  ^-  blit:dill
  =*  goad  i.children
  =/  is-highlighted=?
    ?&  ?=(^ path)
        ?=(^ children)
        =(i.path (scod:goon p.i.children))
    ==
  =?  nex  ?&(?=(^ children) is-highlighted)
    r.i.children
  ?~  children
    ?~  nex  zo-abet:zo
    %=  $
      children  nex
      nex       ~
      path      ?~(path ~ t.path)
      spot      [:(add 2 x.spot curr-wid) 0]
      curr-wid  0
    ==
  ?~  val=(get-value q.goad)
    $(children t.children)
  =.  curr-wid  (max curr-wid (met 3 u.val))
  =.  zo  
    ?.  is-highlighted 
      (zo-cord:zo spot u.val)
    =/  =stye  [(silt %un ~) ~ ~]
    (zo-stub:zo spot ~[[stye (tuba (trip u.val))]])
  $(children t.children, y.spot +(y.spot))
++  draw
  |=  [ses=@ta =path scop=size]
  ^-  card
  =/  main=blit:dill  (draw-children ses path ~[goad:goon-test] scop)
  =/  stat=blit:dill  (draw-statusline path scop)
  (give-blit ses mor/~[main stat])
++  mov
  |=  [children=(list goad:goon) =path up=?]
  ^+  path
  ?+   path
  ::  default
    [i.path $(children r:(descend children i.path), path t.path)]
  ::
      ~  !!
  ::
      [@ ~]  
    :_  ~
    (side children i.path up)
  ==
++  find-index
  =|  idx=@ud
  |=  [children=(list goad:goon) seg=knot]
  ^-  (unit @ud)
  ?~  children  ~
  ?:  =((scod:goon p.i.children) seg)
    `idx
  $(children t.children, idx +(idx))
++  cycle-idx
  |=  [idx=@ud up=? children=(list goad:goon)]
  ^-  @ud
  =/  len  (lent children)
  ?:  up
    %-  dec
    ?:  =(0 idx)
       len
    idx
  ?:  =((dec len) idx)
    0
  .+(idx)
++  side
  |=  [children=(list goad:goon) seg=knot up=?]
  =/  idx=@ud  (need (find-index children seg))
  =.  idx  (cycle-idx idx up children)
  (scod:goon p:(snag idx children))
++  descend
  |=  [children=(list goad:goon) seg=knot]
  ^-  goad:goon
  ?~  children  !!
  ?:  =((scod:goon p.i.children) seg)
    i.children
  $(children t.children)
::
++  spelunk
  |=  [children=(list goad:goon) =path]
  ^+  path
  ?~   path
    ?~  children  ~|(%killed-spelunking !!)
    /(scod:goon p.i.children)
  [i.path $(children r:(descend children i.path), path t.path)]
++  ascend
  |=  =path
  ^+  path
  ?:  ?=(?(~ [@ ~]) path)
    ~
  [i.path $(path t.path)]
++  get-goad
  |=  [ls=(list goad:goon) =path]
  ?~  ls    !!
  ?~  path  !!
  =/  down  (descend ls i.path)
  ?~  t.path
     down
  $(ls r.down, path t.path)
::
++  input
  |=  [=path =belt:dill]
  ^+  path
  ~&  belt
  =-  ~&(- -)
  ?+  belt  path
    %j  (mov ~[goad:goon-test] path |)
    %k  (mov ~[goad:goon-test] path &)
    %l  (spelunk ~[goad:goon-test] path)
    %h  (ascend path)
  ==
++  status-height  3
++  draw-statusline
  |=  [=path scop=size]
  ^-  blit:dill
  =/  =goad:goon  
    (get-goad ~[goad:goon-test] path)
  =/  zo  (zo-apex:zo [[0 0] [w.scop status-height]])
  =/  ifo  ~(info has:goon q.goad)
  =/  acts  ~(act has:goon q.goad)
  =.  zo  
    ?^  ifo
      (zo-cord:zo [0 0] u.ifo)
    (zo-cord:zo [0 0] (crip (reap (dec w.scop) ' ')))
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


  =.  zo
    (zo-cord:zo [0 (dec status-height)] (crip (reap (dec w.scop) '-')))
  zo-abet:zo
--
=|  state-0
=*  state  -
%-  agent:dbug
%+  verb  &
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
++  on-init
  =.  path  def-path
  =.  scope  [80 40]
  `this
++  on-save  !>(state)
++  on-load
  |=  =vase
  =+  !<(old=state-0 vase)
  =.  path.old  def-path
  `this(state old)
++  on-poke
  |=  [=mark =vase]
  |^  ^-  (quip card _this)
  ?+  mark  ~|(bad-mark/mark !!)
    %dill-poke  (on-dill-poke !<([@ta dill-belt:dill] vase))
    %noun       (on-noun q.vase)
  ==
  ++  on-dill-poke
    |=  [sesh=@ta belt=dill-belt:dill]
    =.  ses  sesh
    ?:  ?=([%yow *] belt)
      ~&  %todo-connect-belt
      :_  this
      ~[(draw ses path scope)]

    ?:  ?=([%cru *] belt)
      ~&  %todo-error-belt
      `this
    ?:  ?=([%hey ~] belt)
      ~&  %todo-refresh-belt
      `this
    ?:  ?=([%rez *] belt)
      =.  scope  [p q]:belt
      ~&  %todo-resize-belt
      `this
    =.  path  (input path belt)
    :_  this
    ~[(draw ses path scope)]
  ++  on-noun
    |=  non=*
    ?+  non  ~|(bad-noun/non !!)
      %reset  `this(path def-path)
    ==
  --
++  on-watch  
  |=  =(pole knot)
  ^-  (quip card _this)
  ?.  ?=([%dill ses=@ ~] pole)
    (on-watch:def pole)
  =.  ses  ses.pole
  :_  this
  ~[(draw ses path scope)]
++  on-peek  on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
++  on-leave  on-leave:def
--

