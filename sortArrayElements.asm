; Program to sort an array in Descending order
		list p = 16f877a
		#include p16f877a.inc
		
		movlw 0x23	; Store the array elements in temporary registers

		movwf 0x60
		
		movlw 0x45
		movwf 0x61
		
		movlw 0x21
		movwf 0x62
		
		movlw 0x0A
		movwf 0x63
		
		movlw 0xFF
		movwf 0x64
		
		movlw 0x1C
		movwf 0x65
		
		movlw 0x24
		movwf 0x66

		movlw 0x70	; Starting address of sorted array
		movwf FSR	; stored in FSR (Indirect addressing mode)

		movlw 0xFF	; Move FF to a temporary register used to compare
		movwf 0x69	; with array elements

		; Compare each element and decrement the counter by one
		; Store the value when Zero flag is set
		; (i.e the number is in Descending order)
sort		movfw 0x69
		SUBWF 0x60,0
		BTFSC STATUS,Z
		GOTO store0

		movfw 0x69
		SUBWF 0x61,0
		BTFSC STATUS,Z
		GOTO store1

		movfw 0x69
		SUBWF 0x62,0
		BTFSC STATUS,Z
		GOTO store2
	
		movfw 0x69
		SUBWF 0x63,0
		BTFSC STATUS,Z
		GOTO store3

		movfw 0x69
		SUBWF 0x64,0
		BTFSC STATUS,Z
		GOTO store4

		movfw 0x69
		SUBWF 0x65,0
		BTFSC STATUS,Z
		GOTO store5

		movfw 0x69
		SUBWF 0x66,0
		BTFSC STATUS,Z
		GOTO store6

		DECFSZ 0x69,1
		goto sort

store0		movfw 0x60
		movwf INDF
		INCF FSR
		DECFSZ 0x69,1
		goto sort

store1		movfw 0x61
		movwf INDF
		INCF FSR
		DECFSZ 0x69,1
		goto sort
		
store2		movfw 0x62
		movwf INDF
		INCF FSR
		DECFSZ 0x69,1
		goto sort

store3		movfw 0x63
		movwf INDF
		INCF FSR
		DECFSZ 0x69,1
		goto sort

store4		movfw 0x64
		movwf INDF
		INCF FSR
		DECFSZ 0x69,1
		goto sort

store5		movfw 0x65
		movwf INDF
		INCF FSR
		DECFSZ 0x69,1
		goto sort

store6		movfw 0x66
		movwf INDF
		INCF FSR
		DECFSZ 0x69,1
		goto sort

end		; End of program
