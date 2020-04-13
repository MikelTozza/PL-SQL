VARIABLE x varchar2(20)
define t_etudes = etudes_h2020
BEGIN
    SELECT count(*) 
    into :x 
    from &t_etudes;
end;
/
print x