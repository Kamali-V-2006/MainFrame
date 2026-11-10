       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALUATE11.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-GRADE PIC X VALUE 'A'.

       PROCEDURE DIVISION.

           EVALUATE WS-GRADE
               WHEN 'A'
                   DISPLAY "EXCELLENT"
               WHEN 'B'
                   DISPLAY "GOOD"
               WHEN 'C'
                   DISPLAY "AVERAGE"
               WHEN OTHER
                   DISPLAY "INVALID GRADE"
           END-EVALUATE.

           STOP RUN.
           