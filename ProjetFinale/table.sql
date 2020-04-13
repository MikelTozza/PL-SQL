-- Creation des tables categories_h2020 et produits_h2020
SET SERVEROUTPUT ON
DECLARE
	table_existe EXCEPTION;
	PRAGMA EXCEPTION_INIT(table_existe,-955);
BEGIN

	BEGIN
		EXECUTE IMMEDIATE'create table MT_ACHAT_MARCHADISES(
        CodeAchat varchar2(20) primary key,
        NumMembre varchar2(50),
        NumMarchadises varchar2(50),
        DateAchat date,
        QuantiteAchat varchar2(50),
        PrixAchat number (10,2)
        )';
		EXCEPTION
			WHEN table_existe THEN
				DBMS_OUTPUT.PUT_LINE('La table existe deja!');
	END;
    
	DECLARE
		table_existe2 EXCEPTION;
		PRAGMA EXCEPTION_INIT(table_existe2,-955);
	BEGIN
		EXECUTE IMMEDIATE'create table MT_MEMBRES(
        NumMembre varchar2(10) primary key,
        NomMembre varchar2(50),
        PrenomMembre number(10,2),
        Telephone varchar2(10),
        NoRue varchar2(50),
        NomRue varchar2(50),
        Ville varchar2(50),
        Province varchar2(50),
        CodePostal varchar2(50),
        Pays varchar2(50)
        )';
		EXCEPTION
			WHEN table_existe2 THEN
				DBMS_OUTPUT.PUT_LINE('La table existe deja!');
	END;
    DECLARE
        table_existe3 EXCEPTION;
		PRAGMA EXCEPTION_INIT(table_existe3,-955);
    BEGIN
        EXECUTE IMMEDIATE'create table MT_MARCHANDISES(
        NumMarchadises varchar2(50),
        Nom varchar2(50),
        QuantiteStock varchar2(50),
        Prix number(10,2)
        )';
        EXCEPTION
            WHEN table_existe3 THEN
                DBMS_OUTPUT.PUT_LINE('la table existe deja!');
    END;
    
END;
/
