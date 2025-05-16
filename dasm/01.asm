	processor 6502

	org $0801
	.word #strt
	.word #10
	.byte $9e
	dc.b '3, '2, '7, '6, '8, 0

strt:
	.word 0
	org $080e

	org $8000
start:
	inc $d020
	inc $d021
	jmp start
