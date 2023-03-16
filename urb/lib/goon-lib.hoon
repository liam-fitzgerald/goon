/+  goon
|%
++  rndr
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
++  thug
  |_  thugs=(list goad:goon)
  ::
  ++  soar
    |=  =path
    =.  path  (flop path)
    ?~  path  ~
    (flop t.path)
  ::
  ++  get
    |=  =path
    ^-  (unit goad:goon)
    ?~  path
      ~
    ?~  kid=(dive i.path)
      ~
    ?~  t.path
      `u.kid
    $(path t.path, thugs r.u.kid)
  ::
  ++  move
    |=  [=path up=?]
    ^+  path
    ?+  path
    ::  default
        [i.path $(thugs r:(fall (dive i.path) *goad:goon), path t.path)]
    ::
        ~  !!
    ::
        [@ ~]  
      :_  ~
      (side i.path up)
    ==
  ::
  ++  idx
    |%
    ++  find
      =|  idx=@ud
      |=  seg=knot
      ^-  (unit @ud)
      ?~  thugs  ~
      ?:  =((scod:goon p.i.thugs) seg)
        `idx
      $(thugs t.thugs, idx +(idx))
    ++  cycle
      |=  [idx=@ud up=?]
      ^-  @ud
      =/  len  (lent thugs)
      ?:  up
        %-  dec
        ?:  =(0 idx)
          len
        idx
      ?:  =((dec len) idx)
        0
      .+  idx
    --
  ++  side
    |=  [seg=knot up=?]
    =/  i=@ud  (need (find:idx seg))
    =.  i  (cycle:idx i up)
    (scod:goon p:(snag i thugs))
  ::
  ++  dive
    |=  seg=knot
    ^-  (unit goad:goon)
    ?~  thugs  ~
    ?:  =((scod:goon p.i.thugs) seg)
      `i.thugs
    $(thugs t.thugs)
  ::
  ++  sink
    |=  =path
    ^+  path
    ?~   path
      ?~  thugs  ~|(%killed-spelunking !!)
      /(scod:goon p.i.thugs)
    =.  thugs  r:(fall (dive i.path) *goad:goon)
    [i.path $(path t.path)]
  --
--
