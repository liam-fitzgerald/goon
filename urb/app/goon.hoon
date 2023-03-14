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
  |=  [ses=@ta blit=dill-blit:dill]
  ^-  card
  =/  =cage  dill-blit+!>(blit)
  [%give %fact ~[/dill/[ses]] cage]
++  get-value
  |=  ls=(list attr:goon)
  ^-  (unit @t)
  =/  val  ~(value has:goon ls)
  ?^  val
    `(scod:goon u.val)
  ~(lede has:goon ls)
::
++  draw-children
  =|  nex=(list goad:goon)
  =|  =spot
  =|  idx=@ud
  =|  path-idx=(list @ud)
  =/  zo  (zo-apex:zo [[0 0] [120 40]])
  |=  [ses=@ta =path children=(list goad:goon)]
  ^-  card
  =*  goad  i.children
  ~&  path/path
  ~&  children/children
  =/  is-highlighted=?
    ?&  ?=(^ path)
        ?=(^ children)
        =(i.path (scod:goon p.i.children))
    ==
  =?  nex  ?&(?=(^ children) is-highlighted)
    r.i.children
  ~&  nex/nex
  ?~  children
    ~&  %fin-children
    ?~  nex  (give-blit ses zo-abet:zo)
    $(children nex, nex ~, path ?~(path ~ t.path), spot [(add x.spot 30) 0])
  ~&  goad/p.goad
  ?~  val=(get-value q.goad)
    $(children t.children)
  ~&  val/u.val
  =.  zo  
    ?.  is-highlighted 
      (zo-cord:zo spot u.val)
    =/  =stye  [(silt %un ~) ~ ~]
    (zo-stub:zo spot ~[[stye (tuba (trip u.val))]])
  $(children t.children, y.spot +(y.spot))
++  draw
  |=  [ses=@ta =path]
  ^-  card
  (draw-children ses path ~[goad:goon-test])
++  mov
  |=  [children=(list goad:goon) =path up=?]
  |^  ^+  path
  ?+   path
  ::  default
    [i.path $(children (descend children i.path), path t.path)]
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
    ~&  children
    ^-  (list goad:goon)
    ?~  children  !!
    ?:  =((scod:goon p.i.children) seg)
      r.i.children
    $(children t.children)
  --
++  spelunk
  |=  [children=(list goad:goon) =path]
  |^  ^+  path
  ?~   path
    ?~  children  !!
  ::  default
    [i.path $(children (descend children i.path), path t.path)]
  ::
      ~  !!
  ::
      [@ ~]  
    :_  ~
    (side children i.path up)
  ==
++  input
  |=  [=path =belt:dill]
  ^+  path
  ?+  belt  path
    %j  (mov ~[goad:goon-test] path |)
    %k  (mov ~[goad:goon-test] path &)
    %l  (spelunk ~[goad:goon-test] path)
  ==
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
  `this
++  on-save  !>(state)
++  on-load
  |=  =vase
  =+  !<(old=state-0 vase)
  `this(state old)
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?.  =(%dill-poke mark)  ~|(bad-mark/mark !!)
  =+  !<([sesh=@ta belt=dill-belt:dill] vase)
  =.  ses  sesh
  ?:  ?=([%yow *] belt)
    ~&  %todo-connect-belt
    :_  this
    ~[(draw ses /pals/list/(scot %p ~rovnys-ricfer)/tags)]

  ?:  ?=([%cru *] belt)
    ~&  %todo-error-belt
    `this
  ?:  ?=([%hey ~] belt)
    ~&  %todo-refresh-belt
    `this
  ?:  ?=([%rez *] belt)
    =.  scope  [(div (sub p.belt 2) 2) (sub q.belt 4)]
    ~&  %todo-resize-belt
    `this
  =.  path  (input path belt)
  :_  this
  ~[(draw ses path)]
++  on-watch  
  |=  =(pole knot)
  ^-  (quip card _this)
  ?.  ?=([%dill ses=@ ~] pole)
    (on-watch:def pole)
  =.  ses  ses.pole
  :_  this
  ~[(draw ses path)]
++  on-peek  on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
++  on-leave  on-leave:def
--

