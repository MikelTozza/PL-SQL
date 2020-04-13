SET SERVEROUTPUT on
DECLARE
    numero NUMBER(4) :=1;
    nom VARCHAR2(20) :='toto';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Le numero est: '||numero|| 'et le nom:'||nom);
end;
/