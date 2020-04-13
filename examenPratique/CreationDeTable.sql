SET SERVEROUTPUT ON
DECLARE
	table_existe EXCEPTION;
	PRAGMA EXCEPTION_INIT(table_existe,-955);
BEGIN
	
	BEGIN
		EXECUTE IMMEDIATE'create table MT_AUTO(noauto varchar2(20) primary key,marque varchar2(50),annee varchar2(30),prix number(10,2),nomod varchar2(30))';
		EXCEPTION
			WHEN table_existe THEN
				DBMS_OUTPUT.PUT_LINE('La table "MT_AUTO" existe deja!');
	END;
	
	DECLARE
		table_existe2 EXCEPTION;
		PRAGMA EXCEPTION_INIT(table_existe2,-955);
	BEGIN
		EXECUTE IMMEDIATE'create table MT_MODELE(nommod varchar2(30) primary key,nom varchar2(50))';
		EXCEPTION
			WHEN table_existe2 THEN
				DBMS_OUTPUT.PUT_LINE('La table "MT_MODELE" existe deja!');
	END;
	
END;
/
