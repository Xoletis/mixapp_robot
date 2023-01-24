*** Settings ***
Resource            ../resource/Import.robot

Documentation       La camera

Test Teardown    Close Browser

*** Test Cases ***
Test camera
    OpenWithChrome                   
    Sleep                            2
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            ${PAUSE}
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            1
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/div/div[3]/div/div/div[1]/button
    Sleep                            2
    Click Element                    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div[3]/div/div[2]/button
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
