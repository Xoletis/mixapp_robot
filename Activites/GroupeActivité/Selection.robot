*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../Import.robot

*** Keywords ***
AddAllActivityInGroupeActivite
    Click Element               ${ADD_ACTIVITY_GA}
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY_GA_WINDOW}
    ${elements}=                   GetChild                    ${ADD_ACTIVITY_GA_WINDOW}
    ${Size}=                       Get Length                   ${elements}
    FOR    ${i}    IN RANGE    ${size}
        Click Element    ${elements[${i}]}
    Sleep                       2
    END
    Click Element               ${VALIDE_BUTON}
    Element Should Be Enabled   ${SUIVANT}
    Sleep                       2

AddOneActivityInGroupeActivite
    Click Element               ${ADD_ACTIVITY_GA}
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY_GA_WINDOW}
    ${elements}=                GetChild                    ${ADD_ACTIVITY_GA_WINDOW}
    Click Element               ${elements[0]}
    Sleep                       2
    Click Element               ${VALIDE_BUTON}
    Element Should Be Disabled  ${SUIVANT}
    Click Element               ${ADD_ACTIVITY_GA}
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY_GA_WINDOW}
    Click Element               ${elements[0]}
    Sleep                       2
    Click Element               ${VALIDE_BUTON}

PasserEtapeTest
    PasserEtapeSuivante    ${TEST_WINDOW}