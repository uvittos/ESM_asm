#include<p18f4550.inc>    
    CBLOCK 00h
    counter
    ten
    ENDC
    org 00h
    goto inicio
inicio movlw 0Eh    	
    movwf ADCON1    ;para DAC
    movlw 01h	      ;00000001
    movwf ADCON0    ;para DAC
    movlw 11h	      ;00010001
    movwf ADCON2    ;para DAC
    movlw 01h
    clrf ADRESH
    clrf ADRESL    
    movlw 01h
    movwf TRISA
    clrf TRISD
    clrf PORTD
main bsf ADCON0,1   ;<1>GO/DONE conv en progreso
conv btfsc ADCON0,1 ;salta la terminar la conversion
    goto conv
    movff ADRESH,PORTD
    goto main   
    end
