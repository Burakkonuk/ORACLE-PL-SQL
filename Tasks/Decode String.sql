REM   Script: Decode String
REM   Decode String

CREATE OR REPLACE TYPE array_type IS TABLE OF CHAR;
/

CREATE OR REPLACE FUNCTION decodeString(stringA IN OUT STRING) 
return number is  stepSize NUMBER; 
countx NUMBER; 
arr array_type; 
county NUMBER; 
openx NUMBER; 
closex NUMBER; 
forCounter NUMBER; 
sub STRING(100); 
finalWord STRING(100); 
temp STRING (100); 
temp1 STRING (100); 
 
BEGIN 
                                                                                               
arr := array_type('3','[','a',']','2','[','b','c',']'); 
for i in 1 .. LENGTH(stringA) LOOP 
    arr(i):= SUBSTR(stringA, i, 1); 
    DBMS_OUTPUT.PUT_LINE(arr(i)); 
END LOOP; 
 
forCounter := 1; 
LOOP 
    IF arr(forCounter)<='9' AND arr(forCounter)>='0' THEN 
        countx := countx * 10 + arr(forCounter) -'0'; 
    ELSIF arr(forCounter) = '[' THEN 
        county := forCounter + 1; 
        openx := 1; 
        closex := 0; 
        forCounter := forCounter + 1 ; 
            while(forCounter<LENGTH(stringA) AND openx != closex) LOOP 
                IF arr(forCounter) = '[' THEN 
                    openx := openx + 1; 
                ELSIF arr(forCounter) = ']' THEN 
                    closex := closex + 1; 
                END IF; 
                forCounter := forCounter + 1; 
            END LOOP; 
            forCounter := forCounter - 1; 
            temp1:= SUBSTR(stringA, county, forCounter); 
            sub :=decodeString(temp1); 
            for k in 1 .. county LOOP 
                finalWord := finalWord || sub; 
            END LOOP;  
            county:= 0; 
        ELSE 
        finalWord:= finalWord || sub; 
    END IF; 
 
     
    EXIT WHEN forCounter = LENGTH(stringA); 
    forCounter := forCounter + 1 ; 
END LOOP;  
     
RETURN finalWord; 
END;
/

DECLARE 
strx STRING(100); 
BEGIN 
strx := '3[a]2[bc]'; 
DBMS_OUTPUT.PUT_LINE(decodeString(strx)); 
END;   
/

