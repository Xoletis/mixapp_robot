*** Settings ***
Resource          resource_ivan.robot
Resource          CasDeTest.robot
Test Teardown    Close Browser
*** Test Cases ***
ScenarioMainMenu
    OpenMixap

#############################################################################################################
######################################## Fênetre d'import de donnée #########################################
#############################################################################################################
    OpenImportWindow
    Click
    OpenImportWindow
    CloseImportWindowWithText
    EnterCodeLessSevenCharacter
    EnterCodeMoreSevenCharacter
    EnterFakeCode
    EnterRealCode

#############################################################################################################
################################################ Dashboard ##################################################
#############################################################################################################
    OpenDashboard
    GoToSuiviDapprenants
    GoToMonContenu

#############################################################################################################
################################################ + Activité #################################################
#############################################################################################################
    ReturnMainPage
    OpenAddActivityWindow
    CloseAddActivityWindow
    CreateAugmenterUneImageActivity
    ReturnMainPage
    LookActivityCreate
    EditeOneActivity
    PlayOneActivity
    DeleteOneActivity

#############################################################################################################
################################################# + Option ##################################################
#############################################################################################################
    OpenMoreOptionWindow
    Click
