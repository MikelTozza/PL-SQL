begin
select count(table_name) into nbre from tabs where table_name='motos-h2020';
if nbre=0 then
    execute immediate'create table ventelibre.dbf(codemoto varchar2(20),marque varchar2(20),annee varchar2(20),prix number(10,2))'
    dbms_out.put_line('table creer');
else
    dbms_out.put_line('La table existe deja');
