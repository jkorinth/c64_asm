.PHONY: all clean banner
SRC=$(wildcard *.asm)
PRG=$(patsubst %.asm,%.prg,$(SRC))

%.prg: %.asm
	kickass -o $@ $<

all: banner $(PRG)
	@echo SRC = $(SRC)
	@echo PRG = $(PRG)

banner:
	@figlet KICK ASS!

clean:
	@rm -rf *.prg
