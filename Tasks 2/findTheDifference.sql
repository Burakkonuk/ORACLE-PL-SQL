REM   Script: findTheDifference
REM   findTheDifference

CREATE OR REPLACE TYPE array_type IS TABLE OF CHAR;
/

CREATE OR REPLACE FUNCTION findTheDifference(s1 IN OUT STRING, s2 IN OUT STRING) 
RETURN STRING IS DIFFERENCE STRING(100); 
myarray array_type;  
myarray2 array_type;  
counterx NUMBER; 
counter1 NUMBER; 
COUNTER2 NUMBER; 
 
BEGIN 
counterx :=1; 
counter1 :=1; 
counter2 :=1; 
 
 
------------- Store strings in arrays ------------- 
 
myarray := array_type();  
 
myarray.extend(LENGTH(s1));  
    LOOP  
        myarray(counterx):=SUBSTR(s1, counterx, 1);  
        EXIT WHEN counterx = LENGTH(S1);  
        counterx := counterx + 1 ;  
    END LOOP;  
 
 
    counterx := 1;  
    myarray2 := array_type();  
    myarray2.extend(LENGTH(s2));  
    LOOP  
        myarray2(counterx):=SUBSTR(s2, counterx, 1);  
        EXIT WHEN counterx = LENGTH(S2);  
        counterx := counterx + 1 ;  
    END LOOP;      
      
     DBMS_OUTPUT.PUT_LINE('');  
------------- /Store strings in arrays ------------- 
 
 
---------------MAIN LOOPS------------------------- 
LOOP  
    counter2 := 1; 
    LOOP 
        IF myarray(counter1) = myarray2(counter2) THEN 
            myarray(counter1) := '-'; 
            myarray2(counter2) := '-'; 
            END IF; 
        EXIT WHEN counter2 = myarray2.count; 
        counter2 := counter2 + 1 ; 
         
    END LOOP; 
    EXIT WHEN counter1 = myarray.count; 
    counter1 := counter1 + 1; 
END LOOP; 
 
---------------/MAIN LOOPS------------------------- 
counterx := 1;  
    LOOP  
        IF myarray2(counterx) != '-' THEN 
            RETURN myarray2(counterx); 
        END IF; 
        EXIT WHEN counterx = LENGTH(S2);  
        counterx := counterx + 1 ;  
    END LOOP; 
 
 
 
RETURN 'Strings are same!'; 
END;
/

DECLARE  
s1 STRING(100);  
s2 STRING(100);  
  
BEGIN  
s1:=' ';  
s2:='b';  
DBMS_OUTPUT.PUT_LINE(findTheDifference(s1,s2));  
 
END;
/

