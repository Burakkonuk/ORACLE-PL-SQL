REM   Script: Matrix Multiplication 3x3
REM   Matrix Multiplication 3x3

create table matrix1 (a number, b number, c number);

create table matrix2 (a number, b number, c number);

create table matrix3 (a number, b number, c number);

insert into matrix1(a,b,c) values (1,1,2);

insert into matrix1(a,b,c) values (1,2,2);

insert into matrix1(a,b,c) values (1,1,3);

insert into matrix2(a,b,c) values (4,5,3);

insert into matrix2(a,b,c) values (2,1,2);

insert into matrix2(a,b,c) values (3,4,1);

declare 
 
    type t_column is table of number index by pls_integer; 
 
    type t_matrix_rec is record (val t_column); 
      
 
    type t_matrix_tab is table of t_matrix_rec index by pls_integer; 
 
    matrix1  t_matrix_tab; 
    matrix2  t_matrix_tab; 
    matrix3  t_matrix_tab; 
 
      
 
    cursor mycur is 
 
    select * from matrix1; 
 
    x number; 
 
    cursor mycur2 is 
 
    select * from matrix2; 
 
    y number; 
 
begin 
 
    
 
    x:=1; 
    y:=1; 
  
 
    for rec in mycur 
 
    loop 
 
    matrix1(x).val(1):=rec.a; 
 
    matrix1(x).val(2):=rec.b; 
     
    matrix1(x).val(3):=rec.c; 
 
 
    x:=x+1; 
 
    end loop; 
     
    for rec in mycur2 
 
    loop 
 
    matrix2(y).val(1):=rec.a; 
 
    matrix2(y).val(2):=rec.b; 
     
    matrix2(y).val(3):=rec.c; 
 
    y := y+1; 
    end loop; 
     
     
    for i in 1 .. 3LOOP  
        for j in 1 .. 3 LOOP  
        matrix3(i).val(j) := 0; 
            for k in 1 .. 3 LOOP  
                matrix3(i).val(j) := matrix3(i).val(j) + (matrix1(i).val(k)* matrix2(k).val(j)); 
     
            END LOOP; 
     
        END LOOP; 
     
    END LOOP; 
 
    for i in 1 .. x-1 
 
    loop 
 
    dbms_output.put_line(matrix3(i).val(1)|| ' '||matrix3(i).val(2) || ' '||matrix3(i).val(3) ); 
    end loop; 
end;
/

