REM   Script: String Compression
REM   String Compression

CREATE OR REPLACE TYPE array_type IS TABLE OF CHAR;
/

create or replace function compressor(arr  IN OUT array_type) 
RETURN number is newSize number; 
counter NUMBER; 
s STRING(200); 
iCounter NUMBER; 
counter1 NUMBER; 
BEGIN 
iCounter := 1; 
LOOP 
    counter := 1; 
    while(iCounter<arr.count AND arr(iCounter) = arr(iCounter+1)) LOOP 
         
		counter := counter + 1; 
		--DBMS_OUTPUT.PUT_LINE('Count of ' || arr(iCounter) || ' ' || counter); 
		iCounter := iCounter + 1 ; 
	END LOOP; 
    IF(counter = 1) THEN 
        s := s || arr(iCounter); 
    ELSE 
        s:= s || arr(iCounter); 
        S:= s || counter; 
    END IF; 
     
 
EXIT WHEN iCounter = arr.count; 
iCounter := iCounter + 1; 
END LOOP; 
 
 
counter1 := 1; 
--STORING IN CHAR ARRAY 
DBMS_OUTPUT.PUT_LINE(S); 
LOOP 
arr(counter1):=SUBSTR (s, counter1, 1); 
 
EXIT WHEN counter1 = arr.count; 
counter1 := counter1 + 1; 
 
END LOOP; 
------------- 
 
--OUTPUT PRINTING 
DBMS_OUTPUT.PUT_LINE('Return ' || LENGTH(S) || ' And the first ' || LENGTH(S) || ' characters of the input string should be: '); 
counter1 := 1; 
DBMS_OUTPUT.PUT('['); 
LOOP 
DBMS_OUTPUT.PUT(ARR(counter1) || ','); 
counter1 := counter1 + 1; 
EXIT WHEN counter1 = LENGTH(S)+1; 
END LOOP; 
DBMS_OUTPUT.PUT(']'); 
DBMS_OUTPUT.PUT_LINE(' '); 
--------------- 
 
RETURN LENGTH(S); 
END; 
/

DECLARE 
myarray array_type; 
BEGIN 
myarray:= array_type('a','b','b','b','b','b','b','b','b','b','b','b','b','c','c','c','d'); 
DBMS_OUTPUT.PUT_LINE(compressor(myarray)); 
END; 

/

