*** Settings ***
Resource            resource/Import.robot

Test Teardown    Close Browser
*** Test Cases ***

ConnexionChrome
    OpenWebSiteChrome
    ShowMainMenu
