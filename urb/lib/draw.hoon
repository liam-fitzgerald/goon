/-  sole
/+  shoe, goon, goon-test
|%
++  zip
  |*  [a=(list) b=(list) fun=$-(^ *)]
  ?~  a
    ?~  b  ~
    ~|(%missed-zip-ow !!)
  ?~  b
    ~|(%missed-zip-ow !!)
  [i=(fun i.a i.b) t=$(a t.a, b t.b)]
++  transpose
  |=  in=(list (list [path ? @t]))
  ^+  in
  ?~  in  ~
  ?:  =(~ i.in)
    ~
  :-  %+  turn  in
      |=  i=(list [path ? @t])
      ?~  i
        [/ | '']
      i.i
  %-  transpose
  %+  turn  in
  |=  i=(list [path ? @t])
  ?~  i
    [/ | '']~
  t.i
++  col-width  16
++  row
  |=  r=(list [path ? @t])
  ^-  tape
  %-  zing
  %+  join  "|"
  %+  turn  r
  |=  [=path sel=? =@t]
  (pad:draw:shoe col-width %left (trip t))


  

++  scod
  |=  =iota:goon
  ?@  iota  iota
  (scot iota)
++  match-path
  |=  [need=path have=path]
  ~&  need/need
  ~&  have/have
  ?~  need  |
  ?~  have  &
  ?.  =(i.need i.have)
    |
  $(have t.have, need t.need)
++  resolve
  =|  wer=path
  =|  res=(list (list [path ? @t]))
  =|  col=(list [path ? @t])
  =|  next=(unit goad:goon)
  |=  [=goad:goon sel=path]
  =*  outer  $
  ^+  res
  =.  wer  (snoc wer (scod p.goad))
  ~&  wer/wer
  |-  =*  loop  $
  ?~  r.goad
    =.  res  (snoc res (flop col))
    =.  col  ~
    ?~  next
      ~&  res
      res
    outer(next ~, goad u.next)
  =*  child  i.r.goad
  =/  =path  (snoc wer (scod p.child))
  ~&  path/path
  ~&  sel/sel
  =/  sel    (match-path sel path)
  ~&  is-sel/sel
  =/  val=@t  (fall (render-node:goon q.child) '')
  =.  col  [[path sel val] col]
  =?  next  sel
    `child
  loop(r.goad t.r.goad)
++  render
  |=  sel=@t 
  |=  name=@t
  ^-  sole-effect:shoe
  =-  [%klr ~[-]]
  ?.  =(sel name)
    name
  [[`%un ~ ~] ~[name]]
++  draw
  |=  [sel=@t items=(list @t)]
  ^-  sole-effect:shoe
  :-  %mor
  :-  clr/~
  %+  turn  items
  (render sel)
++  draw-two
  |=  =goad:goon
  ^-  sole-effect:shoe
  :-  %mor
  :: :-  clr/~
  %+  turn  (transpose (resolve goad /pals/list/~rovnys-ricfer/tags))
  |=  r=(list [path ? @t])
  txt/(row r)
--

