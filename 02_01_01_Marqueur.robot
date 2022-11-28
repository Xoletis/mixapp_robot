*** Settings ***
Documentation     A test suite with a single test to purchase an item.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ressourceIbra.robot
Test Teardown     Close Browser
*** Test Cases ***
02.01.01.01
    Start Test
    Go to Augment Activity
    Go to Marqueur
    #Go to Augmentation
    #Element Should Be Visible    
02.01.01.02
    Start Test
    Go to Augment Activity
    Go to Marqueur
    Element Should Be Visible    ${ETAPE_NOMMAGE}
    SleepA
    Element Should Be Visible    ${ETAPE_MARQUEUR}
    SleepA
    Element Should Be Visible    ${ETAPE_AUGMENTATION}
    SleepA
    Element Should Be Visible    ${ETAPE_ESSAI}
    SleepA
02.01.01.03.01
    Start Test
    Go to Augment Activity
    Go to Marqueur
    Click Element    ${ALLUMER_CAMERA}
    SleepB
    Click Element    ${PRENDRE_PHOTO}
    SleepA
    Click Element    ${PRENDRE_PHOTO}
    SleepA
    Element Should Not be Visible    ${ALLUMER_CAMERA}
02.01.01.03.03
02.01.01.06
    Start Test
    Go to Augment Activity
    Go to Marqueur
    Go Back
    SleepA
    Element Should Be Visible    ${+ACTIVITE}
02.01.01.07
    Start Test
    Go to Augment Activity
    Go to Marqueur
    Click Element    ${RETOUR}
    SleepA
    Element Should Be Visible    ${+ACTIVITE} 
02.01.01.08
   Start Test
    Go to Augment Activity
    Go to Marqueur
    Click Element    ${HOME}
    SleepA
    Element Should Be Visible    ${+ACTIVITE2} 
