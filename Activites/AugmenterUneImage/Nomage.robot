*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../Import.robot


*** Keywords ***

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

PasserEtapeMarqueur
    Click Element               ${SUIVANT}
    Sleep                       2
    Element Should Be Visible   ${AUGMENTATION_WINDOW}