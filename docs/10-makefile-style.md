# 10 — Makefile style (norm‑friendly, readable)

## Goals
- Clear sections, comments, and helpful emoji
- Phony targets, separate build dir, strict flags

### Example
```Makefile
# 🧱 Compiler & Flags
CC      := cc
CFLAGS  := -Wall -Wextra -Werror
IFLAGS  := -Iinclude

# 📁 Dirs
SRC_DIR := src
OBJ_DIR := obj
BIN     := app

# 🧩 Sources
SRC     := $(wildcard $(SRC_DIR)/*.c)
OBJ     := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

# 🧹 Rules
.PHONY: all clean fclean re

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(BIN)

re: fclean all
```

> Keep lines under 80 chars when possible, and use tabs where Make requires them.
