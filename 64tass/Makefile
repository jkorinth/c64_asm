.PHONY: all clean banner
SRC=$(wildcard *.asm)
PRG=$(patsubst %.asm,%.prg,$(SRC))

%.prg: %.asm
	64tass -o $@ $<

all: banner $(PRG)
	@echo SRC = $(SRC)
	@echo PRG = $(PRG)

banner:
	@figlet 64=TASS!

clean:
	@rm -rf *.prg
