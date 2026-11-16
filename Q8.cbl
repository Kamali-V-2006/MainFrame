       IDENTIFICATION DIVISION.
       PROGRAM-ID. Q8-PROGRAM.
      
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      
          SELECT STUDIN ASSIGN TO "STUDIN.txt"
              ORGANIZATION IS LINE SEQUENTIAL.
      
          SELECT UGOUT ASSIGN TO "UGOUT.txt"
              ORGANIZATION IS LINE SEQUENTIAL.
      
          SELECT PGOUT ASSIGN TO "PGOUT.txt"
              ORGANIZATION IS LINE SEQUENTIAL.
      
      DATA DIVISION.
       FILE SECTION.
      
       FD STUDIN.
       01 STUDIN-REC PIC X(22).
      
       FD UGOUT.
       01 UGOUT-REC PIC X(22).
      
       FD PGOUT.
       01 PGOUT-REC PIC X(22).
      
       WORKING-STORAGE SECTION.
      
       01 WS-EOF PIC X VALUE 'N'.
      
       01 WS-STU-ID PIC X(4).
       01 WS-STU-NAME PIC X(10).
       01 WS-STU-DEGREE-CODE PIC X(3).
       01 WS-STU-DEPT PIC X(2).
      
       01 WS-INVALID-DEGREE-CNT PIC 9(3) VALUE 0.
      
       PROCEDURE DIVISION.
      
       MAIN-PARA.
      
          OPEN INPUT STUDIN
          OPEN OUTPUT UGOUT
          OPEN OUTPUT PGOUT
      
          PERFORM UNTIL WS-EOF = 'Y'
      
              READ STUDIN
                  AT END
                      MOVE 'Y' TO WS-EOF
      
                  NOT AT END
      
                      UNSTRING STUDIN-REC
                          DELIMITED BY "|"
                          INTO WS-STU-ID
                               WS-STU-NAME
                               WS-STU-DEGREE-CODE
                               WS-STU-DEPT
                      END-UNSTRING
      
                      EVALUATE WS-STU-DEGREE-CODE
      
                          WHEN 'UG '
                              WRITE UGOUT-REC FROM STUDIN-REC
      
                          WHEN 'PG '
                              WRITE PGOUT-REC FROM STUDIN-REC
                          WHEN 'PHD'
                              WRITE PGOUT-REC FROM STUDIN-REC
                           
                          WHEN OTHER
                              ADD 1 TO WS-INVALID-DEGREE-CNT
      
                      END-EVALUATE
      
              END-READ
      
          END-PERFORM
      
          CLOSE STUDIN
          CLOSE UGOUT
          CLOSE PGOUT
      
          DISPLAY "FILE PROCESSING COMPLETED"
          DISPLAY "INVALID DEGREE COUNT: "
                  WS-INVALID-DEGREE-CNT
      
          STOP RUN.
          