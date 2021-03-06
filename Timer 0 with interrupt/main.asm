;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   Wed Aug 1 2018
; Processor: PIC16F877A
; Compiler:  MPASM (Proteus)
;====================================================================

;====================================================================
; DEFINITIONS
;====================================================================

#include p16f877a.inc                ; Include register definition file

;====================================================================
; VARIABLES
;====================================================================
REG1 EQU 0X20
REG2 EQU 0X21
;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

      ; Reset Vector
RST   code  0x0 
      goto  Start

    ORG 0x04
    btfsc INTCON,2
    goto timer0isr
    btfsc INTCON,1
    goto extint
    btfsc INTCON,0
    goto port_isr
    btfsc PIR1,1
    org 0x0022
timer0isr:
        movlw 0xff
        xorwf PORTB,1
        MOVLW 0XFF
        MOVWF TMR0
        bcf INTCON,2
        retfie
extint:
    retfie
port_isr:
    retfie


;====================================================================
; CODE SEGMENT
;====================================================================

PGM   code
    org 0x100
Start

    BSF STATUS,5          ; Bank 1 Selected
    ; Enable necessary bits in required Registers
    ; Associate Register for TIMER 0 
    ; TMR0, INTCON, OPTION_Reg
    ; Associate Registers for Display at PORT B for this program
    ; TRISB
    ; TRISB, OPTION_REG are in Bank 1
    movlw 0x00
    movwf TRISB
    MOVWF TRISC
    ;In OPTION_REG Bit positions  
    ; T0CS for clock source if 0 Internal Clock else External Clock
    ; TOSE for edge Trigger if 1 High to low transistion else low to high Transistion
    ; PSA for TIMER0 or WDT prescaler 1 to WDT 0 to TIMER0
    ; PS2:PS0 for prescaler 0:7 
    ; for External clock Counter
    CLRF OPTION_REG
    movlw 0xf1
    movwf OPTION_REG
    BSF INTCON,5
    BSF INTCON,7
    ;BSF OPTION_REG,5
    ;BSF OPTION_REG,4
    ;BCF OPTION_REG,3
    ;BSF OPTION_REG,1
    BCF STATUS,5
    clrf PORTB
    CLRF PORTC
    movlw 0xfe
    movwf TMR0
Loop
    COMF PORTC
    CALL DELAY
    goto  Loop


DELAY:
    MOVLW 0XFF
    MOVWF REG1
L2: MOVWF REG2
L1: DECFSZ REG2,1
    GOTO L1
    DECFSZ REG1,1
    GOTO L2
    RETURN
;====================================================================
      END
