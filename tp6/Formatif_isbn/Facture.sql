SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT lecod PROMPT "Entrer le code de l'usager : "

DECLARE
	monusager usager%ROWTYPE;
	total NUMBER:=0;
	taxes NUMBER:=0;
BEGIN
	SELECT * INTO monusager FROM usager WHERE upper(nousager) = upper('&lecod');
	DBMS_OUTPUT.PUT_LINE('Code usager : '||monusager.nousager||CHR(10)||' Nom : '||
	monusager.nom||CHR(10)||' Prenom : '||monusager.prenom||CHR(10)||' Telephone : '||monusager.telephone);
	-- Calcul de sous-total et taxes
	FOR maliste in(select * from listevente where upper(codeusager) = upper('&lecod')) LOOP
		total:= total + maliste.prixvente * maliste.quantitevendue;
	END LOOP;
	-- Affichage de Sous-total, taxes et Total
	DBMS_OUTPUT.PUT_LINE(rpad('Soustotal',10)||rpad('Taxes',10)||rpad('Total',10));
	DBMS_OUTPUT.PUT_LINE('--------------------------------');
	taxes:= total*0.145;
	
	DBMS_OUTPUT.PUT_LINE(rpad(total,10)||rpad(taxes,10)||rpad((total+taxes),10));
	
	EXCEPTION
		WHEN no_data_found THEN
			DBMS_OUTPUT.PUT_LINE('Aucun client trouver');
END;
/

PAUSE Appuyer sur une touche pour continuer...
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql