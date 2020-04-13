DECLARE
    SUBTYPE datenaissance IS date;
    naissance datenaissance;
BEGIN
    select sysdate
    into naissance
    from dual;
    DBMS_OUTPUT.PUT_LINE(naissance);
end;
/