/+  goon
|%
++  filter
  |=  [name=term count=@ud value=?]
  :+  name
    :~  lede/(crip "{(trip name)}: {(scow %ud count)}")
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
        :~  key/status
            value/tas/status
        ==
      ~
    ::
      :+  %tags
        :~  lede/'tags'
        ==
      %+  turn  ~(tap in tags)
      |=  tag=term
      :+  tag
        :~  key/tag
            value/tas/tag
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
