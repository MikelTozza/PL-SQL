declare
cursor c1_produit is
select code, nom, prix from produit_h2020
for UPDATE OF prix;

le_curseur_produit c1_produit%ROWTYPE;

BEGIN
    open c1_produit;
    fetch c1_produit into le_curseur_produit;
    while c1_produit%FOUND LOOP
        update produit_h2020
        set prix = le_curseur_produit.prix *0.75
        where code ='1';
        fetch c1_produit INTO le_curseur_produit;
    end loop;
    commit;
    close c1_produit;
end;
/