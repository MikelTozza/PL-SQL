SET SERVEROUTPUT ON
SET VERIFY OFF
PROMPT *********** Rabais de prix vente ************
ACCEPT lusager PROMPT "Entrer le codeusager: "
ACCEPT lisbn PROMPT "Entrer l'isbn: "
ACCEPT ladatevente PROMPT "Entrer la date de vente[dd-mm-yy]: "
DECLARE
	--1. Declaration
	CURSOR Cur_listevente IS
	SELECT * FROM listevente where codeusager='&lusager' 
	and datevente=to_date('&ladatevente','dd-mm-yy') and isbn='&lisbn'
	FOR UPDATE OF prixvente;
	Le_curseur_listevente Cur_listevente%ROWTYPE;
	taux NUMBER;
BEGIN
	-- verifier que codeusager, datevente et isbn sont entrés
	IF '&lusager' IS NULL or '&lisbn' IS NULL or '&ladatevente' IS NULL THEN 
		DBMS_OUTPUT.PUT_LINE('Entrer le codeusager, la date et l''isbn!');
	ELSE 
		--2. Ouverture du curseur
		OPEN Cur_listevente;
		--3. Traitement du curseur
		FETCH Cur_listevente INTO Le_curseur_listevente;
		WHILE Cur_listevente%FOUND LOOP
			IF Le_curseur_listevente.prixvente*Le_curseur_listevente.quantitevendue >=100
				and Le_curseur_listevente.prixvente*Le_curseur_listevente.quantitevendue 
				<=200
			THEN
				taux :=0.90;
			ELSIF Le_curseur_listevente.prixvente*Le_curseur_listevente.quantitevendue >200 THEN
				taux :=0.85;
			ELSE
				taux :=0.95;
			END IF;
			UPDATE listevente
			SET prixvente = Le_curseur_listevente.prixvente * taux
			WHERE CURRENT OF Cur_listevente;
			FETCH Cur_listevente INTO Le_curseur_listevente;
		END LOOP;
		COMMIT;
	--4. Fermeture du curseur
		CLOSE Cur_listevente;
	-- Affichage des donnees mises a jour!
		FOR mavar IN (select * from listevente) LOOP
			DBMS_OUTPUT.PUT_LINE(mavar.codeusager||' '||mavar.isbn||' '||mavar.quantitevendue||' '||mavar.prixvente);
		END LOOP;
	END IF;
END;	
/
SET VERIFY ON

PAUSE Appuyer sur une touche pour continuer...
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql