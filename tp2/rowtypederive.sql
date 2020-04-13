DECLARE
    t_etudes etudes_h2020%ROWTYPE;
begin
    select id,nom,prenom
    into t_etudes 
    from etudes_h2020 
    where id='1'
    /*DBMS_OUTPUT.PUT_LINE(t_etudes);*/
end;
/
