DECLARE
    t_nom etudes_h2020.nom%TYPE; /* t_nom is the variable */
BEGIN
    select nom into t_nom from etudes_h2020 where id='1';
    DBMS_OUTPUT.PUT_LINE(t_nom);
end;
/