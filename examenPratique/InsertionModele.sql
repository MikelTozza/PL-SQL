SET SERVEROUTPUT ON
SET VERIFY OFF

accept lemod prompt "enter le nomod: "
accept lenom prompt "enter le nom: "


declare
    varmod MT_AUTO.marque%TYPE:='&lemod';
    varnom MT_AUTO.annee%TYPE:='&lenom';

begin
    insert into MT_MODELE(nomod,nom) values(varmod,varnom);
    DBMS_OUTPUT.PUT_LINE(' '||varnom||' '||varmod||' ');
    commit;
    
    EXCEPTION
        WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('It already exist');
        
end;
/