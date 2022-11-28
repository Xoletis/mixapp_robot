*** Settings ***
Documentation       La liste des Différents pas de test

Library             Selenium2Library
Library             String

Resource            resources.robot


*** Keywords ***
AfficherCreationStage
    CreateAugmenterUneImageActivity
    Sleep                           2
    Element Should Be Visible       ${ETAPE_NOMMAGE}
    Element Should Be Visible       ${ETAPE_MARQUEUR}
    Element Should Be Visible       ${ETAPE_AUGMENTATION}
    Element Should Be Visible       ${ETAPE_ESSAI}

ModifyTitle
    Click Element               ${BOUTON_TITRE_MODIFIER}
    Press Keys                  none                        CONTROL+A
    Sleep                       2
    Press Keys                  none                        ${TITRE}
    Sleep                       2
    Element Should Contain      ${EMPLACEMENT_TITRE}        ${TITRE}

ModifyDesc
    Click Element               ${BOUTON_DESCRIPTION_MODIFIER}
    Press Keys                  none                            CONTROL+A
    Sleep                       2
    Press Keys                  none                            ${DESCRIPTION}
    Sleep                       2
    Element Should Contain      ${EMPLACEMENT_DESCRIPTION}      ${DESCRIPTION}

GoBackToMainPageWithArrow
    Click Element               ${RETOUR}
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY}

GoBackToMainPageWithBrowserBack
    Go Back
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY}

PasserEtapeSuivante
    Click Element               ${SUIVANT}
    Sleep                       2
    Element Should Be Visible   ${PRENDRE_PHOTO}
    Sleep                       2