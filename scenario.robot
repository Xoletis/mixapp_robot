*** Settings ***
Resource          resource_ivan.robot
Resource          CasDeTest.robot
Test Teardown    Close Browser
*** Test Cases ***
ScenarioMainMenu
    OpenWebSite
    OpenImportWindow
    CloseImportWindowNoText
    OpenImportWindow
    CloseImportWindowWithText