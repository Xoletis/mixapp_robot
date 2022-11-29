*** Settings ***
Resource            Import.robot

Test Teardown    Close Browser
*** Test Cases ***

Test1
    OpenWebSiteChrome
    ShowMainMenu
    CreateAugmenterUneImageActivity
    PasserEtapeMarqueur
    AfficherCreationStage
    ImporterImage
    PasserEtapeAugmentation