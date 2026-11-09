       IDENTIFICATION DIVISION. 
       program-id. renames66.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 student-rcd.
         05 name pic x(10) value "Alex".
         05 age pic 9(2) value 20.
         05 clg pic x(3) value "rit".

       66 personal-info renames name thru age.
       
       procedure division.
            display student-rcd.
            display personal-info.
            
