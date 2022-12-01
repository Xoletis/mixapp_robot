*** Settings ***
Resource            Import.robot

Test Teardown    Close Browser
*** Test Cases ***

Test1
    OpenWebSiteChrome
    ShowMainMenu
    FOR    ${i}    IN RANGE     3
        CreateAugmenterUneImageActivity
        AfficherCreationStageAI
        ReturnMainPage
    END
    CreateGroupeActivite
    AfficherCreationStageGA
    ModifyTitle
    ModifyDesc
    ModifiConsigne
    PasserEtapeSelection
    AfficherCreationStageGA
    AddOneActivityInGroupeActivite
    AddAllActivityInGroupeActivite
    PasserEtapeTest
    Initialise
    NextActivity
    PrevousActivity
    ViewAllActivities
