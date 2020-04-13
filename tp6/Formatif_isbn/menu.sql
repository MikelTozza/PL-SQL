CLEAR SCREEN
PROMPT ************* MENU PRINCIPAL **************
PROMPT * 1: Executer creation des tables         *
PROMPT * 2: Executer insertion de donnees        *
PROMPT * 3: Executer mise a jour dans listevente *
PROMPT * 4: Executer Suppression dans listevente *
PROMPT * 5: Quitter                              *
PROMPT *******************************************
ACCEPT selection PROMPT " Entrer option 1-5: "

SET TERM OFF
COLUMN script NEW_VALUE v_script
SELECT CASE '&selection'
WHEN '1' THEN 'Econo.sql'
WHEN '2' THEN 'Insertion.sql'
WHEN '3' THEN 'Miseajour.sql'
WHEN '4' THEN 'Suppression.sql'
WHEN '5' THEN 'Quitter.sql'
ELSE 'menu.sql'
END AS script
FROM dual;
SET TERM ON
@C:\plsql\Gr441-442\Formatif_isbn\&v_script