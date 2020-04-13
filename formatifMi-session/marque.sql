accept lamarque PROMPT "entre la marque recherchee: "
DECLARE
nbre NUMBER(10):=0;
varmarque motos_h2020.marque%TYPE:='&lamarque';
BEGIN
    select count (marque) into nbre from motos_h2020 where marque=varmarque;
    if  nbre = 0 then
    dbms_output.PUT_LINE("marque recherchee est inesxistante")
    dbms_output.PUT_LINE('Voici la liste des maruques qui existent: ')
    for liste in (select distinct marque from motos_h2020) loop
        dbms_output.PUT_LINE(liste.marque);
    end loop;
else
    dbms_output.PUT_LINE('il existe : '|| nbre || 'de la marque : '|| varmarque);
end if;
end;