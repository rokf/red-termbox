
Red/System []

; termbox build
; sudo apt install gcc-5-multilib
; CFLAGS=-m32 LDFLAGS=-m32 ./waf configure --prefix=/usr
; ./waf

#define TB-KEY-F1               [FFFFh - 0]
#define TB-KEY-F2               [FFFFh - 1]
#define TB-KEY-F3               [FFFFh - 2]
#define TB-KEY-F4               [FFFFh - 3]
#define TB-KEY-F5               [FFFFh - 4]
#define TB-KEY-F6               [FFFFh - 5]
#define TB-KEY-F7               [FFFFh - 6]
#define TB-KEY-F8               [FFFFh - 7]
#define TB-KEY-F9               [FFFFh - 8]
#define TB-KEY-F10              [FFFFh - 9]
#define TB-KEY-F11              [FFFFh - 10]
#define TB-KEY-F12              [FFFFh - 11]
#define TB-KEY-INSERT           [FFFFh - 12]
#define TB-KEY-DELETE           [FFFFh - 13]
#define TB-KEY-HOME             [FFFFh - 14]
#define TB-KEY-END              [FFFFh - 15]
#define TB-KEY-PGUP             [FFFFh - 16]
#define TB-KEY-PGDN             [FFFFh - 17]
#define TB-KEY-ARROW-UP         [FFFFh - 18]
#define TB-KEY-ARROW-DOWN       [FFFFh - 19]
#define TB-KEY-ARROW-LEFT       [FFFFh - 20]
#define TB-KEY-ARROW-RIGHT      [FFFFh - 21]
#define TB-KEY-MOUSE-LEFT       [FFFFh - 22]
#define TB-KEY-MOUSE-RIGHT      [FFFFh - 23]
#define TB-KEY-MOUSE-MIDDLE     [FFFFh - 24]
#define TB-KEY-MOUSE-RELEASE    [FFFFh - 25]
#define TB-KEY-MOUSE-WHEEL-UP   [FFFFh - 26]
#define TB-KEY-MOUSE-WHEEL-DOWN [FFFFh - 27]

#define TB-KEY-CTRL-TILDE       00h
#define TB-KEY-CTRL-2           00h ; clash
#define TB-KEY-CTRL-A           01h
#define TB-KEY-CTRL-B           02h
#define TB-KEY-CTRL-C           03h
#define TB-KEY-CTRL-D           04h
#define TB-KEY-CTRL-E           05h
#define TB-KEY-CTRL-F           06h
#define TB-KEY-CTRL-G           07h
#define TB-KEY-BACKSPACE        08h
#define TB-KEY-CTRL-H           08h; clash
#define TB-KEY-TAB              09h
#define TB-KEY-CTRL-I           09h ; clash
#define TB-KEY-CTRL-J           0Ah
#define TB-KEY-CTRL-K           0Bh
#define TB-KEY-CTRL-L           0Ch
#define TB-KEY-ENTER            0Dh
#define TB-KEY-CTRL-M           0Dh ; clash
#define TB-KEY-CTRL-N           0Eh
#define TB-KEY-CTRL-O           0Fh
#define TB-KEY-CTRL-P           10h
#define TB-KEY-CTRL-Q           11h
#define TB-KEY-CTRL-R           12h
#define TB-KEY-CTRL-S           13h
#define TB-KEY-CTRL-T           14h
#define TB-KEY-CTRL-U           15h
#define TB-KEY-CTRL-V           16h
#define TB-KEY-CTRL-W           17h
#define TB-KEY-CTRL-X           18h
#define TB-KEY-CTRL-Y           19h
#define TB-KEY-CTRL-Z           1Ah
#define TB-KEY-ESC              1Bh
#define TB-KEY-CTRL-LSQ-BRACKET 1Bh ; clash
#define TB-KEY-CTRL-3           1Bh ; clash
#define TB-KEY-CTRL-4           1Ch
#define TB-KEY-CTRL-BACKSLASH   1Ch ; clash
#define TB-KEY-CTRL-5           1Dh
#define TB-KEY-CTRL-RSQ-BRACKET 1Dh ; clash
#define TB-KEY-CTRL-6           1Eh
#define TB-KEY-CTRL-7           1Fh
#define TB-KEY-CTRL-SLASH       1Fh ; clash
#define TB-KEY-CTRL-UNDERSCORE  1Fh ; clash
#define TB-KEY-SPACE            20h
#define TB-KEY-BACKSPACE2       7Fh
#define TB-KEY-CTRL-8           7Fh ; clash

