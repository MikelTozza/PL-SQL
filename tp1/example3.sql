DECLARE
    T_nom etudes.nom%TYPE;
BEGIN
    Select nom into T_nom from; etudes where code ='c1'
end;
/