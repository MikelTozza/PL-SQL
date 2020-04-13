declare
nbre NUMBER(1) :=0;

begin 
/*verifiy if table exist*/
    select count(table_name) into nbre from tabs where table_name='velo';
    
    if nbre=0 then
        execute immediate 'create table velo(code varchar2(100) primary key, marque varchar2(100))';
    else
        DBMS_OUTPUT.PUT_LINE('La table existe deja');
        
    end if;
end;
/