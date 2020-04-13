begin
select count(table_name) into nbre from tabs where table_name='motos-h2020';
if nbre=0 then
    execute immediate'create table motos_h2020(codemoto varchar2(20),marque varchar2(20),annee varchar2(20),prix number(10,2))'
    dbms_out.put_line('table creer');
else
    dbms_out.put_line('La table existe deja');


select count(sequence_name) into nbre2 from user_sequences where upper(sequence_name) = upper(seqmotos_h2020);
if nbre2=0 then
    execute immediate 'create sequence seqmotos_h2020 increment by 1 start with 1000 minvalue 1000 maxvalue 9999 ';
    dbms_out.put_line('La seq est cree');

else
    dbms_out.put_line('La table existe deja');
end if;
end;