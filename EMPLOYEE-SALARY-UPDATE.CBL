       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE-SALARY-UPDATE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE
               ASSIGN TO "salary.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS EMP-ID
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-RECORD.
          05 EMP-ID PIC 9(3).
          05 EMP-NAME PIC X(15).
          05 EMP-SALARY PIC 9(6).

       WORKING-STORAGE SECTION.
       01 WS-FS PIC XX.

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN OUTPUT EMP-FILE.

           MOVE 101 TO EMP-ID.
           MOVE "KAMALI" TO EMP-NAME.
           MOVE 030000 TO EMP-SALARY.
           WRITE EMP-RECORD.

           CLOSE EMP-FILE.

           OPEN I-O EMP-FILE.

           MOVE 101 TO EMP-ID.

           READ EMP-FILE
               KEY IS EMP-ID
               INVALID KEY
                   DISPLAY "EMPLOYEE NOT FOUND"
               NOT INVALID KEY
                   ADD 5000 TO EMP-SALARY
                   REWRITE EMP-RECORD
                   DISPLAY "SALARY UPDATED"
                   DISPLAY "NEW SALARY: " EMP-SALARY
           END-READ.

           CLOSE EMP-FILE.
           STOP RUN.
