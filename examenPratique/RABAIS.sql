Accept lannee PROMPT "Entre l annee: "

declare
cursor c1_produit is
select noauto, marque, annee, prix, nomod from MT_AUTO
for UPDATE OF prix;
v_annee MT_AUTO.annee%type;
le_curseur_produit c1_produit%ROWTYPE;
Var_curseur c1_produit%ROWTYPE;

BEGIN
    open c1_produit;
    fetch c1_produit into le_curseur_produit;
    while c1_produit%FOUND LOOP
        update MT_AUTO
        set prix = le_curseur_produit.prix*1.125
        where annee = '&lannee';
        fetch c1_produit INTO Var_curseur;
        DBMS_OUTPUT.PUT_LINE(Rpad(Var_curseur.nomod,12)||' '||RPAD(Var_curseur.marque,20)||' '||rpad(Var_curseur.annee,10)||' '||rpad(Var_curseur.prix,10) ||Var_curseur.nomod);
    end loop;
    commit;
    close c1_produit;
end;
/