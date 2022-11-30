*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../Import.robot

*** Keywords ***
NextActivity
    Click Element               ${BUTON_NEXT}
    Sleep                       2

PrevousActivity
    Click Element               ${BUTON_PREVIUS}
    Sleep                       2

ViewAllActivities
    Click Element               ${VIEW_ALL_ACTIVITY}
    Sleep                       2
    Element Should Be Visible   ${VIEW_ALL_ACTIVITY_WINDOW}