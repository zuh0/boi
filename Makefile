# Begin Makefile

# This is the Makefile for the Boi GameBoy emulator.

CC = clang

CPPFLAGS = -Iinclude
CFLAGS = -Wall -Wextra -Werror -std=c11 -pedantic

SRC = \
	  src/boi.c \
	  src/cpu.c \
	  src/mem.c \
	  src/rom.c \
	  src/run.c

OBJ = $(SRC:.c=.o)

BIN = boi

all: release

$(BIN): $(OBJ)
$(BIN):
	$(CC) $^ -o $@

release: CFLAGS += -O2
release: $(BIN)

debug: CPPFLAGS += -D_BOI_DEBUG
debug: CFLAGS += -O0 -g3
debug: $(BIN)

clean:
	$(RM) $(OBJ) $(BIN)

.PHONY: all clean release debug

# End Makefile
