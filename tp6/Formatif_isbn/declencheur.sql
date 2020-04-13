SET SERVEROUTPUT ON

create or replace trigger trigger_isbn
after update of isbn on livre
begin
    dbms_output.put_line('Modification en cascade de : '||:NEW.isbn);
    update listevente set isbn = :NEW.isbn where isbn=:OLD.isbn;
    commit;
end;
/

create or replace trigger trigger_codeusager
after update of codeusager on usager
begin
    dbms_output.put_line('Modification en cascade de : '||:NEW.codeusager);
   update listevente set codeusager = :NEW.codeusager where codeusager=:OLD.codeusager;
   commit;
end;
/
pause appuyer sur une touche
@C:\plsql\Gr441-442\Formatif_isbn\menu.sql
