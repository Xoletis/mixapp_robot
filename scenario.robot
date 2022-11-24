*** Settings ***
Resource          resources.robot
Resource          CasDeTest.robot
Test Teardown    Close Browser
*** Test Cases ***
ScenarioMainMenPart1
    OpenMixap

    OpenImportWindow
    Click
    OpenImportWindow
    CloseImportWindowWithText
    ReturnMainPage
    EnterCodeLessSevenCharacter
    ReturnMainPage
    EnterCodeMoreSevenCharacter
    ReturnMainPage
    EnterFakeCode
    ReturnMainPage
    EnterRealCode
    ReturnMainPage

ScenarioMainMenPart2
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