ACCEPT lamarque PROMPT "Entrez la marque :"
DECLARE
    CURSOR cur_auto IS
    SELECT * FROM MT_AUTO where marque='&lamarque';
     Var_curseur cur_auto%ROWTYPE;
BEGIN
    OPEN cur_auto;
    DBMS_OUTPUT.PUT_LINE(Rpad('noauto',12)|| rpad('marque',20)|| rpad('annee',10)||rpad('prix',10)||' nomod');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    FETCH cur_auto INTO Var_curseur;
    WHILE cur_auto%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(Rpad(Var_curseur.nomod,12)||' '||RPAD(Var_curseur.marque,20)||' '||rpad(Var_curseur.annee,10)||' '||rpad(Var_curseur.prix,10) ||Var_curseur.nomod);
        FETCH cur_auto INTO Var_curseur;
    END LOOP;
END;
/