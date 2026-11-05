       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE-TABLE-PROCESSING.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 EMPLOYEE-TABLE.
          05 EMPLOYEE OCCURS 5 TIMES.
             10 EMP-ID PIC 9(3).
             10 EMP-SALARY PIC 9(6).

       01 I PIC 9.

       01 WS-TOTAL PIC 9(7) VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PARA.

           MOVE 101 TO EMP-ID(1).
           MOVE 30000 TO EMP-SALARY(1).

           MOVE 102 TO EMP-ID(2).
           MOVE 35000 TO EMP-SALARY(2).

           MOVE 103 TO EMP-ID(3).
           MOVE 40000 TO EMP-SALARY(3).

           MOVE 104 TO EMP-ID(4).
           MOVE 25000 TO EMP-SALARY(4).

           MOVE 105 TO EMP-ID(5).
           MOVE 45000 TO EMP-SALARY(5).

           PERFORM VARYING I FROM 1 BY 1
               UNTIL I > 5

               DISPLAY EMP-ID(I) " "
                   EMP-SALARY(I)

               ADD EMP-SALARY(I) TO WS-TOTAL

           END-PERFORM.

           DISPLAY "TOTAL SALARY: " WS-TOTAL.

           STOP RUN.
