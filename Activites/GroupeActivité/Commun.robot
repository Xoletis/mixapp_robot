*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../resource/Import.robot

*** Keywords ***
AfficherCreationStageGA
    ${url}=         Get Location
    IF              "${url}" == "https://mixap-dev.surge.sh/"
        CreateGroupeActivite
        Sleep                           2
    END
    AfficherCreationStage               3

PasserEtapeSelection
    PasserEtapeSuivante         ${SELECTION_WINDOW}
