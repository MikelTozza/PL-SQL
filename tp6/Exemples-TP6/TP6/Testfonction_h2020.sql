CREATE OR REPLACE FUNCTION testfonction_h2020(a IN NUMBER, b IN NUMBER) RETURN NUMBER IS
c NUMBER;
BEGIN
	c:=a+b;
	RETURN (c);
END;
/

