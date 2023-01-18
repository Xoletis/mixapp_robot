*** Settings ***
Resource            ../resource/Import.robot

Test Teardown    Close Browser

*** Test Cases ***

00.01.01
    Log            "Connexion au site web sur Chrome"
    OpenWithChrome
