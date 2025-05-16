.PHONY: all clean banner

ASM=dasm
SRC:=$(wildcard *.asm)
PRG:=$(patsubst %.asm,%.prg,$(SRC))

%.prg: %.asm
	dasm $< -o$@

all: banner $(PRG)
	@echo SRC = $(SRC)
	@echo PRG = $(PRG)


banner:
	@figlet DASM!


clean:
	@rm -rf *.prg
