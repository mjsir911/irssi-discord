MAKEFLAGS += --warn-undefined-variables

DEBUG = false

### Edit these parameters ###

RM += -r

# Where your irssi include files live. You might need to install an
# 'irssi-dev' package or something like that.
NAME = discord

### You shouldn't need to edit anything beyond this point ###

SRCDIR = src/
SRCS := $(wildcard $(SRCDIR)/*.c)
HEAD := $(wildcard $(SRCDIR)/*.h)

# When you start adding more components to your module, add them here.
LIBDIR = lib/
LIBS = lib$(NAME).so
LIBS := $(addprefix $(LIBDIR)/,$(LIBS))

OBJDIR = obj/
OBJS := $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))
#OBJS := $(addprefix $(OBJDIR)/,$(OBJS))

INCDIR = include/

CFLAGS = -Wall -Werror -g -D NAME=\"$(NAME)\" -D"UOFF_T_LONG_LONG=1"
LDFLAGS = -flat_namespace -undefined suppress

#IRSSI_DIST := $(shell echo $$IRSSI_INCLUDE)
IRSSI_DIST := $(INCDIR)/irssi/src

INCLUDE = -I $(INCDIR) \
          -I $(IRSSI_DIST)/core/ -I $(IRSSI_DIST)/ # src/utils.h
#LIBRARY = 

# For libcurl
INCLUDE += $(shell pkg-config libcurl --cflags)
LIBRARY += $(shell pkg-config libcurl --libs)

INCLUDE += $(shell pkg-config jansson --cflags)
LIBRARY += $(shell pkg-config jansson --libs)

GLIB_CFLAGS = $(shell pkg-config glib-2.0 --cflags)

.PHONY: all
.DEFAULT: all
all: $(LIBS)

$(LIBS): $(OBJS) | $(LIBDIR)
	$(CC) $(CFLAGS) $(LDFLAGS) $(LIBRARY) $^ -o $@

$(LIBDIR) $(OBJDIR) $(SRCDIR):
	mkdir -p $@

#.INTERMEDIATE: $(OBJS)
$(OBJDIR)/%.o: $(SRCDIR)/%.c $(SRCDIR)/%.h | $(OBJDIR)
	$(CC) -c $(INCLUDE) -o $@ $< $(CFLAGS) $(GLIB_CFLAGS)


#install: $(LIBS)
#$(CC) $(CFLAGS) $(GLIB_CFLAGS) $(IRSSI_INCLUDE) -I $(SRC) -o $@ -fPIC -c $<
#install $< $(IRSSI_USER_DIR)/modules

.PHONY: clean
clean:
	$(RM) $(LIBDIR) $(OBJDIR)


.phony: clean install TAGS

test: all
	LIB=$(abspath $(LIBS)) irssi --home=test/irssi
	
