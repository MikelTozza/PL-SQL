SET SERVEROUTPUT ON
SET VERIFY OFF
PROMPT *********** Suppression d''une vente ************
ACCEPT codeusager PROMPT "Entrer le code de l'usager: "
ACCEPT isbn PROMPT "Entrer l'isbn: "
ACCEPT datevente PROMPT "Entrer la date de vente [dd-mm-yy]: "
DECLARE
	varcodeusager listevente.codeusager%TYPE:='&codeusager';
	varisbn listevente.isbn%TYPE:='&isbn';
	vardatevente listevente.datevente%TYPE:='&datevente';
	
	varcodetrouve listevente.codeusager%TYPE;
BEGIN
	-- verifier si une vente existe pour l'usager a cette date
	select codeusager into varcodetrouve from listevente where codeusager=varcodeusager 
	and isbn=varisbn and datevente=to_date(vardatevente,'dd-mm-yy');
	
	--Si OUI inserer les donnees dans la table ventesupprimees
	insert into ventesupprimees select * from listevente where codeusager=varcodeusager 
	and isbn=varisbn and datevente=to_date(vardatevente,'dd-mm-yy');
	
	--Si OUI suppression et confirmation de la vente a l'usager
	delete from listevente where codeusager=varcodeusager 
	and isbn=varisbn and datevente=to_date(vardatevente,'dd-mm-yy');
	commit;
	DBMS_OUTPUT.PUT_LINE('Suppression de la vente OK!');
	
	-- Sinon Message Non trouve
EXCEPTION
	WHEN no_data_found THEN
		DBMS_OUTPUT.PUT_LINE('Pas de vente pour l''usager a cette date!');
END;
/

SET VERIFY ON

PAUSE Appuyer sur une touche pour continuer...
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql