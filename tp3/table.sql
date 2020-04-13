declare
nbre NUMBER(1) :=0;

begin 
/*verifiy if table exist*/
    select count(table_name) into nbre from tabs where table_name='produit_h2020';
    
    if nbre=0 then
        execute immediate 'create table produit_h2020(code varchar2(100) primary key, nom varchar2(100), prix decimal(2))';
    else
        DBMS_OUTPUT.PUT_LINE('La table existe deja');
        
    end if;
end;
/
