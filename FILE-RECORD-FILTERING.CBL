       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-RECORD-FILTERING.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE
               ASSIGN TO "filter.txt"
               ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-RECORD.
          05 EMP-ID PIC 9(3).
          05 EMP-NAME PIC X(10).
          05 EMP-SALARY PIC 9(5).

       WORKING-STORAGE SECTION.
       01 WS-EOF PIC X VALUE "N".

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN OUTPUT EMP-FILE.

           MOVE 101 TO EMP-ID.
           MOVE "KAMALI" TO EMP-NAME.
           MOVE 30000 TO EMP-SALARY.
           WRITE EMP-RECORD.

           MOVE 102 TO EMP-ID.
           MOVE "PRIYA" TO EMP-NAME.
           MOVE 45000 TO EMP-SALARY.
           WRITE EMP-RECORD.

           MOVE 103 TO EMP-ID.
           MOVE "RAHUL" TO EMP-NAME.
           MOVE 25000 TO EMP-SALARY.
           WRITE EMP-RECORD.

           CLOSE EMP-FILE.

           OPEN INPUT EMP-FILE.

           DISPLAY "EMPLOYEES WITH SALARY > 30000".

           PERFORM UNTIL WS-EOF = "Y"
               READ EMP-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       IF EMP-SALARY > 30000
                           DISPLAY EMP-ID " "
                               EMP-NAME " " EMP-SALARY
                       END-IF
               END-READ
           END-PERFORM.

           CLOSE EMP-FILE.
           STOP RUN.
           