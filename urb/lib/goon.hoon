/+  shoe
|%
+$  info  @t
+$  lede  @t
+$  interact
  [=info =lede =path]
+$  act
  (pair term interact)
+$  iota  $@(@t (pair aura @))
+$  goad
  $~  [*iota ~ ~]
  (trel iota (list attr) (list goad))
+$  goat
  $~  [~ ~]
  (pair (unit @t) (list goat))
++  scod
  |=  =iota
  ?@  iota  iota
  (scot iota)
+$  attr
  $% 
      :: The "informational" attributes:
      ::   These explain to the user the meaning of a particular interface 
      ::   element. These simply have attached cords, meaning that all notion
      ::   of 'rich text' is being punted on for the meantime
      ::
      ::   %key: A machine internal identifer, for grouping similar 'kinds' of 
      ::   data
      ::     This is used largely to generate consistent tables 
      [%key p=term]
      ::
      ::  %lede: A headline briefly explaining the use of a particular element. 
      ::    For container elements, this might be what is a "title" in other UI
      ::    systems. For elements that have the %click attribute set, this 
      ::    should be a short explanation of what the button does
      ::
      [%lede p=lede]
      ::  %info: A longer (possibly multi-line) description of the use of a
      ::  particular element. This should enumerate all the possibilities of the
      ::  element, and should be akin to a "help" page in other systems.
      ::
      [%info p=info]
      ::  %value: A $dime representing the a urbit atom to be rendered
      ::
      ::  This is the underlying value being represented by the element. It can
      ::  be used to produce form controls with the %edit attribute, or simply 
      ::  used for data representation
      ::
      [%value p=iota]
      ::  The "interaction" attribute:
      ::    These imply that the element can be interacted with in some way.
      ::    %act and %click are mutually exclusive, reflecting the law of the 
      ::    excluded middle (all elements have either zero, one (%click) or many
      ::    (%act) interactions. Although the datatype does not (and cannot, 
      ::    without loss of generality or an improvement in the type system)
      ::    prevent both of them being set, the rendering engine will simply 
      ::    choose the attribute that it sees first. The paths produced by these
      ::    interactions will be the the path of the element (all elements have
      ::    a uniquely identifying path) concatenated with the path specified in
      ::    the interaction
      ::
      ::  %edit: This a declaration that the %value of this element is editable
      [%edit ~]
      ::
      ::
      ::  %act: A list of interactions for this element
      ::    This is our translation of the much maligned "hamburger menu",
      ::    where a component conceals a variety of interactions. However, given
      ::    the architecture, the rendering engine has a variety of methods to 
      ::    make this more user-friendly. 
      [%act p=(list act)]
      ::  %click: The singular interaction for this element
      ::
      ::    What this element does when 'clicked' (actually activated, given we 
      ::    aren't assuming a mouse and keyboard) should be immediately obvious
      ::    given the attributes on the rest of the element. If p is & then the 
      ::    values of sibling elements with %edit set will be sent with the event
      ::
      ::    NB: this feels like a hacky way to introduce forms? possibly 
      ::    introducing them modally is better??
      [%click p=? q=wire]
  ==
+$  screen
  (list @t)
++  has
  |_  attrs=(list attr)
  ++  lede
    |-  ^-  (unit @t)
    ?~  attrs
      ~
    ?:  ?=(%lede -.i.attrs)
      `p.i.attrs
    $(attrs t.attrs)
  ++  value
    |-  ^-  (unit iota)
    ?~  attrs
      ~
    ?:  ?=(%value -.i.attrs)
      `p.i.attrs
    $(attrs t.attrs)
  --
++  render-node
  |=  attrs=(list attr)
  ^-  (unit @t)
  ?^  val=~(value has attrs)
    ?@  u.val  `u.val
    `(scot u.val)
  ?^  led=~(lede has attrs)
    `u.led
  ~
++  divider
  `@t`(crip (reap 40 '-'))
++  prefix
  |=  depth=@ud 
  |=  val=@t
  ^-  @t
  ?:  =(depth 0)
    val
  (rap 3 (crip (reap (dec depth) ' ')) '|' val ~)
++  sleepy
  |=  =goat
  ?&  (levy q.goat |=(g=^goat =(q.g ~)))
      %+  gth  80
      %+  add
        (met 3 (fall p.goat ''))
      =-  (roll - add)
      %+  turn  q.goat
      |=  g=^goat 
      (met 3 (fall p.g ''))
  ==
++  nap
  |=  =goat
  ^-  screen
  %-  lure
  %+  rap  3  
  %+  welp
    ?~  p.goat
      *(list @t)
    ~['| ' u.p.goat ' | ']
  %+  turn  q.goat
  |=  g=^goat
  ?~  p.g  *@t
  (rap 3 u.p.g ' |' ~)
++  render
  =|  depth=@ud
  |=  =goat
  ^-  screen
  =*  loop  $
  =/  children=screen
    %-  zing
    ^-  (list screen)
    %+  turn  q.goat
    |=  g=^goat
    ^-  screen
    loop(goat g, depth +(depth))
  ?:  (sleepy goat)
    (nap goat)
  ;:  welp
    :~  divider
    ==
    (drop p.goat)
    (turn children (prefix depth))
  ==
++  bleat
  |=  =goad
  ^-  goat
  :_  (turn r.goad bleat)
  ?^  val=~(value has q.goad)
    ?@  u.val  `u.val
    `(scot u.val)
  ?^  led=~(lede has q.goad)
    `u.led
  ~
++  find
  |=  [=goad =path]
  ~&  path/path
  =-  ~&(- -)
  ^-  (unit ^goad)
  ?~  path  `goad
  ?~  r.goad  ~
  ?:  =((scod p.i.r.goad) i.path)
    $(path t.path, goad i.r.goad)
  $(r.goad t.r.goad)
++  trace
  =|  ls=(list goad)
  |=  [=goad =path]
  ^+  ls
  ?~  path  (flop ls)
  ?~  r.goad  ~
  ?:  =((scod p.i.r.goad) i.path)
    $(r.goad t.r.goad)
  $(path t.path, goad i.r.goad, ls [goad ls])
::
++  items
  |=  [=goad =iota]
  ^-  (list sole-effect:shoe)
  ~&  iota
  %+  turn  r.goad
  |=  g=^goad
  =/  val  (fall (render-node q.g) '')
  ~&  p.goad
  =-  [%klr ~[-]]
  ?.  =(iota p.g)
    val
  [[`%un ~ ~] ~[val]]
++  headline
  |=  [=goad =path]
  ~
--
