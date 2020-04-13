/*insertion dans la tble etude_h2020*/
accept lecode prompt "enter le code: "
accept lenom prompt "enter le nom: "

declare
    varcode etudes_h2020.code%TYPE:='&lecode';
    varnom etudes_h2020.nom%TYPE:='&lenom';
begin
    insert into etude_h2020(code,nom) 
    values(varcode,varnom);
end;
/