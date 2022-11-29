*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../Import.robot

*** Keywords ***
AfficherCreationStage
    ${url}=         Get Location
    IF              "${url}" == "https://mixap-dev.surge.sh/"
        CreateAugmenterUneImageActivity
        Sleep                           2
    END
    Element Should Be Visible       ${ETAPE_NOMMAGE}
    Element Should Be Visible       ${ETAPE_MARQUEUR}
    Element Should Be Visible       ${ETAPE_AUGMENTATION}
    Element Should Be Visible       ${ETAPE_ESSAI}

GoBackToMainPageWithArrow
    Click Element               ${RETOUR}
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY}

GoBackToMainPageWithBrowserBack
    Go Back
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY}