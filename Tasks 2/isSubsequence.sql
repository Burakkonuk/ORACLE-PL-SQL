REM   Script: isSubsequence
REM   isSubsequence

CREATE OR REPLACE TYPE array_type IS TABLE OF CHAR;
/

CREATE OR REPLACE FUNCTION isSubsequence(s1 IN OUT STRING,s2 IN OUT STRING) 
RETURN STRING is bool STRING(100); 
counter1 NUMBER; 
counter2 NUMBER; 
counterx NUMBER; 
arrCounter NUMBER; 
myarray array_type; 
myarray2 array_type; 
BEGIN 
counterx := 1; 
myarray := array_type(); 
myarray.extend(LENGTH(s1)); 
    LOOP 
        myarray(counterx):=SUBSTR(s1, counterx, 1); 
        EXIT WHEN counterx = LENGTH(S1); 
        counterx := counterx + 1 ; 
    END LOOP; 
    counterx := 1; 
     LOOP 
       DBMS_OUTPUT.PUT(myarray(counterx)); 
        EXIT WHEN counterx = LENGTH(S1); 
        counterx := counterx + 1 ; 
    END LOOP; 
 
    DBMS_OUTPUT.PUT_LINE(''); 
counterx := 1; 
myarray2 := array_type(); 
myarray2.extend(LENGTH(s2)); 
    LOOP 
        myarray2(counterx):=SUBSTR(s2, counterx, 1); 
        EXIT WHEN counterx = LENGTH(S2); 
        counterx := counterx + 1 ; 
    END LOOP;     
    counterx := 1; 
   LOOP 
       DBMS_OUTPUT.PUT(myarray2(counterx)); 
        EXIT WHEN counterx = LENGTH(S2); 
        counterx := counterx + 1 ; 
    END LOOP;  
     
     DBMS_OUTPUT.PUT_LINE(''); 
counter1 :=1; 
counter2 :=1; 
arrCounter :=0; 
IF LENGTH(s1) = 0 THEN 
    RETURN 'true' ; 
END IF; 
 
 
WHILE (counter1<=LENGTH(s1) AND counter2<=LENGTH(s2)) LOOP 
    IF myarray(counter1) = myarray2(counter2) THEN 
        counter1 := counter1 + 1; 
    END IF; 
          
 
    counter2 := counter2 + 1; 
    IF counter1= LENGTH(s1)+1 THEN 
        return 'true';    
    END IF; 
     
END LOOP; 
 
RETURN 'false'; 
END; 
/

DECLARE 
s1 STRING(100); 
s2 STRING(100); 
 
BEGIN 
s1:='aex'; 
s2:='aedwqdqdwq'; 
 
DBMS_OUTPUT.PUT_LINE(isSubsequence(s1,s2)); 
END;
/

