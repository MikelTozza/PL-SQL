CLEAR SCREEN
prompt Choix de Requetes : 
prompt 1 - table creation
prompt 2 - insertion Auto
prompt 3 - insertion Modele
prompt 4 - Afficher avec marque
prompt 5 - mise a jour de prix
prompt 6 - suppression
prompt 7 - Quitter

set term off
column script new_value v_script 
select case '&selection'
when '1' then 'CreationDeTable.sql'
when '2' then 'InsertionAuto.sql'
when '3' then 'InsertionModele.sql' 
when '4' then 'Marque.sql'  
when '5' then 'RABAIS.sql'
when '6' then 'Suppression.sql' 
when '7' then 'end.sql' 
else 'MENU.sql'
End as script
from dual;
set term on 
@C:\Users\Mikel\Desktop\school\Applicationdebasededonnees\examenPratique\&v_script