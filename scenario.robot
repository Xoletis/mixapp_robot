*** Settings ***
Resource          resources.robot
Resource          CasDeTest.robot
Test Teardown    Close Browser
*** Test Cases ***
ScenarioMainMenu
    OpenMixap

    OpenImportWindow
    Click
    OpenImportWindow
    CloseImportWindowWithText
    ReturnMainPage
    EnterCodeLessSevenCharacter
    ReturnMainPage
    EnterCodeMoreSevenCharacter

    OpenDashboard
    GoToSuiviDapprenants
    GoToMonContenu

    ReturnMainPage
    OpenAddActivityWindow
    CloseAddActivityWindow
    CreateAugmenterUneImageActivity
    ReturnMainPage
    LookActivityCreate
    EditeOneActivity
    ReturnToMainPage
    PlayOneActivity
    ReturnToMainPage
    DeleteOneActivity

    OpenMoreOptionWindow
    Click

    ReturnMainPage
    EnterFakeCode
    ReturnMainPage
    EnterRealCode
    ReturnMainPage

ScenarioActiviteAugmenterUneImage
    OpenMixap
    AfficherCreationStage
    ModifyTitle
    ModifyDesc
    GoBackToMainPageWithArrow
    EditeOneActivity
    GoBackToMainPageWithBrowserBack
    EditeOneActivity
    PasserEtapeSuivante