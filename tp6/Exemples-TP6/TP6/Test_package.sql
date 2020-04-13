-- 1) Creation de l'entete du {PACKAGE}
CREATE OR REPLACE PACKAGE emp_actions_h2020 AS 
	FUNCTION testfonction_h2020_v2(a IN NUMBER, b IN NUMBER) 
	RETURN NUMBER;
	PROCEDURE testproc_h2020_v2(numero IN CHAR);
END emp_actions_h2020;
/

-- 2) Creation du corps du package
CREATE OR REPLACE PACKAGE BODY emp_actions_h2020 AS
	FUNCTION testfonction_h2020_v2(a IN NUMBER, b IN NUMBER) RETURN NUMBER IS
	c NUMBER;
	BEGIN
		c:=a+b;
		RETURN (c);
	END testfonction_h2020_v2;
	
	PROCEDURE testproc_h2020_v2(numero IN CHAR) IS
	BEGIN
		DELETE FROM etudes_h2020 WHERE code=numero;
	END testproc_h2020_v2;

END emp_actions_h2020;
/