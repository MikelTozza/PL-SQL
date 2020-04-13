SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT leisbn PROMPT "Entrer le isbn: "
DECLARE
	varisbn VARCHAR2(15):='&leisbn';
BEGIN
	IF REGEXP_LIKE(varisbn,'^\d{1}-\d{4}-\d{4}-\d{1}$') = false THEN
		dbms_output.put_line('FORMAT ISBN NON VALIDE');
	ELSE
		dbms_output.put_line('Format OK');
	END IF;

END;
/
SET VERIFY ON
