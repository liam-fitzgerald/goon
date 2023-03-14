/+  shoe, default-agent, goon-test, goon, dbug, verb
/+  *etui
|%
+$  card  card:agent:gall
+$  state-0  
  $:  %0
      ses=@ta
      pos=(list @ud)  :: position indexes
      scope=size
  ==
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
  ~&  blit
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
  =|  idx=(list @ud)
  =/  zo  (zo-apex:zo [[0 0] [80 40]])
  |=  [ses=@ta =path children=(list goad:goon)]
  ^-  card
  =*  goad  i.children
  =?  nex  ?&  ?=(^ path)
               ?=(^ children)
                =(i.path (scod:goon p.i.children))
            ==
    r.i.children
  ~&  children/children
  ~&  nex/nex
  ?~  children
    ?~  nex  (give-blit ses zo-abet:zo)
    $(children nex, nex ~, path ?~(path ~ t.path), spot [(add x.spot 30) 0])
  =?  nex  ?&  ?=(^ path)
                =(i.path (scod:goon p.i.children))
            ==
    r.i.children
  ?~  val=(get-value q.goad)
    $(children t.children)
  =.  zo  (zo-cord:zo spot u.val)
  $(children t.children, y.spot +(y.spot))
++  draw
  |=  [ses=@ta =path]
  ^-  card
  (draw-children ses path ~[goad:goon-test])
--
=|  state-0
=*  state  -
%-  agent:dbug
%+  verb  &
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
++  on-init  on-init:def
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
    ~[(draw ses /pals/list/(scot %p ~rovnys-ricfer))]

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
  :_  this
  ~[(draw ses /pals/list/(scot %p ~rovnys-ricfer))]
++  on-watch  
  |=  =(pole knot)
  ^-  (quip card _this)
  ?.  ?=([%dill ses=@ ~] pole)
    (on-watch:def pole)
  =.  ses  ses.pole
  :_  this
  ~[(draw ses /pals/list/(scot %p ~rovnys-ricfer))]
++  on-peek  on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
++  on-leave  on-leave:def
--

