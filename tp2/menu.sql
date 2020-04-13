CLEAR SCREEN
prompt Choix de Requetes : 
prompt 1 - partie I
prompt 2 - partie II
prompt 3 - partie III
prompt 4 - Quitter
set term off
column script new_value v_script 
select case '&selection'
when '1' then 'menuPartieI.sql'
when '2' then 'menuPartieII.sql' 
when '3' then 'menuPartieIII.sql'  
when '4' then 'MENU.sql' 
else 'MENU.sql'
End as script
from dual;
set term on
@C:\Users\Mikel\Desktop\school\Applicationdebasededonnees\tp2\&v_script