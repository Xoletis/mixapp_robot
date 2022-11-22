*** Settings ***
Resource          resource_ivan.robot
Resource          CasDeTest.robot
Test Teardown    Close Browser
*** Test Cases ***
ScenarioMainMenu
    OpenMixap
    OpenImportWindow
    CloseImportWindow
    OpenImportWindow
    CloseImportWindowWithText
    EnterCodeLessSevenCharacter
    EnterCodeMoreSevenCharacter
