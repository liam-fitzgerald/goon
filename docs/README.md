# Hoon Native UI

## Disclaimer
The outlined system is in heavy alpha, and is subject to change at any time

## Architecture

### Overview

To be Hoon UI compatible, your gall agent needs to implement a `/x/goon` scry, process pokes of mark `%goon-event`, and accept subscriptions on `/goon`. The result of the `/x/goon` scry should be a `$goad` datastructure. This datastructure defines the general structure of your interface and is used by a piece of software called the "renderer" to produce an interface that the user can manipulate. Events from the renderer (click, editing etc.) are delivered to the agent as a `%goon-event`. The `/goon` subscription is only used to deliver `%goon-redraw` facts, which are used to notify the renderer that the `/goon` scry has changed. The `%watch` and `%leave` events for this subscription act generally as the lifecycle for a particular interface. Thus the renderer only communicates over the standard gall API, and how exactly it does so is left as an implementation detail to renderer authors. The provided terminal renderer is implemented as a gall agent, but the upcoming web-based renderer will use JSON to communicate over eyre's `%channel` interface.

### Notes/Upcoming changes

- This version of the API gives no concessions for the idea of a 'session'. That is, each agent can be drawing one interface at any given time. This should be fixed by allowing for a 'session' ID in the pokes, scries and subscriptions.
- This version of the API behaves poorly when there is latency between the agent and the renderer. This is a non-issue for the demonstration TUI renderer, however it will need rectification for the upcoming web-based renderer. If you have ideas about this, please DM me on urbit.

## Towards kelvin-versioning interfaces

A `$goad`, aka a hoon UI node is specified by the following type
```hoon
+$  goad  (trel iota (list attr) (list goad))
+$  iota  $@(@tas (pair aura @))
```
The `$iota` in the node serves to act as an identifier for the node, and should be unique among siblings. This behaves similarly to the `key` attribute in React, and is used for many of the same purposes. It also allows any children to be identified uniquely by a `$path` e.g.

```hoon
::  /list
:+  %list  ~
:~  [p/~hastuc-dibtux ~ ~]  ::  /list/~hastuc-dibtux
    :+  p/~rovnys-ricfer  ~ ::  /list/~rovnys-ricfer
    :~  [%status ~ ~]  ::  /list/~rovnys-ricfer/status
    ==
==
```

The `(list attr)` defines what the node *is*. The fundamental requirements of a interface demand four things:
- That they be self-describing. A *user* interface is not an *user* interface if it requires you to look up documentation, rather it is a *developer* interface
- Output. That there exists some way to present data in a user-meaningful way.
- Input. That there exists some way to gather the user's intentions and act on them.
- Relation. That there exists some way to relate the inputs and outputs in a way that is comprehensible to the user.

Self description is handled by the `%lede` and `%info` attributes, defined as thus
```hoon
[%lede p=cord]
[%info p=cord]
```
A `%lede` is a short succinct "label", or "title" for describing what the node represents. An `%info` is a longer "description" elaborating precisely what the node represents. Note that this is not a way to embed text *content* into nodes, rather a way to embed text *copy*. A rule of thumb for seperating these is that an experienced user should be able to hide all copy and still navigate the application with no difficulties.

Output is handled exclusively with the `%value` attribute like so,
```hoon
[%value p=page]
```
A `$page` is simply a `(pair mark *)` and can be treated simply as a `$cage` without type information. We only allow a particular list of compatible marks, but unless your datatype is exceedingly complex, it should be able to be prised apart into its components with no loss of generality. The list of compatible marks is currently undefined, and I would appreciate help building this list out. If you have a usecase that requires a specialised component that you would like to see supported, then please DM me and we can discuss it. 

Input is divided into "intents" (the user wishes to perform an action) and "editing" (the user wishes to modify data):

Intents are handled as such:
```
[%act p=(list act)]
[%click ~]
+$  act  (pair term [lede=@t info=@t])
```

Note that these two attributes are mutually exclusive, you can provide either `%act` or `%click` but not both. `%act` registers a list of interactions on a node, and can be thought of as somewhat akin to a hamburger menu. The `lede` and `info` faces are analogous the the `%lede` and `%info` attributes except describing the interaction, rather than the node. Upon triggering these interactions, or the click handler, a `%goon-event` is delivered to the agent

Editing is performed like so:

```hoon
[%edit ~]
[%add ~]
```

These attributes are mutually exclusive, and required to be used in conjunction with a `%value` attribute. For both of these attributes, the mark from the `%value` attribute is used to build an input. The `%edit` attribute signifies data being updated, and is required to be prefilled with the data from the `%value` attribute. The `%add` attribute signifies new data and should be left empty, or with sane defaults. 


Relation can be performed spatially, by laying out nodes in terms of their relations to others. Note that Hoon UI differs greatly to most other tree based datastructures for describing interfaces, as input and output of values can occur anywhere in the tree, not just at the nodes. This affords for greater freedom in describing how data relates to each other. Where pure spatial relation is insufficient, we allow for the `$hint` datastructure to provide additional context to the renderer to understand how some tree should be rendered.

```hoon
[%hint p=(list hint)]
+$  hint  (pair term *)
```

The only hint that has been determined to be necessary so far is `list/~`. This indicates to the renderer that the children of this node are a homogenous list and they should be rendered in a regular and ordered fashion. 


### Component Jets

If a renderer gathers enough information about a rendering tree, it *may* choose a different rendering path than it otherwise would to enhance the richness of the interface. 

For example, considering the following tree.
```hoon
:+  %events
  ~[hint/~[list/~]]
:~  :+  %event-one
      ~[value/time/~2023.4.20]
    ~
  :+  %event-two
      ~[value/time/~2023.4.21]
    ~
  :+  %event-three
      ~[value/time/~2023.4.22]
    ~
==
```

This tree is clearly describing a calendar of some sort. The renderer can recognise this, and provide a calendar like interface, instead of a simple list. We call this technique "component jets", and it allows for a general decomposition, such that we need not privilege one calendar datastructure over any others, thus limiting the number of marks needed to be supported by `%value`




