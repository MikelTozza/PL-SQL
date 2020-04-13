SET SERVEROUTPUT ON
SET VERIFY OFF

accept lamarque prompt "enter la marque: "
accept lannee prompt "enter annee: "
accept leprix prompt "enter le prix: "
accept lenomod prompt "enter le nomod: "

declare
    CURSOR cur_auto IS
    SELECT * FROM MT_AUTO;
    Var_curseur cur_auto%ROWTYPE;

begin
open cur_auto;
    insert into MT_AUTO(noauto,marque,annee,prix,nomod) values(Substr('&lamarque',0,3)||Substr('&leprix',0,4)||aseq.nextval,'&lamarque','&lannee', '&leprix', '&lenomod');
    commit;
    
        WHILE cur_auto%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(Rpad(Var_curseur.nomod,12)||' '||RPAD(Var_curseur.marque,20)||' '||rpad(Var_curseur.annee,10)||' '||rpad(Var_curseur.prix,10) ||Var_curseur.nomod);
        FETCH cur_auto INTO Var_curseur;
        end loop;
close cur_auto;
    EXCEPTION
        WHEN dup_val_on_index THEN
        DBMS_OUTPUT.PUT_LINE('It already exist');
        
end;
/