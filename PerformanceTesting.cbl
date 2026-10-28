       identification division.
       program-id. posting.

       environment division.
       input-output section.
       file-control.
           select trans-file assign to "transactions_1000.txt"
           organization is line sequential.

       data division.
       file section.
       fd trans-file.
       01 trans-record.
           05 trans-type pic x.
           05 filler pic x.
           05 trans-amount pic 9(5).

       working-storage section.
       
       01 eof pic 9 value 0.
       01 balance-amt pic 9(12) value 5000.
       01 total-records pic 9(9) value 0.
       01 credits pic 9(9) value 0.
       01 debits pic 9(9) value 0.
       01 insufficient pic 9(9) value 0.
       01 unknown-count pic 9(9) value 0.
       01 total-credit pic 9(15) value 0.
       01 total-debit pic 9(15) value 0.

       01 start-time pic 9(8).
       01 end-time pic 9(8).
       01 elapsed pic 9(8)v99.
       01 speed pic 9(12)v99.

       procedure division.

           
           accept start-time from time
           display start-time 
           open input trans-file

           perform until eof = 1
               read trans-file
                   at end move 1 to eof
                   not at end
                       add 1 to total-records
                       evaluate trans-type
                           when 'C'
                               add trans-amount to balance-amt
                               add trans-amount to total-credit
                               add 1 to credits
                           when 'D'
                               if balance-amt >= trans-amount
                                   subtract trans-amount
                                       from balance-amt
                                   add trans-amount to total-debit
                                   add 1 to debits
                               else
                                   add 1 to insufficient
                               end-if
                           when other
                               add 1 to unknown-count
                       end-evaluate
               end-read
           end-perform

           close trans-file
           accept end-time from time
           display end-time
           compute elapsed =
               function numval(end-time(1:2)) * 3600
               + function numval(end-time(3:2)) * 60
               + function numval(end-time(5:2))
               + function numval(end-time(7:2)) / 100
               - function numval(start-time(1:2)) * 3600
               - function numval(start-time(3:2)) * 60
               - function numval(start-time(5:2))
               - function numval(start-time(7:2)) / 100

           if elapsed > 0
               compute speed = total-records / elapsed
           else
               move 0 to speed
           end-if

           display "========== REPORT =========="
           display "RECORD COUNT       : " total-records
           display "ELAPSED TIME       : " elapsed
           display "RECORDS PER SECOND : " speed
           display "CREDITS            : " credits
           display "DEBITS             : " debits
           display "INSUFFICIENT FUNDS : " insufficient
           display "UNKNOWN            : " unknown-count
           display "TOTAL CREDIT       : " total-credit
           display "TOTAL DEBIT        : " total-debit
           display "FINAL BALANCE      : " balance-amt
           display "============================"

           stop run.

