CLEAR SCREEN
prompt Choix de Requetes : 
prompt 1 - TypePreDefini
prompt 2 - TypeDefini
prompt 3 - TypeDerive
prompt 4 - RowTypeDerive
prompt 5 - VarExterne
prompt 6 - Quitter
set term off
column script new_value v_script 
select case '&selection'
when '1' then 'TYPEPREDEFINI.sql'
when '2' then 'TYPEDEFINI.sql' 
when '3' then 'TYPEDERIVE.sql'  
when '4' then 'rowtypederive.sql'
when '5' then 'varexterne.sql'  
when '6' then 'MENU.sql'  
else 'MENU.sql'
End as script
from dual;
set term on
@C:\Users\Mikel\Desktop\school\Applicationdebasededonnees\tp2\&v_script