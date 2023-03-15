/+  goon
|%
+$  card  card:agent:gall
+$  sack
  $:  =dude:gall
      =path
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
  ++  main  .
  ++  sa-core
    |_  [id=@ta =sack]
    ++  sa-abet
      main(sacks (~(put by sacks) id sack))
    ++  sa-abed
      |=  i=@ta
      main(id i, (~(got by sacks) i))
    ++  sa-peek
      .^  (list goad:goon)
          %gx 
          /(scot %p our.bowl)/[dude.sack]/(scot %da now.bowl)
          /goon/noun
    --
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
++  on-init
  `this
++  on-save  !>(state)
++  on-load
  |=  =vase
  =+  !<(old=state-0 vase)
  `this(state old)
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+  mark  ~|(bad-mark/mark !!)
    %goon-cli-action  (on-action !<(action vase))
  ==
  ++  on-action
    |=  act=action 
    |^  ?+  -.act  !!
      %connect  (connect +.act)
    ==
    ++  connect
      |=  [ses=@ta =dude:gall]


    --