#define TB-MOD-ALT    01h
#define TB-MOD-MOTION 02h

#define TB-DEFAULT 00h
#define TB-BLACK   01h
#define TB-RED     02h
#define TB-GREEN   03h
#define TB-YELLOW  04h
#define TB-BLUE    05h
#define TB-MAGENTA 06h
#define TB-CYAN    07h
#define TB-WHITE   08h

#define TB-BOLD      0100h
#define TB-UNDERLINE 0200h
#define TB-REVERSE   0400h

#define TB-EVENT-KEY    1
#define TB-EVENT-RESIZE 2
#define TB-EVENT-MOUSE  3

#define TB-EUNSUPPORTED-TERMINAL -1
#define TB-EFAILED-TO-OPEN-TTY   -2
#define TB-EPIPE-TRAP-ERROR      -3

#define TB-HIDE-CURSOR -1

#define TB-INPUT-CURRENT 0
#define TB-INPUT-ESC     1
#define TB-INPUT-ALT     2
#define TB-INPUT-MOUSE   4

#define TB-OUTPUT-CURRENT   0
#define TB-OUTPUT-NORMAL    1
#define TB-OUTPUT-256       2
#define TB-OUTPUT-216       3
#define TB-OUTPUT-GRAYSCALE 4

#define int-pointer! [pointer! [integer!]]

; uint16!: alias struct! [
;   lsb [byte!]
;   msb [byte!]
; ]

; get-uint16: function [
;   src [uint16!]
;   return: [integer!]
; ][
;   (as integer! src/lsb) or ((as integer! src/msb) << 8)
; ]

; set-uint16: function [
;   src [uint16!]
;   value [integer!]
; ][
;   src/lsb: as byte! value and FFh
;   src/msb: as byte! value >> 8 and FFh
; ]

uint32!: alias struct! [
  b1 [byte!]
  b2 [byte!]
  b3 [byte!]
  b4 [byte!]
]

get-uint32: function [
  src [uint32!]
  return: [integer!]
][
  (as integer! src/b1) or ((as integer! src/b2) << 8) or ((as integer! src/b3) << 16) or ((as integer! src/b4) << 24)
]

set-uint32: function [
  src [uint32!]
  value [integer!]
][
  src/b1: as byte! value and FFh
  src/b2: as byte! value >> 8 and FFh
  src/b3: as byte! value >> 16 and FFh
  src/b4: as byte! value >> 24 and FFh
]

tb-cell: alias struct! [
  ch [integer!]
  fg [integer!]
  bg [integer!]
]

tb-cell-original: alias struct! [
  ch [uint32! value]
  fg1 [byte!] ; these have to be split, because [uint16! value] gets padded
  fg2 [byte!]
  bg1 [byte!]
  bg2 [byte!]
]

tb-event: alias struct! [
  type [byte!]
  mod [byte!]
  key [integer!]
  ch [integer!]
  w [integer!]
  h [integer!]
  x [integer!]
  y [integer!]
]

tb-event-original: alias struct! [
  type [byte!]
  mod [byte!]
  ; key [uint16! value]
  key1 [byte!]
  key2 [byte!]
  ch [uint32! value]
  w [integer!]
  h [integer!]
  x [integer!]
  y [integer!]
]

