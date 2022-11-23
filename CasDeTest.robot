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

Click
    ClickElement                   ${LOGO_XPATH}
    Sleep                           2

CloseImportWindowWithText
    ${txt} =                        String.generate random string   3
    EnterText                       ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Click
    OpenImportWindow
    ${result} =                     GetInputValue                   ${IMPORT_DATA_INPUT_TEXT}
    IF                              "${result}" == "${txt}"
        ModifiFile     La fermeture de la fenêtre d'import des données avec du texte fonctionne (${result} = ${txt})
    ELSE
        ModifiFile     /!\\ La fermeture de la fenêtre d'import des données avec du texte ne fonctionne pas (${result} != ${txt})
    END
    Click

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
    Click

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
    Click

EnterFakeCode
    OpenImportWindow
    ${txt} =            String.generate random string   7
    EnterText           ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Sleep               2
    ClickElement        ${IMPORT_DATA_BUTTON}
    Sleep               2

OpenAddActivityWindow
    ClickWindow     ${ADD_ACTIVITY}
    Sleep           2

CloseAddActivityWindow
    ClickElement    ${CLOSE_ADD_ACTIVITY_WINDOW}
    Sleep           2

AddActivityAugmenterUneImage
    ClickElement    ${AUGMENTER_UNE_IMAGE}
    Sleep           2

OpenDashboard
    ClickElement        ${DASHBORD_BUTTON}
    ${url}=             Get Location
    IF                  "${URL}" == "https://mixap-dev.surge.sh/dashboard"
        ModifiFile          Le bouton a bien retourner sur le dashboard
    ELSE
        ModifiFile          /!\\ Le bouton n'a pas retourner sur le dashboard, url actuel : ${URL}
    END
    Sleep               2
    ${contenu}=         ChekIfDisplayNone           ${MON_CONTENU}
    ${apprenants}=      ChekIfDisplayNone           ${SUIVI_APPRENANTS}
    IF                  ${contenu} == "true"
        ModifiFile          Nous somme bien sur la fenêtre Mon Contenu
    ELSE
        ModifiFile          /!\\ Nous ne somme pas sur la fenêtre Mon Contenu
    END

GoToSuiviDapprenants
    ClickElement    ${SUIVI_APPRENANTS_BUTTON}
    Sleep           2
    ${apprenants}=  ChekIfDisplayNone           ${SUIVI_APPRENANTS}
    IF              ${apprenants} == "true"
        ModifiFile          Nous somme bien sur la fenêtre Suivi D'Apprenants
    ELSE
        ModifiFile          /!\\ Nous ne somme pas sur la fenêtre Suivi D'Apprenants
    END

GoToMonContenu
    ClickElement    ${MON_CONTENU_BUTTON}
    Sleep           2
    ${contenu}=     ChekIfDisplayNone           ${MON_CONTENU}
    IF              ${contenu} == "true"
        ModifiFile          Nous somme bien sur la fenêtre Mon Contenu
    ELSE
        ModifiFile          /!\\ Nous ne somme pas sur la fenêtre Mon Contenu
    END