SET SERVEROUTPUT ON
SET VERIFY OFF
PROMPT *********** Vente de LIVRE ************
ACCEPT codeusager PROMPT "Entrer le codeusager: "
ACCEPT isbn PROMPT "Entrer isbn: "
ACCEPT datevente PROMPT "Entrer la datevente dd-mm-yy: "
ACCEPT quantitevendue PROMPT "Entrer la quantitevente: ";
DECLARE
	erreur_integrite EXCEPTION;
	PRAGMA EXCEPTION_INIT(erreur_integrite,-2291);
	
	varcodeusager listevente.codeusager%TYPE:='&codeusager';
	varisbn listevente.isbn%TYPE:='&isbn';
	varquantitevendue listevente.quantitevendue%TYPE:='&quantitevendue';
	varprix listevente.prixvente%TYPE;
	nbre number(1):=0;
BEGIN
	select count(isbn) into nbre from livre where isbn=varisbn;
	IF (nbre = 1) and (varcodeusager IS NOT NULL) THEN
		--Selectionner le prix du livre dans la table LIVRE
		select prix into varprix from livre where isbn=varisbn;
		
		insert into listevente(codeusager,isbn,datevente,quantitevendue,prixvente)
		values(upper(varcodeusager),varisbn,to_date('&datevente','dd-mm-yy'),varquantitevendue,varprix);
	ELSE
		DBMS_OUTPUT.PUT_LINE('Isbn non valide et/ou codeusager NULL');
	END IF;

EXCEPTION
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE('Doublon de codeusager et isbn et datevente!');
	WHEN erreur_integrite THEN
		DBMS_OUTPUT.PUT_LINE('codeusager et/ou isbn incorrect!');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Une erreur s''est produite!');
END;
/

SET VERIFY ON
PAUSE Appuyer sur une touche pour continuer...
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql