
Red/System []

#include %../termbox.reds

running: true
tb-init
event: declare tb-event
event-response: -1

while [running] [
  event-response: tb-poll-event event
  tb-clear
  if event-response = tb-event-key [
    tb-change-cell 5 5 event/ch tb-white tb-default
    if (shortify event/key1 event/key2) = tb-key-esc [
      running: false
      tb-shutdown
    ]
  ]
  tb-present
]

