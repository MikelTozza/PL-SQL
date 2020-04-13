set serveroutput on
DECLARE 
cursor c1 IS
SELECT code, nom from etudes_h2020;
v_code etudes_h2020.code%type;
v_nom etudes_h2020.nom%type;

BEGIN 
    if not c1%ISOPEN then
        open c1;
    end if;
    
    fetch c1 into v_code, v_nom;
    while c1%found loop
        DBMS_OUTPUT.PUT_LINE('Row Number'||c1%rowcount||'is'||v_code||' '||v_nom);
    fetch c1 into v_code, v_nom;
    end loop;
    close c1;
    
EXCEPTION
    when no_data_found then
    dbms_output.put_line('there is NOTHING');
    
end;
/