	.include "inc/macros.asm"

	#strt start

	*=$8000
start:
	inc $d020
	inc $d021
	jmp start
