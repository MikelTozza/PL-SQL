SET SERVEROUTPUT ON
SET VERIFY OFF
PROMPT *********** Insertion de LIVRE ************
ACCEPT isbn PROMPT "Entrer ISBN: "
ACCEPT titre PROMPT "Entrer le titre: "
ACCEPT auteur PROMPT "Entrer l'auteur: "
ACCEPT prix PROMPT "Entrer le prix: "

DECLARE
	varisbn livre.isbn%TYPE:='&isbn';
	vartitre livre.titre%TYPE:='&titre';
	varauteur livre.auteur%TYPE:='&auteur';
	varprix livre.prix%TYPE:='&prix';
BEGIN
	IF REGEXP_LIKE(varisbn,'^\d{1}-\d{4}-\d{4}-\d{1}$') = true THEN
		insert into livre(isbn,titre,auteur,prix) values(varisbn,vartitre,varauteur,varprix);
		commit;
		DBMS_OUTPUT.PUT_LINE('Insertion de nouveau livre OK!');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Format ISBN non respecte!');
	END IF;
	
EXCEPTION
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE('Doublon de ISBN!');
END;
/
SET VERIFY ON

PAUSE Appuyer sur une touche pour continuer...
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql
