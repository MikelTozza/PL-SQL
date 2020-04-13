ACCEPT lamarque PROMPT "entrez la marque"
ACCEPT lemodel
ACCEPT lannee
ACCEPT leprix

DECLARE
varmarque motos_h2020.marque%TYPE:="&lamarque"
varmarque motos_h2020.marque%TYPE:="&lemodel"
varmarque motos_h2020.marque%TYPE:="&lannee"
varmarque motos_h2020.marque%TYPE:="&leprix"

BEGIN
if varannee= '2016'
    insert into motos_h2020 values(codemoto,marque,annee,prix);
    values(upper(substr(varmarque,0,3)||seqmotos_h2020.nextval, varmarque,varmodel,varannee,varprix);
    commit;
    DBMS_OUTPUT.PUT_LINE('insertion reussi');
    
           for liste in (select* from motos_h2020) loop
               DBMS_OUTPUT.PUT_LINE(liste.codemoto ||''||liste.marque||''||liste.modele||''||liste.annee||''||liste.leprix);
           end loop;
else
    DBMS_OUTPUT.PUT_LINE('insertion non reussi');

end;