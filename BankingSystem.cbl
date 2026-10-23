IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKING.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 BALANCE PIC 9(6) VALUE 5000.
       01 AMOUNT  PIC 9(6) VALUE 0.
       01 CHOICE  PIC 9 VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "WELCOME TO BANK"
           DISPLAY "1. CHECK BALANCE"
           DISPLAY "2. DEPOSIT"
           DISPLAY "3. WITHDRAW"
           DISPLAY "4. EXIT"

           ACCEPT CHOICE

           EVALUATE CHOICE
               WHEN 1
                   DISPLAY "BALANCE: " BALANCE

               WHEN 2
                   ACCEPT AMOUNT
                   ADD AMOUNT TO BALANCE
                   DISPLAY "UPDATED BALANCE: " BALANCE

               WHEN 3
                   ACCEPT AMOUNT
                   IF AMOUNT <= BALANCE
                       SUBTRACT AMOUNT FROM BALANCE
                       DISPLAY "UPDATED BALANCE: " BALANCE
                   ELSE
                       DISPLAY "INSUFFICIENT BALANCE"
                   END-IF

               WHEN 4
                   DISPLAY "THANK YOU"

               WHEN OTHER
                   DISPLAY "INVALID CHOICE"
           END-EVALUATE

           STOP RUN.
