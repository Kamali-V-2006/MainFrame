       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRING12.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-FIRST  PIC X(10) VALUE "KAMALI".
       01 WS-LAST   PIC X(10) VALUE "VENU".
       01 WS-FULL   PIC X(25).

       01 WS-DATE   PIC X(10) VALUE "22-11-2026".
       01 WS-DAY    PIC X(2).
       01 WS-MONTH  PIC X(2).
       01 WS-YEAR   PIC X(4).

       01 WS-NAME   PIC X(10) VALUE "KAMALI".
       01 WS-COUNT  PIC 99 VALUE 0.

       PROCEDURE DIVISION.

           DISPLAY "STRING OPERATION".

           STRING WS-FIRST DELIMITED BY SPACE
                  " " DELIMITED BY SIZE
                  WS-LAST DELIMITED BY SPACE
             INTO WS-FULL
           END-STRING.

           DISPLAY "FULL NAME: " WS-FULL.

           DISPLAY "UNSTRING OPERATION".

           UNSTRING WS-DATE
               DELIMITED BY "-"
               INTO WS-DAY WS-MONTH WS-YEAR
           END-UNSTRING.

           DISPLAY "DAY: " WS-DAY.
           DISPLAY "MONTH: " WS-MONTH.
           DISPLAY "YEAR: " WS-YEAR.

           DISPLAY "INSPECT OPERATION".


           INSPECT WS-NAME
               TALLYING WS-COUNT
               FOR ALL "A".

           DISPLAY "NUMBER OF A: " WS-COUNT.
           INSPECT WS-NAME REPLACING ALL "A" BY "-".
           DISPLAY "REPLACED A BY - "WS-NAME.
 
           STOP RUN.
           