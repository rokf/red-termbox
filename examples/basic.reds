
Red/System []

#include %../termbox.reds

running: true
tb-init
ev: declare tb-event
event-response: -1

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
