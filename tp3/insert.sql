/*insertion dans la tble etude_h2020*/
accept lecode prompt "enter le code: "
accept lenom prompt "enter le nom: "
accept leprix prompt "enter le prix: "


declare
    varcode produit_h2020.code%TYPE:='&lecode';
    varnom produit_h2020.nom%TYPE:='&lenom';
    varproduit produit_h2020.prix%TYPE:='&leprix';
begin
    insert into produit_h2020(code,nom,prix) 
    values(varcode,varnom,varproduit);
end;
/