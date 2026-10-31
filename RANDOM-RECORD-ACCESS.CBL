       IDENTIFICATION DIVISION.
       PROGRAM-ID. RANDOM-RECORD-ACCESS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE
               ASSIGN TO "random-emp.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS EMP-ID
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-RECORD.
          05 EMP-ID PIC 9(3).
          05 EMP-NAME PIC X(20).

       WORKING-STORAGE SECTION.
       01 WS-FS PIC XX.

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN OUTPUT EMP-FILE.

           MOVE 101 TO EMP-ID.
           MOVE "KAMALI" TO EMP-NAME.
           WRITE EMP-RECORD.

           MOVE 102 TO EMP-ID.
           MOVE "PRIYA" TO EMP-NAME.
           WRITE EMP-RECORD.

           CLOSE EMP-FILE.

           OPEN I-O EMP-FILE.

           MOVE 102 TO EMP-ID.

           READ EMP-FILE
               KEY IS EMP-ID
               INVALID KEY
                   DISPLAY "RECORD NOT FOUND"
               NOT INVALID KEY
                   DISPLAY "EMPLOYEE FOUND"
                   DISPLAY EMP-ID " " EMP-NAME
           END-READ.

           CLOSE EMP-FILE.
           STOP RUN.
