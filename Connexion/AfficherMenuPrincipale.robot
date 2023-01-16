*** Settings ***
Documentation       Affichage du menu pricipale

Resource            ../resource/Import.robot

*** Keywords ***
ShowMainMenu
    Element Should Be Visible       ${LOGO_XPATH}