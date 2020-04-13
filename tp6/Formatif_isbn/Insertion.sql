CLEAR SCREEN
PROMPT ************* MENU PRINCIPAL **************
PROMPT * 1: Executer insertion dans livre        *
PROMPT * 2: Executer insertion dans usager       *
PROMPT * 3: Executer insertion dans listevente   *
PROMPT * 4: Retour                               *
PROMPT *******************************************
ACCEPT selection PROMPT " Entrer option 1-4: "

SET TERM OFF
COLUMN script NEW_VALUE v_scripts
SELECT CASE '&selection'
WHEN '1' THEN 'livre.sql'
WHEN '2' THEN 'usager.sql'
WHEN '3' THEN 'listevente.sql'
WHEN '4' THEN 'menu.sql'
ELSE 'Insertion.sql'
END AS script
FROM dual;
SET TERM ON
@C:\plsql\Gr441-442\Formatif_isbn\&v_scripts