; TEMPORARY
log-tb-event-original: function [
  e [tb-event-original]
  x [integer!]
  y [integer!]
  /local buffer
][
  buffer: malloc 128
  sprintf [buffer "type %d" (as integer! e/type)]
  tb-print x y buffer tb-white tb-default
  sprintf [buffer "mod %d" (as integer! e/mod)]
  tb-print x (y + 1) buffer tb-white tb-default
  ; sprintf [buffer "key %d" (get-uint16 e/key)]
  sprintf [buffer "key1 %d key2 %d" (as integer! e/key1) (as integer! e/key1)]
  tb-print x (y + 2) buffer tb-white tb-default
  sprintf [buffer "ch %d" (get-uint32 e/ch)]
  tb-print x (y + 3) buffer tb-white tb-default
  sprintf [buffer "w %d" e/w]
  tb-print x (y + 4) buffer tb-white tb-default
  sprintf [buffer "h %d" e/h]
  tb-print x (y + 5) buffer tb-white tb-default
  sprintf [buffer "x %d" e/x]
  tb-print x (y + 6) buffer tb-white tb-default
  sprintf [buffer "y %d" e/y]
  tb-print x (y + 7) buffer tb-white tb-default
  sprintf [buffer "SIZE %d" size? tb-event-original]
  tb-print x (y + 8) buffer tb-white tb-default
  release buffer
]

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
  "libtermbox.so" cdecl [
    tb-init: "tb_init" [ return: [integer!] ]
    tb-init-file: "tb_init_file" [ name [c-string!] return: [integer!] ]
    tb-init-fd: "tb_init_fd" [ inout [integer!] return: [integer!] ]
    tb-shutdown: "tb_shutdown" []
    tb-width: "tb_width" [ return: [integer!] ]
    tb-height: "tb_height" [ return: [integer!] ]
    tb-clear: "tb_clear" []
    tb-set-clear-attibutes: "tb_set_clear_attributes" [ fg [integer!] bg [integer!] ]
    tb-present: "tb_present" []
    tb-set-cursor: "tb_set_cursor" [ cx [integer!] cy [integer!] ]
    tb-put-cell-original: "tb_put_cell" [
      x [integer!] ; int32
      y [integer!] ; int32
      cell [tb-cell-original]
    ]
    tb-change-cell: "tb_change_cell" [ ; wrap for correct types?
      x [integer!] ; int32
      y [integer!] ; int32
      ch [integer!] ; uint32
      fg [integer!] ; uint16
      bg [integer!] ; uint16
    ]
    ; tb-blit: "tb_blit" [
    ;   x [integer!]
    ;   y [integer!]
    ;   w [integer!]
    ;   h [integer!]
    ;   cells [tb-cell] ; TODO const struct tb_cell *cells
    ; ]
    ; tb-cell-buffer: "tb_cell_buffer" [
    ;   return: [tb-cell]
    ; ]
    tb-select-input-mode: "tb_select_input_mode" [
      mode [integer!]
      return: [integer!]
    ]
    tb-select-output-mode: "tb_select_output_mode" [
      mode [integer!]
      return: [integer!]
    ]
    tb-peek-event-original: "tb_peek_event" [
      event [tb-event-original]
      timeout [integer!]
      return: [integer!]
    ]
    tb-poll-event-original: "tb_poll_event" [
      event [tb-event-original]
      return: [integer!]
    ]
  ]
]

tb-put-cell: function [
  x [integer!]
  y [integer!]
  cell [tb-cell]
  /local orig-cell
][
  orig-cell: declare tb-cell-original
  set-uint32 orig-cell/ch cell/ch

  ; set 2 foreground bytes
  orig-cell/fg1: as byte! cell/fg and FFh
  orig-cell/fg2: as byte! cell/fg >> 8 and FFh

  ; set 2 background bytes
  orig-cell/bg1: as byte! cell/bg and FFh
  orig-cell/bg2: as byte! cell/bg >> 8 and FFh

  tb-put-cell-original x y orig-cell
]

fill-event-copy: function [
  event-out [tb-event]
  event-in [tb-event-original]
][
  event-out/type: event-in/type
  event-out/mod: event-in/mod
  event-out/key: (shortify event-in/key1 event-in/key2)
  event-out/ch: (get-uint32 event-in/ch)
  event-out/w: event-in/w
  event-out/h: event-in/h
  event-out/x: event-in/x
  event-out/y: event-in/y
]

tb-peek-event: function [
  event [tb-event]
  timeout [integer!]
  return: [integer!]
  /local orig-event out
][
  orig-event: declare tb-event-original
  out: tb-peek-event-original orig-event timeout
  fill-event-copy event orig-event
  return out
]

tb-poll-event: function [
  event [tb-event]
  return: [integer!]
  /local orig-event out
][
  orig-event: declare tb-event-original
  out: tb-poll-event-original orig-event
  fill-event-copy event orig-event
  return out
]

; TEMP until there's a better way
shortify: function [
  "combine two bytes into an integer"
  v1 [byte!]
  v2 [byte!]
  return: [integer!]
][
  return ((as integer! v1)) or ((as integer! v2) << 8)
]

tb-print: function [
  "put a c-string! on position x y"
  x [integer!] "x position"
  y [integer!] "y position"
  str [c-string!]
  fg [integer!] "foreground color"
  bg [integer!] "background color"
  /local s c
][
  c: 0
  s: str
  until [
    tb-change-cell (x + c) y (as integer! s/1) fg bg
    s: s + 1
    c: c + 1
    s/1 = null-byte
  ]
]
