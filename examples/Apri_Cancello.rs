// ------------------------
// FLOAT SECTION           
// ------------------------
FLOAT:
END

// ------------------------
// INTEGER SECTION         
// ------------------------
INTEGER:
    totsquilli=0
END

// ------------------------
// STRING SECTION          
// ------------------------
STRING:
    init="true"
    oldstate="OFF"
END

// ------------------------
// ACTUATOR SECTION         
// ------------------------
ACTUATOR:
    NAME    sonoffmini/cancello
    NAME    shellyone/campanello
END

// ------------------------
// SENSOR SECTION          
// ------------------------
SENSOR:
    NAME    esp01/igometro
    NAME    wemosmini/termostato
    NAME    shellyone/portaingresso
    NAME    esp01/termometro
    NAME    shellyone/generico
    NAME    shellyone/termostato
END

// ------------------------
// TIMER SECTION           
// ------------------------
TIMER:
    NAME    manager/sveglia
END

// ------------------------
// TASK SECTION            
// ------------------------
TASK:

/*
Task di inizializzazione sistema, esempio di Task eseguito una volta
*/
    NAME    Startup
        CALL    FUNCTION    print                           ARG         "Rule Started"
    END

/*
Attivazione cancello
*/
    NAME    ApriCancello
        CALL    FUNCTION    print                           ARG         "Aspetto 5 sec"
        CALL    FUNCTION    delaySec                        ARG         5
        SET     ACTUATOR    sonoffmini/cancello             STATE       on
        CALL    FUNCTION    print                           ARG         "Cancello aperto"
    END

END

// ------------------------
// RULE SECTION            
// ------------------------
RULE:

/*
Rule di inizializzazione sistema, viene eseguito soltanto una volta
*/
    NAME    CheckStartUp
        OP_A    STRING      init                            VALUE       EQ  "true"
        LEXP    (A)
        SET     STRING      init                            VALUE       "false"
        CALL    TASK        startup                                     
    END

/*
Conta ogni cambio stato OFF -> ON
*/
    NAME    ContaSquilli
        OP_A    ACTUATOR    shellyone/campanello            STATE       EQ  on
        OP_B    STRING      oldstate                        VALUE       EQ  "OFF"
        LEXP    (A&B)
        CALL    FUNCTION    print                           ARG         "Nuovo Squillo: OFF->ON"
        SET     STRING      oldstate                        VALUE       "ON"
        SET     INTEGER     totsquilli                      VALUE       totsquilli+1
    END

/*
Ricorda nuovo cambio stato ON -> OFF
*/
    NAME    SetOff
        OP_A    ACTUATOR    shellyone/campanello            STATE       EQ  off
        OP_B    STRING      oldstate                        VALUE       EQ  "ON"
        LEXP    (A&B)
        CALL    FUNCTION    print                           ARG         "End Squillo: ON->OFF"
        SET     STRING      oldstate                        VALUE       "OFF"
    END

/*
 * Verifica il numero di squilli, 
 * al 3 squillo attende 5 secondi poi apre il cancello
*/
    NAME    CheckSquilli
        OP_A    INTEGER     totsquilli                      VALUE       EQ  3
        LEXP    (A)
        SET     INTEGER     totsquilli                      VALUE       0
        CALL    FUNCTION    print                           ARG         "Ricevuti 3 squilli"
        CALL    TASK        apricancello                                
    END

END

