*** Settings ***
Resource            Import.robot

Test Teardown    Close Browser
*** Test Cases ***

Test1
    OpenWebSiteChrome
    ShowMainMenu
    CreateAugmenterUneImageActivity
    AfficherCreationStageAI
    ReturnMainPage
    CreateAugmenterUneImageActivity
    ReturnMainPage
    CreateGroupeActivite
    AfficherCreationStageGA
    ModifyTitle
    ModifyDesc
    ModifiConsigne
    PasserEtapeSelection