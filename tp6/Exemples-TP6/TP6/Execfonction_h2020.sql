SET SERVEROUTPUT ON
DECLARE
	Somme NUMBER;
BEGIN
	Somme:=emp_actions_h2020.testfonction_h2020_v2(&nbre1,&nbre2);
	DBMS_OUTPUT.PUT_LINE('Resultat: '||somme);
END;
/