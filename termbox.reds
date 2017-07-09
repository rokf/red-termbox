
Red/System []

; termbox build
; sudo apt install gcc-5-multilib
; CFLAGS=-m32 LDFLAGS=-m32 ./waf configure --prefix=/usr
; ./waf

; "libc.so.6" cdecl [
;   malloc: "malloc" [
;     size [integer!]
;     return: [c-string!]
;   ]
;   release: "free" [
;     block [c-string!]
;   ]
; ]

#define TB-KEY-F1               FFFFh-0
#define TB-KEY-F2               FFFFh-1
#define TB-KEY-F3               FFFFh-2
#define TB-KEY-F4               FFFFh-3
#define TB-KEY-F5               FFFFh-4
#define TB-KEY-F6               FFFFh-5
#define TB-KEY-F7               FFFFh-6
#define TB-KEY-F8               FFFFh-7
#define TB-KEY-F9               FFFFh-8
#define TB-KEY-F10              FFFFh-9
#define TB-KEY-F11              FFFFh-10
#define TB-KEY-F12              FFFFh-11
#define TB-KEY-INSERT           FFFFh-12
#define TB-KEY-DELETE           FFFFh-13
#define TB-KEY-HOME             FFFFh-14
#define TB-KEY-END              FFFFh-15
#define TB-KEY-PGUP             FFFFh-16
#define TB-KEY-PGDN             FFFFh-17
#define TB-KEY-ARROW-UP         FFFFh-18
#define TB-KEY-ARROW-DOWN       FFFFh-19
#define TB-KEY-ARROW-LEFT       FFFFh-20
#define TB-KEY-ARROW-RIGHT      FFFFh-21
#define TB-KEY-MOUSE-LEFT       FFFFh-22
#define TB-KEY-MOUSE-RIGHT      FFFFh-23
#define TB-KEY-MOUSE-MIDDLE     FFFFh-24
#define TB-KEY-MOUSE-RELEASE    FFFFh-25
#define TB-KEY-MOUSE-WHEEL-UP   FFFFh-26
#define TB-KEY-MOUSE-WHEEL-DOWN FFFFh-27

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

uint16!: alias struct! [
  lsb [byte!]
  msb [byte!]
]

tb-cell: alias struct! [
  ch [int-pointer!]
  fg1 [byte!]
  fg2 [byte!]
  bg1 [byte!]
  bg2 [byte!]
  ; fg [uint16!]
  ; bg [uint16!]
]

tb-event: alias struct! [
  type [byte!]
  mod [byte!]
  key1 [byte!]
  key2 [byte!]
  ch [int-pointer!]
  w [integer!]
  h [integer!]
  x [integer!]
  y [integer!]
]

#import [
  "libtermbox.so" cdecl [
    tb-init: "tb_init" [ return: [integer!] ]
    tb-init-file: "tb_init_file" [ name [c-string!] return: [integer!] ]
    tb-init-fd: "tb_init_fd" [ inout [integer!] return: [integer!] ]
    tb-shutdown: "tb_shutdown" []
    tb-width: "tb_width" [ return: [integer!] ]
    tb-height: "tb_height" [ return: [integer!] ]
    tb-clear: "tb_clear" []
    tb-set-clear-attibutes: "tb_set_clear_attributes" [ fg [integer!] bg [integer!] ] ; TODO both are uint16_t
    tb-present: "tb_present" []
    tb-set-cursor: "tb_set_cursor" [ cx [integer!] cy [integer!] ]
    tb-put-cell: "tb_put_cell" [
      x [integer!]
      y [integer!]
      cell [tb-cell]
    ]
    tb-change-cell: "tb_change_cell" [
      x [integer!]
      y [integer!]
      ch [int-pointer!] ; uint32_t
      fg [integer!] ; TODO uint16_t
      bg [integer!] ; TODO uint16_t
    ]
    tb-blit: "tb_blit" [
      x [integer!]
      y [integer!]
      w [integer!]
      h [integer!]
      cells [tb-cell] ; TODO const struct tb_cell *cells
    ]
    tb-cell-buffer: "tb_cell_buffer" [
      return: [tb-cell]
    ]
    tb-select-input-mode: "tb_select_input_mode" [
      mode [integer!]
      return: [integer!]
    ]
    tb-select-output-mode: "tb_select_output_mode" [
      mode [integer!]
      return: [integer!]
    ]
    tb-peek-event: "tb_peek_event" [
      event [tb-event]
      timeout [integer!]
      return: [integer!]
    ]
    tb-poll-event: "tb_poll_event" [
      event [tb-event]
      return: [integer!]
    ]
  ]
]

shortify: function [
  v1 [byte!]
  v2 [byte!]
  return: [integer!]
][
  return ((as integer! v1)) or ((as integer! v2) << 8)
]
