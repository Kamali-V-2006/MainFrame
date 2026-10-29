       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE-INDEXED-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT EMPLOYEE-FILE
               ASSIGN TO "employee.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS EMP-ID
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.

       FD EMPLOYEE-FILE.
       01 EMPLOYEE-RECORD.
          05 EMP-ID PIC 9(3).
          05 EMP-NAME PIC X(20).
          05 EMP-SALARY PIC 9(6).

       WORKING-STORAGE SECTION.

       01 WS-FS PIC XX.
       01 WS-SEARCH-ID PIC 9(3).

       PROCEDURE DIVISION.

       MAIN-PARA.

           OPEN OUTPUT EMPLOYEE-FILE.

           IF WS-FS = "00"

               MOVE 101 TO EMP-ID
               MOVE "RAHUL" TO EMP-NAME
               MOVE 30000 TO EMP-SALARY
               WRITE EMPLOYEE-RECORD

               MOVE 102 TO EMP-ID
               MOVE "PRIYA" TO EMP-NAME
               MOVE 35000 TO EMP-SALARY
               WRITE EMPLOYEE-RECORD

               MOVE 103 TO EMP-ID
               MOVE "KAMALI" TO EMP-NAME
               MOVE 40000 TO EMP-SALARY
               WRITE EMPLOYEE-RECORD

               DISPLAY "EMPLOYEE RECORDS CREATED"

               CLOSE EMPLOYEE-FILE

           ELSE
               DISPLAY "FILE CREATION ERROR: " WS-FS
           END-IF.

           OPEN INPUT EMPLOYEE-FILE.

           IF WS-FS = "00"

               MOVE 103 TO WS-SEARCH-ID
               MOVE WS-SEARCH-ID TO EMP-ID

               READ EMPLOYEE-FILE
                   KEY IS EMP-ID
                   INVALID KEY
                       DISPLAY "EMPLOYEE NOT FOUND"
                   NOT INVALID KEY
                       DISPLAY "EMPLOYEE DETAILS"
                       DISPLAY "ID     : " EMP-ID
                       DISPLAY "NAME   : " EMP-NAME
                       DISPLAY "SALARY : " EMP-SALARY
               END-READ

               CLOSE EMPLOYEE-FILE

           ELSE
               DISPLAY "FILE OPEN ERROR: " WS-FS
           END-IF.

           STOP RUN.
           