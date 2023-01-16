*** Settings ***
Documentation       Test Commun à toute les activité

Resource            ../resource/Import.robot

*** Keywords ***
GoBackToMainPageWithArrow
    Click Element               ${RETOUR}
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY}

GoBackToMainPageWithBrowserBack
    Go Back
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY}