*** Settings ***
Documentation       Affichage du menu pricipale

Library             Selenium2Library
Library             String

Resource            ../resources.robot

*** Keywords ***
ShowMainMenu
    Element Should Be Visible       ${LOGO_XPATH}