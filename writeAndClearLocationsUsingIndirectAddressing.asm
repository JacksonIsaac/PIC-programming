; Program to write 0xFF in 16 locations
; Starting from 0x90 using Indirect
; Addressing Mode and then clearing them.
		list p=16f877a
		#include "p16f877a.inc"

		ORG 0X0000
		GOTO main

		ORG 0X0004
		CLRF INTCON
		RETFIE

main
		BSF STATUS,7	; Indirect Addressing Mode
		BSF STATUS,6
		BCF STATUS,5

		movlw 0x10
		movwf 0x110		; Counter for 16 locations.

		movlw 0x90		; Move 0x90 address to FSR
		movwf FSR

		movlw 0xFF		; Load WREG with 0xFF

loop					; Write 0xFF in the locations
		movwf INDF		; Move WREG contents to location
		INCF FSR,1		; pointed by FSR and increment FSR by 1
		DECFSZ 0x110,1	; Decrement 0x10 (16 to base 10)
		GOTO loop		; skip loop if 0

		movlw 0x20
		movwf 0x110

		movlw 0x90
		movwf FSR

clear					; Clear the locations
		clrf INDF		; Clear all the locations
		INCF FSR,1
		DECFSZ 0x110,1
		GOTO clear

		end				; Exit the Program
