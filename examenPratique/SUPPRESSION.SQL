--mettre a jour le numcat
ACCEPT lamarque PROMPT "Entrer la marque:"
DECLARE
    CURSOR cur_auto3 IS
    SELECT * FROM MT_AUTO;
    Var_curseur cur_auto3%ROWTYPE;

BEGIN
    open cur_auto3;
	delete from MT_AUTO where marque='&lamarque';
    DBMS_OUTPUT.PUT_LINE('Deletion of '|| '&lamarque' ||' completed');
    commit;
    FETCH cur_auto3 INTO Var_curseur;
    WHILE cur_auto3%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(Rpad(Var_curseur.nomod,12)||' '||RPAD(Var_curseur.marque,20)||' '||rpad(Var_curseur.annee,10)||' '||rpad(Var_curseur.prix,10) ||Var_curseur.nomod);
        FETCH cur_auto3 INTO Var_curseur;
    END LOOP;
	EXCEPTION
		WHEN no_data_found THEN
			DBMS_OUTPUT.PUT_LINE('Le nomod n''existe pas!');

END;
/
