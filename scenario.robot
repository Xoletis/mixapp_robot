*** Settings ***
Resource            resource/Import.robot

Test Teardown    Close Browser
*** Test Cases ***

TestOneActivities
    CreateAugmenterUneImageActivity
    GoBackToMainPageWithBrowserBack

# CreateAllActivie
#     OpenWebSiteChrome
#     ShowMainMenu
#     CreateAllActivies
#     CreateGroupeActivite
#     AfficherCreationStageGA
#     ModifyTitle
#     ModifyDesc
#     PasserEtapeSelection
#     AfficherCreationStageGA
#     AddOneActivityInGroupeActivite
#     AddAllActivityInGroupeActivite
#     PasserEtapeTest
#     NextActivity
#     PrevousActivity
#     ViewAllActivities

