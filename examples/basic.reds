
Red/System []

#include %../termbox.reds

running: true
tb-init
ev: declare tb-event
event-response: -1

log-tb-event: function [
  e [tb-event]
  x [integer!]
  y [integer!]
  /local buffer
][
  buffer: malloc 128
  sprintf [buffer "type %d" (as integer! e/type)]
  tb-print x y buffer tb-white tb-default
  sprintf [buffer "mod %d" (as integer! e/mod)]
  tb-print x (y + 1) buffer tb-white tb-default
  sprintf [buffer "key %d" e/key]
  tb-print x (y + 2) buffer tb-white tb-default
  sprintf [buffer "ch %d" e/ch]
  tb-print x (y + 3) buffer tb-white tb-default
  sprintf [buffer "w %d" e/w]
  tb-print x (y + 4) buffer tb-white tb-default
  sprintf [buffer "h %d" e/h]
  tb-print x (y + 5) buffer tb-white tb-default
  sprintf [buffer "x %d" e/x]
  tb-print x (y + 6) buffer tb-white tb-default
  sprintf [buffer "y %d" e/y]
  tb-print x (y + 7) buffer tb-white tb-default
  release buffer
]

while [running] [
  tb-clear
  event-response: tb-poll-event ev
  log-tb-event ev 10 1

  if event-response = tb-event-key [
    if ev/key = tb-key-esc [
      running: false
      tb-shutdown
    ]
    if ev/ch = 113 [
      running: false
      tb-shutdown
    ]
  ]
  tb-present
]
