/+  goon
|%
++  filter
  |=  [name=term count=@ud value=?]
  :+  name
    :~  lede/(crip "{(trip name)}: {(scow %ud count)}")
        value/f/value
    ==
  ~
++  pals
  |=  =@p
  (ship p %pal (~(gas in *(set term)) ~[%foo %bar]))
++  ship
  |=  [patp=@p status=?(%leeche %target %pal) tags=(set term)]
  :+  p/patp
    :~  value/p/patp
    ==
  :~  :+  %status
        :~  lede/'Status'
            value/tas/status
        ==
      ~
    ::
      :+  %tags
        :~  lede/'tags'
            :-  %act
            :~  [%add 'Add' 'Add a tag to this ship']
            ==
        ==
      %+  turn  ~(tap in tags)
      |=  tag=term
      :+  tag
        :~  value/tas/tag
            :-  %act
            :~  [%del 'delete' 'Delete this tag']
            ==
        ==
      ~
  ==
++  goad
  ^-  goad:goon
  :+  %pals
    :~  lede/'%pals manager'
        info/'Keep track of your friends! Other applications can use this list to find ships to talk to, pull content from, etc'
    ==
  :~
    :+  %filter
      :~  lede/'filter'
          info/'Selecting these filters will allow you to narrow the list of %pals displayed'

      ==
    :~  (filter 'all' 68 &)
        (filter 'pals' 42 |)
        (filter 'targets' 6 |)
        (filter 'leeches' 12 |)
    ==
  ::
    :+  %labels
      :~  lede/'labels'
          info/'Selecting these labels will allow you to narrow the list of %pals displayed'

      ==
    :~  (filter 'tlon' 30 |)
        (filter 'nyc' 11 |)
        (filter 'milady' 4 |)
        (filter 'leeches' 20 |)
    ==
  ::
    :+  %list  
      ~[lede/'List of pals']
    (turn ~[~rovnys-ricfer ~sarpen-laplux] pals)
  ==
++  test
  (render:goon (bleat:goon goad))
--
