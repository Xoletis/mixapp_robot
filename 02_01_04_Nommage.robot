*** Settings ***
Documentation     A test suite with a single test to purchase an item.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ressourceIbra.robot
Test Teardown     Close Browser
*** Test Cases ***
02.01.04.01
    Start Test
    Go to Augment Activity
    Go to Marqueur
    Element Should Be Visible    ${PRENDRE_PHOTO}
02.01.04.02
    Start Test
    Go to Augment Activity
    Element Should Be Visible    ${ETAPE_NOMMAGE}
    SleepA
    Element Should Be Visible    ${ETAPE_MARQUEUR}
    SleepA
    Element Should Be Visible    ${ETAPE_AUGMENTATION}
    SleepA
    Element Should Be Visible    ${ETAPE_ESSAI}
    SleepA
02.01.04.06
    Start Test
    Go to Augment Activity
    Click Element    ${BOUTON_TITRE_MODIFIER}
    Press Keys       none    CONTROL+A
    SleepA
    Press Keys       none    ${TITRE}
    SleepA
    Element Should Contain    ${EMPLACEMENT_TITRE}     ${TITRE}
02.01.04.08
    Start Test
    Go to Augment Activity
    Click Element    ${BOUTON_DESCRIPTION_MODIFIER}
    Press Keys       none    CONTROL+A
    SleepA
    Press Keys       none    ${DESCRIPTION}
    SleepA
    Element Should Contain    ${EMPLACEMENT_DESCRIPTION}     ${DESCRIPTION}
02.01.04.09
    Start Test
    Go to Augment Activity
    Click Element    ${HOME}
    SleepA
    Element Should Be Visible    ${+ACTIVITE2} 
02.01.04.11
    Start Test
    Go to Augment Activity
    Click Element    ${RETOUR}
    SleepA
    Element Should Be Visible    ${+ACTIVITE} 
02.01.04.12
    Start Test
    Go to Augment Activity
    Go Back
    SleepA
    Element Should Be Visible    ${+ACTIVITE}