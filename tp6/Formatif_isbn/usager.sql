SET SERVEROUTPUT ON
SET VERIFY OFF
PROMPT *********** Insertion d''usager ************
ACCEPT nom PROMPT "Entrer le nom: "
ACCEPT prenom PROMPT "Entrer le prenom: "
ACCEPT telephone PROMPT "Entrer le telephone: "

DECLARE
	
	varnom usager.nom%TYPE:='&nom';
	varprenom usager.prenom%TYPE:='&prenom';
	vartelephone usager.telephone%TYPE:='&telephone';
BEGIN
	IF (varnom IS NOT NULL) and (varprenom IS NOT NULL) THEN
		insert into usager(codeusager,nom,prenom,telephone) 
		values(upper(substr(varprenom,0,3)||substr(varnom,0,1)),varnom,varprenom,vartelephone);
		commit;
		DBMS_OUTPUT.PUT_LINE('Insertion de nouvel usager OK!');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Enter le nom et le prenom SVP!');
	END IF;
	
EXCEPTION
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE('Doublon de codeusager!');
END;
/

SET VERIFY ON

PAUSE Appuyer sur une touche pour continuer...
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql