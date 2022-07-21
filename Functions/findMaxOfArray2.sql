REM   Script: findMax Funct Array diff
REM   Different array type used.

create type num_array as table of number;
/

create or replace function findMax(arr num_array) 
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
myarray num_array; 
BEGIN 
myarray := num_array(); 
        myarray.extend(5); 
        myarray(1) := 1; 
        myarray(2) := 5; 
        myarray(3) := 9; 
        myarray(4) := 2131; 
        myarray(5) := -213; 
     
    dbms_output.put_line( findMax( myarray )); 
END;
/

