SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
	table_existe EXCEPTION;
	PRAGMA EXCEPTION_INIT(table_existe,-955);
BEGIN
	--table usager
	
	DECLARE
		table_existe2 EXCEPTION;
		PRAGMA EXCEPTION_INIT(table_existe2,-955);
	BEGIN
		EXECUTE IMMEDIATE'create table usager(codeusager VARCHAR2(6),
							prenom varchar2(50),nom varchar2(50),telephone varchar2(20),
							constraint pk_codeusager primary key(codeusager))';
		DBMS_OUTPUT.PUT_LINE('La table usger est creee!');
	EXCEPTION
		WHEN table_existe2 THEN
		DBMS_OUTPUT.PUT_LINE('La table usager exsite deja!');
	END;
	--Table Livre
	
	BEGIN
		EXECUTE IMMEDIATE'create table livre(isbn varchar2(15) primary key,
						titre varchar2(100),auteur varchar2(50),prix number(6,2))';
		DBMS_OUTPUT.PUT_LINE('La table Livre est creee!');
	EXCEPTION
		WHEN table_existe THEN
		DBMS_OUTPUT.PUT_LINE('La table Livre exsite deja!');
	
	END;
	
	--Table Listevente
	BEGIN
		EXECUTE IMMEDIATE'create table listevente(codeusager VARCHAR2(6),
						isbn varchar2(15), datevente date,prixvente number(6,2),
						quantitevendue number(10),constraint pk_listevente 
						primary key(codeusager,isbn,datevente),
						constraint fk_isbn foreign key(isbn) references
						livre(isbn),constraint fk_codeusager 
						foreign key(codeusager) references usager(codeusager))';
		DBMS_OUTPUT.PUT_LINE('La table Listevente est creee!');
	EXCEPTION
		WHEN table_existe THEN
		DBMS_OUTPUT.PUT_LINE('La table Listevente exsite deja!');
	
	END;


END;
/

PAUSE Appuyer sur une touche pour continuer...
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql

