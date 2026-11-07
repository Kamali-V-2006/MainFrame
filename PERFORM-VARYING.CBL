       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERFORM9.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-I.
           05 num pic 9(2) occurs 5 times.
       01 i pic 9(2) value 1.
       PROCEDURE DIVISION.
           perform varying i from 1 by 1 until i>5
            accept num(i)
           end-perform
           PERFORM VARYING i FROM 1 BY 1
               UNTIL i > 5
               DISPLAY "NUMBER : "num(i) 
           END-PERFORM.

           STOP RUN.
           