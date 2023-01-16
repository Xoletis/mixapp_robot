*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../resource/Import.robot

*** Keywords ***
AfficherCreationStageAI
    ${url}=         Get Location
    IF              "${url}" == "https://mixap-dev.surge.sh/"
        CreateAugmenterUneImageActivity
        Sleep                           2
    END
    AfficherCreationStage    4

PasserEtapeMarqueur
    PasserEtapeSuivante         ${AUGMENTATION_WINDOW}