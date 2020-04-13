SET SERVEROUTPUT ON
DECLARE
    Naissance DATE;
BEGIN
    SELECT sysdate INtO naissance FROM dual;
    DBMS_OUTPUT.PUT_LINE('La date du jour est:'||naissance);
end;
/