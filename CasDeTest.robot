*** Settings ***
Documentation       La liste des Différents pas de test

Library             Selenium2Library
Library             String
Resource            resource_ivan.robot

*** Variables ***


*** Keywords ***
OpenWebSite
    Open Browser To Welcome Page
    Sleep                           2

OpenImportWindow
    Click Window                    ${IMPORT_DATA}
    Sleep                           2

CloseImportWindowNoText
    Click Element                   ${LOGO_XPATH}
    Sleep                           2

CloseImportWindowWithText
    ${txt} =                        String.generate random string   3
    Enter Text                      ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    CloseImportWindowNoText
    OpenImportWindow
    ${result} =                     GetInputValue                   ${IMPORT_DATA_INPUT_TEXT}
    IF                              "${result}" == "${txt}"
        Modifi File     La fermeture de la fenêtre d'import des données fonctionne (${result} = ${txt})
    ELSE
        Modifi File     /!\ LLa fermeture de la fenêtre d'import des ne données fonctionne (${result} != ${txt})
    END
