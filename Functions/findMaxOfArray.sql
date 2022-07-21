REM   Script: findMax Funct
REM   findMax Function

CREATE Or REPLACE TYPE array_type IS TABLE OF number;
/

create or replace function findMax(arr array_type) 
RETURN number is temp number; 
 
BEGIN 
temp := 0; 
for i in 1..arr.count loop 
   IF ( arr(i) > temp ) THEN  
      temp := arr(i);     
      dbms_output.put_line('Value updated.' );  
   ELSE  
      dbms_output.put_line('Value is less than max' );  
   END IF; 
  end loop; 
    return temp; 
END; 
/

DECLARE 
myarray array_type; 
BEGIN 
        myarray:= array_type(3,5,123,-2,-15); 
     
    dbms_output.put_line(findMax( myarray)); 
END;
/

