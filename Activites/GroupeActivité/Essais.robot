*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../resource/Import.robot

*** Keywords ***
NextActivity
    Click Element               ${BUTON_NEXT}
    Sleep                       2
    Element Should Be Enabled   ${BUTON_PREVIUS}
    ${nb}=                      GetNumberOfActivies
    IF    ${nb} == 2
        Element Should Be Disabled    ${BUTON_NEXT}
    END

PrevousActivity
    Click Element               ${BUTON_PREVIUS}
    Sleep                       2

ViewAllActivities
    Click Element               ${VIEW_ALL_ACTIVITY}
    Sleep                       5
    Element Should Be Visible   ${VIEW_ALL_ACTIVITY_WINDOW}

CloseViewAllActivitiesWindow
    Click Element               ${CLOSE_VIEW_ACTIVITIES_BUTON}
    Sleep                       2
    Element Should Be Visible   ${TEST_WINDOW}

Initialise
    Element Should Be Disabled  ${BUTON_PREVIUS}
    Element Should Be Enabled   ${BUTON_NEXT}
    ${nb}=                      GetNumberOfActivies

GetNumberOfActivies
    ViewAllActivities
    ${Activities_List}=         GetChild    ${ACTIVITIES_IN_GA}
    ${nb}=                      Get Length  ${Activities_List}
    Sleep                       2
    CloseViewAllActivitiesWindow
    [Return]                    ${nb}