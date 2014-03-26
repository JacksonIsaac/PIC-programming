; Program to Divide two 8-bit numbers using repeated subtraction.
	list p=16f877a
	#include p16f877a.inc
		
	BSF STATUS,5
	BCF STATUS,6	; BANK1
		
	movlw 0xFF	; Input through PORT
	movwf TRISB	; Dividend
	movwf TRISC	; Divisor
		
	clrf TRISD	; Output
	movlw 0x06	; 110
	movwf ADCON1	; For converting PORTE to Digital
	clrf TRISE	; Remainder

	BCF STATUS,5	; BANK0
	clrf PORTE
	movfw PORTB	; Move Dividend to 0x60 register
	movwf 0x60	; Input from PORTB

	movfw PORTC	; Move divisor to 0x61 register
	movwf 0x61	; Input from PORTC

	clrf 0x63	; Quotient

	movf 0x61	; w = PORTC --> PORTB/PORTC (i.e. PORTB - PORTC)
		
loop	incf 0x63,1	; Increment Quotient
	subwf 0x60,1	; Subtract recursively (PORTB - PORTC(w) )
	BTFSC STATUS,C	; C = 1 for positive number (Borrow)
	GOTO loop	; Repeat till zero or negative raised

	decf 0x63,0	; Decrement Quotient by 1
	movwf PORTD	; Quotient Output
		
	movf 0x61
	addwf 0x60,0	; Remainder = Divsor + Dividend
	movwf PORTE	; Remainder Output
end			; Exit Program
