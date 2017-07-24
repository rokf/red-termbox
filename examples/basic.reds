
Red/System []

#include %../termbox.reds

#import [
  "libc.so.6" cdecl [
    malloc: "malloc" [
      size [integer!]
      return: [c-string!]
    ]
    release: "free" [
      block [c-string!]
    ]
  ]
]

running: true
tb-init
event: declare tb-event
event-response: -1
log-tb-event: function [
  e [tb-event]
  x [integer!]
  y [integer!]
  /local buffer
][
  buffer: malloc 128
  sprintf [buffer "type %d" (as integer! event/type)]
  tb-print x y buffer tb-white tb-default
  sprintf [buffer "mod %d" (as integer! event/mod)]
  tb-print x (y + 1) buffer tb-white tb-default
  sprintf [buffer "key %d" (as integer! event/key)]
  tb-print x (y + 2) buffer tb-white tb-default
  ; BUG, FIXME
  ; something is wrong with event/ch
  ; it gets skipped and contains the value of width
  ; so everything after ch is wrong in the struct
  sprintf [buffer "ch %d" (as integer! event/ch)]
  tb-print x (y + 3) buffer tb-white tb-default
  sprintf [buffer "w %d" (as integer! event/w)]
  tb-print x (y + 4) buffer tb-white tb-default
  sprintf [buffer "h %d" (as integer! event/h)]
  tb-print x (y + 5) buffer tb-white tb-default
  sprintf [buffer "x %d" (as integer! event/x)]
  tb-print x (y + 6) buffer tb-white tb-default
  sprintf [buffer "y %d" (as integer! event/y)]
  tb-print x (y + 7) buffer tb-white tb-default
  release buffer
]

while [running] [
  event-response: tb-poll-event event
  tb-clear
  log-tb-event event 5 5

  if event-response = tb-event-key [
    if event/key = tb-key-esc [
      running: false
      tb-shutdown
    ]
  ]
  tb-present
]
