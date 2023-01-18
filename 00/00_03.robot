*** Settings ***
Resource            ../resource/Import.robot

Test Teardown    Close Browser

*** Test Cases ***

00.03
    Log                "Afficher menu principal"
    OpenWithChrome
    Element Should Be Visible       ${LOGO_XPATH}