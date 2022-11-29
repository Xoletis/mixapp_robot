*** Settings ***
Documentation       Affichage du menu pricipale

Resource            ../Import.robot

*** Keywords ***
ShowMainMenu
    Element Should Be Visible       ${LOGO_XPATH}