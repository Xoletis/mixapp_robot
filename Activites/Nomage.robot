*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../Import.robot

Library    Selenium2Library

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

ModifiConsigne
    Click Element               ${BOUTON_CONSIGNE_MODIFIER}
    Press Keys                  none                        CONTROL+A
    Sleep                       2
    Press Keys                  none                           ${CONSIGNE}
    Sleep                       2
    Element Should Contain      ${EMPLACEMENT_CONSIGNE}        ${CONSIGNE}

