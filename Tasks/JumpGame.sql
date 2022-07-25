REM   Script: Jump Game 2
REM   Jump Game 2

CREATE OR REPLACE TYPE array_type IS TABLE OF NUMBER; 

/

CREATE OR REPLACE FUNCTION jumpGame(arr IN OUT array_type) 
return NUMBER is jumpCount NUMBER; 
lastP NUMBER; 
endX NUMBER; 
 
BEGIN 
lastP := 0; 
endX := 0; 
jumpCount := 0;                                                                                                  
 
for i in 1 .. arr.count LOOP 
     
    IF lastP > arr(i)+i THEN 
        lastP := lastP; 
    ELSIF arr(i) + i > lastP THEN 
        lastP:= arr(i) + i ; 
    END IF; 
     
    IF lastP= arr.count THEN 
        jumpCount :=jumpCount + 1; 
        EXIT; 
    END IF; 
    IF i = endX THEN 
        jumpCount :=jumpCount + 1; 
        endX := lastP; 
    END IF; 
 
END LOOP;  
RETURN jumpCount+1; 
END;
/

DECLARE 
myarray array_type; 
BEGIN 
myarray:= array_type(2,3,1,1,4); 
DBMS_OUTPUT.PUT_LINE(jumpGame(myarray)); 
END;    
/

