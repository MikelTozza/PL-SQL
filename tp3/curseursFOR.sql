set serveroutput on
DECLARE 
cursor c1 IS
SELECT code, nom from etudes_h2020;
BEGIN 

    for c1record in c1 loop
        DBMS_OUTPUT.PUT_LINE('Row Number '||' is '||c1record.code||' '||c1record.nom);
    end loop;
    
EXCEPTION
    when no_data_found then
    dbms_output.put_line('there is NOTHING');
    
end;
/