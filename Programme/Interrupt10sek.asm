include reg51.inc       ;Bibliothek des Mikrocontrolers
code at 0               ;Start bei Programmcode 0

ljmp init               ;Ueberspringe Interrupts

org 000Bh               ;Adresse Timerinterrupt 1
inc R0                  ;erhoehe R0 um 1
cjne R0, #20, S0        ;wenn R0 ungleich 20, springe zu S0
mov R0, #0              ;setze R0 auf 0
inc R1                  ;erhoehe R1
cjne R1, #10, S1        ;wenn R1 ungleich 10, springe zu S1
mov R1, #0              ;setze R1 auf 0
S1: mov A, R1           ;Gebe die Ziffer aus der Tabelle aus
    movc A, @A + dptr
    mov P2, A
S0: mov TL0, #0B0h      ;setze erneut die Startwerte für den Timer
    mov TH0, #3Ch
reti                    ;zurück ins Programm

init:                   ;Initialisieren des Programms
    setb ET0            ;lokale Freigabe
    setb EA             ;globale Freigabe
    mov TMOD, #1        ;Timermodus 1 -> 16-Bit Timer
    mov TL0, #0B0h      ;setze Low-Byte
    mov TH0, #3Ch       ;setze High-Byte
    setb TR0            ;starte Timer
    mov dptr, #tab      ;Datenpointer auf Tabelle richten

haupt: sjmp haupt       ;Endlosschleife

;Ausgabe Bitmuster der Zahlen
tab: db 01111110b, 00010010b, 10111100b, 10110110b, 11010010b, 11100110b, 11101110b, 00110010b, 11111110b, 11110110b

end