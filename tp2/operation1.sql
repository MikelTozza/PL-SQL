set serveroutput on

accept chiffre1 PROMPT "entrer le premier numero: "
accept chiffre2 PROMPT "entrer le deuxieme numero: "
accept sign prompt "quel operation? (+-*/): "

declare
    a number;
    b number;
    total number;
BEGIN
    a:=&chiffre1;
    b:=&chiffre2;
    total := 0;
    
    if '&sign' = '+' THEN
        total := a+b;
        DBMS_OUTPUT.PUT_LINE(total);
    elsif '&sign' = '-' THEN
        total := a-b;
        DBMS_OUTPUT.PUT_LINE(total);
    elsif '&sign' = '*' THEN 
        total := a*b;
        DBMS_OUTPUT.PUT_LINE(total);
    elsif '&sign' = '/' THEN
        total := a/b;
        DBMS_OUTPUT.PUT_LINE(total);
    else
        total:=0;
    end if;
    
end;
/