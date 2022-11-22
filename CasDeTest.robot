*** Settings ***
Documentation       La liste des Différents pas de test

Library             Selenium2Library
Library             String

Resource            resource_ivan.robot

*** Variables ***


*** Keywords ***
OpenWebSite
    OpenBrowser
    Sleep                           5

OpenImportWindow
    ClickWindow                    ${IMPORT_DATA}
    Sleep                           2

CloseImportWindow
    ClickElement                   ${LOGO_XPATH}
    Sleep                           2

CloseImportWindowWithText
    ${txt} =                        String.generate random string   3
    EnterText                       ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    CloseImportWindow
    OpenImportWindow
    ${result} =                     GetInputValue                   ${IMPORT_DATA_INPUT_TEXT}
    IF                              "${result}" == "${txt}"
        ModifiFile     La fermeture de la fenêtre d'import des données avec du texte fonctionne (${result} = ${txt})
    ELSE
        ModifiFile     /!\ La fermeture de la fenêtre d'import des données avec du texte ne fonctionne pas (${result} != ${txt}) /!\
    END
    CloseImportWindow

EnterCodeLessSevenCharacter
    OpenImportWindow
    ${txt} =            String.generate random string   1
    EnterText           ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    ${result}=          Get Element Attribute           ${IMPORT_DATA_BUTTON}       disabled
    IF                  "${result}" == "true"
        ModifiFile          Le bouton reste verouiller avec moins de 7 characters
    ELSE
        ModifiFile          /!\\ Le bouton se déverouil alors qu'il à moins de 7 characters
    END
    Clear Element Text  ${IMPORT_DATA_INPUT_TEXT}
    CloseImportWindow

EnterCodeMoreSevenCharacter
    OpenImportWindow
    ${txt} =            String.generate random string   7
    EnterText           ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    ${result}=          Get Element Attribute           ${IMPORT_DATA_BUTTON}       disabled
    IF                  "${result}" == "None"
        ModifiFile          Le bouton se déverouil avec plus de 7 characters
    ELSE
        ModifiFile          /!\\ Le bouton reste verouiller alors qu'il à plus de 7 characters
    END
    Clear Element Text  ${IMPORT_DATA_INPUT_TEXT}
    CloseImportWindow