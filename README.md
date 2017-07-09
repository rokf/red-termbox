This is a `Red/System` [Termbox](https://github.com/nsf/termbox/) wrapper.

On **Debian** based Linux distros the 32-bit shared Termbox library can be built with something like this:

```
sudo apt install gcc-5-multilib
CFLAGS=-m32 LDFLAGS=-m32 ./waf configure --prefix=/usr
./waf
```

**WIP**, haven't tested everything yet. There are some fixes to be made and examples to be written.
