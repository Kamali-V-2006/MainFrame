       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-STATUS-HANDLING.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE
               ASSIGN TO "student.txt"
               ORGANIZATION IS SEQUENTIAL
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-FILE.
       01 STUDENT-RECORD PIC X(30).

       WORKING-STORAGE SECTION.
       01 WS-FS PIC XX.
       01 WS-EOF PIC X VALUE "N".

       PROCEDURE DIVISION.
       MAIN-PARA.

           OPEN OUTPUT STUDENT-FILE.

           IF WS-FS = "00"
               DISPLAY "FILE CREATED SUCCESSFULLY"

               MOVE "101 KAMALI" TO STUDENT-RECORD
               WRITE STUDENT-RECORD

               MOVE "102 PRIYA" TO STUDENT-RECORD
               WRITE STUDENT-RECORD

               CLOSE STUDENT-FILE
           ELSE
               DISPLAY "FILE OPEN ERROR: " WS-FS
               STOP RUN
           END-IF.

           OPEN INPUT STUDENT-FILE.

           IF WS-FS = "00"
               DISPLAY "READING STUDENT RECORDS"

               PERFORM UNTIL WS-EOF = "Y"
                   READ STUDENT-FILE
                       AT END
                           MOVE "Y" TO WS-EOF
                       NOT AT END
                           DISPLAY STUDENT-RECORD
                   END-READ
               END-PERFORM

               CLOSE STUDENT-FILE
           ELSE
               DISPLAY "FILE OPEN ERROR: " WS-FS
           END-IF.

           DISPLAY "FINAL FILE STATUS: " WS-FS.

           STOP RUN.
