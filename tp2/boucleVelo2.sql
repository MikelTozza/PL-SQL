/*while loop*/
set serveroutput on
accept number prompt "how many bikes: "
accept lamarque prompt "enter le nom de la marque: "

declare
    numberOfBikes number(10):= 0;
    varmarque velo.marque%TYPE:='&lamarque';
    varcode velo.code%type:=('&lamarque');
begin
    while numberOfBikes <= &number LOOP
        INSERT INTO velo(code,marque)
        values(varcode||numberOfBikes,varmarque);
        numberOfBikes:=numberOfBikes+1;
    end loop;
end;
/