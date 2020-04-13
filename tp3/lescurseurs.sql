Declare
    CURSOR Cur_etudes IS
    SELECT code, nom FROM etudes_h2020;

    Le_curseur_etudes Cur_etudes%ROWTYPE;
BEGIN
    OPEN Cur_etudes;
    FETCH Cur_etudes INTO Le_curseur_etudes;
    CLOSE Cur_etudes;
END;
/
