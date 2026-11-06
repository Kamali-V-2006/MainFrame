       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVE8.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-DATE.
          05 WS-DAY   PIC 99.
          05 WS-MONTH PIC 99.
          05 WS-YEAR  PIC 9(4).

       01 WS-COPY-DATE.
          05 WS-COPY-DAY   PIC 99.
          05 WS-COPY-MONTH PIC 99.
          05 WS-COPY-YEAR  PIC 9(4).

       01 WS-EMPLOYEE.
          05 WS-NAME PIC X(10).
          05 WS-AGE  PIC 99.

       01 WS-EMPLOYEE-COPY.
          05 WS-NAME PIC X(10).
          05 WS-AGE  PIC 99.

       PROCEDURE DIVISION.

           DISPLAY "MOVE STATEMENT".

           MOVE 22 TO WS-DAY.
           MOVE 11 TO WS-MONTH.
           MOVE 2026 TO WS-YEAR.

           DISPLAY "DATE: " WS-DAY "/"
                   WS-MONTH "/" WS-YEAR.

           DISPLAY "GROUP MOVE".

           MOVE WS-DATE TO WS-COPY-DATE.

           DISPLAY "COPIED DATE: "
                   WS-COPY-DAY "/"
                   WS-COPY-MONTH "/"
                   WS-COPY-YEAR.

           DISPLAY "MOVE CORRESPONDING".

           MOVE "KAMALI" TO WS-NAME OF WS-EMPLOYEE.
           MOVE 21 TO WS-AGE OF WS-EMPLOYEE.

           MOVE CORRESPONDING WS-EMPLOYEE
             TO WS-EMPLOYEE-COPY.

           DISPLAY "NAME: "
                   WS-NAME OF WS-EMPLOYEE-COPY.
           DISPLAY "AGE: "
                   WS-AGE OF WS-EMPLOYEE-COPY.

           STOP RUN.
