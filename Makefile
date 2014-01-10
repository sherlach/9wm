#
# This Makefile is provided in case you have no imake, or it
# doesn't work on your system.  Copy this file to "Makefile"
# and edit the variables below to suit your system.  Be sure
# to define whatever compilation flags your system needs, eg
# if you're using AIX, add "-D_BSD -D_BSD_INCLUDES" to "CFLAGS".
#

CFLAGS = -g -DSHAPE -Wall -Werror
LDLIBS = -lXext -lX11
BIN = /usr/bin/X11

MANDIR = /usr/man/man1
MANSUFFIX = 1

#
# These variables shouldn't need to be changed
#

OBJS = 9wm.o event.o manage.o menu.o client.o grab.o cursor.o error.o
HFILES = dat.h fns.h

#
# Or these rules either
#

all: 9wm

9wm: $(OBJS)

install: 9wm
	cp 9wm $(BIN)/9wm

install.man:
	cp 9wm.man $(MANDIR)/9wm.$(MANSUFFIX)

$(OBJS): $(HFILES)

trout: 9wm.man
	troff -man 9wm.man >trout

vu: trout
	xditview trout

clean:
	rm -f 9wm *.o core bun trout
