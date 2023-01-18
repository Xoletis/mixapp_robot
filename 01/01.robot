*** Settings ***
Resource            ../resource/Import.robot
Documentation       Menu Principal

Test Teardown    Close Browser

*** Test Cases ***
01.01
    Log                             Ouvrir la fenêtre "Importer des données"
    OpenWithChrome
    OpenImportWindow

01.02
    Log                             Fermer la fenêtre "Importer des données" - champ de texte vide
    OpenWithChrome
    OpenImportWindow
    Click Element                   ${LOGO_XPATH}
    Sleep                           2
    Element Should Not Be Visible   ${CODE_IMPORT_WINDOW}

01.03
    Log                             Fermer la fenêtre "Importer des données" - champ de texte rempli
    OpenWithChrome
    OpenImportWindow

    ${txt} =                        String.generate random string   4
    EnterText                       ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Click Element                   ${LOGO_XPATH}
    Sleep                           2
    Element Should Not Be Visible   ${CODE_IMPORT_WINDOW}

    OpenImportWindow
    Element Should Be Visible       ${CODE_IMPORT_WINDOW}
    ${result} =                     GetInputValue                   ${IMPORT_DATA_INPUT_TEXT}
    Run Keyword If                  "${result}" != "${txt}"         Fatal Error                 ${result} n'est pas égale à ${txt}

01.04
    Log                             Importer des données avec un code valide
    OpenWithChrome
    OpenImportWindow

    EnterText                       ${IMPORT_DATA_INPUT_TEXT}       ${CODE_IMPORT}
    Click Element                   ${IMPORT_DATA_BUTTON}
    Sleep                           2
    Element Should Be Visible       ${IMPORT_INFORMATION}

01.05
    Log                             Importer des données avec un code non valide
    OpenWithChrome
    OpenImportWindow

    ${txt} =                        String.generate random string   6
    EnterText                       ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Click Element                   ${IMPORT_DATA_BUTTON}
    Sleep                           2
    Element Should Be Visible       ${IMPORT_INFORMATION}


01.06
    Log                             Importer des données avec un code non valide
    OpenWithChrome
    Click Element                   ${SYNC_DATA}
    Sleep                           2
    Element Should Be Visible       ${SYNC_INFORMATION}
