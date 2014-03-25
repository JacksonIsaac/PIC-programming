; Program to multiply two 8-bit numbers using repeated addition method.
	list p=16f877a
	#include p16f877a.inc
		
	BSF STATUS,5
	BCF STATUS,6
		
	movlw 0xFF		; Input from PORT
	movwf TRISB		; Adding itself ( x + x )
	movwf TRISC		; Counter	( y times )
		
	clrf TRISD		; Output from PORTD

	BCF STATUS,5
	movfw PORTB		; Read from PORTB
	movwf 0x60		; Save 'x' at 0x60

	movfw PORTC		; Read from PORTC
	movwf 0x61		; save 'y' at 0x61

	clrw			; WREG = 0

loop	addwf 0x60,0		; Add x and save to WREG
	BTFSC STATUS,C		; Check for carry
	incf 0x60,1
	decfsz 0x61,1		; Decrement 'y' by 1
	GOTO loop		; Loop till 'y != 0'

	movwf PORTD		; Output at PORTD

end				; Exit program
