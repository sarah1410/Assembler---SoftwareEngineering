include reg51.inc       ;Bibliothek des Mikrocontrolers
code at 0               ;Start bei Programmcode 0

ljmp init               ;Ueberspringe Interrupts

org 000Bh               ;Adresse Timerinterrupt 1
inc R0                  ;erhoehe R0 um 1
cjne R0, #20, S0        ;wenn R0 ungleich 20, springe zu S0
mov R0, #0              ;setze R0 auf 0
cpl P2.0                ;complementiere P2.0
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


haupt: sjmp haupt       ;Endlosschleife

end