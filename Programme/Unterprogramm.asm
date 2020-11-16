include reg51.inc       ;Bibliothek des Mikrocontrolers
code at 0               ;Start bei Programmcode 0

mov P2, #0              ;Ausgabe leeren

haupt:                  ;Hauptprogramm
    cpl P2.0            ;complementiere LED P2.0
    lcall Pause1s       ;Unterprogramm aufrufen
    sjmp haupt          ;Springe zum Hauptprogramm

Pause1s:                ;Unterprogramm wartet 1 sek
    mov R2, #100        ;Setze Register 2 auf 100
    S2: mov R1, #100    ;Setze Register 1 auf 100
    S1: mov R0, #50     ;Setze Register 0 auf 50
    S0: djnz R0, S0     ;Verringere R0 um 1 und springe zu S0 wenn != 0
        djnz R1, S1     ;Verringere R1 um 1 und springe zu S1 wenn != 0
        djnz R2, S2     ;Verringere R2 um 1 und springe zu S2 wenn != 0
    ret                 ;Springe zurueck zum Hauptprogramm
end