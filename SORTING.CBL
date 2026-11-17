       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORTING17.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-TABLE.
          05 WS-NUM PIC 99 OCCURS 5 TIMES.

       01 WS-I PIC 9.
       01 WS-J PIC 9.
       01 WS-TEMP PIC 99.

       PROCEDURE DIVISION.

           DISPLAY "ENTER 5 NUMBERS".

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > 5
               ACCEPT WS-NUM(WS-I)
           END-PERFORM.

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > 4

               PERFORM VARYING WS-J FROM 1 BY 1
                   UNTIL WS-J > 5 - WS-I

                   IF WS-NUM(WS-J) > WS-NUM(WS-J + 1)
                       MOVE WS-NUM(WS-J) TO WS-TEMP
                       MOVE WS-NUM(WS-J + 1)
                           TO WS-NUM(WS-J)
                       MOVE WS-TEMP TO WS-NUM(WS-J + 1)
                   END-IF

               END-PERFORM
           END-PERFORM.

           DISPLAY "SORTED NUMBERS".

           PERFORM VARYING WS-I FROM 1 BY 1
               UNTIL WS-I > 5
               DISPLAY WS-NUM(WS-I)
           END-PERFORM.

           STOP RUN.
           