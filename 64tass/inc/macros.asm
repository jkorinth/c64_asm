; Generates a basic program that contains:
; 10 SYS <ADDR>
; This will start the program at ADDR immediately.
strt	.macro
	*=$0801
	.word(upstartEnd)
	.word 10
	.byte $9e
	.text format("%d", \@)
	.byte 0
upstartEnd:
	.word 0
	*=$080e
	.endmacro
