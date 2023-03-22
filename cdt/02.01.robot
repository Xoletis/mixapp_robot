#autor : Ivan Rocque

*** Settings ***
Resource            ../resource/Import.robot

Test Teardown    Close Browser

*** Test Cases ***

02.01.01.01
    Log                              Passer à l'étape "Augmentation"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[3]/div/div[2]
    Sleep                            2
    Element Should Be Visible        xpath:/html/body/div[1]/section/section/main/section/main/div/div[2]/div/div/button[1]/span[2]

02.01.01.02
    Log                              Afficher les étapes de créations
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Element Should Be Visible        xpath:/html/body/div[1]/section/section/main/section/main/header

02.01.01.03.01
    Log                              Prendre une photo
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
    Sleep                            2
    Click Element                    xpath://div[@id='three-canvas']/div[3]/div/div
    Sleep                            2
    Element Should Be Visible        xpath://*[@id="rc-tabs-5-panel-0"]

02.01.01.03.03
    Log                              Prendre une photo
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
    Sleep                            2
    Choose File                      xpath:/html/body/div[1]/section/section/main/section/main/div/div[3]/div/div/div[3]/span/div/span            ../resource/IMM.jpg
    Sleep                            5
    Element Should Be Visible        xpath://*[@id="rc-tabs-5-panel-0"]

02.01.01.06
    Log                              Retourner au menu principal via le bouton retour arrière du navigateur
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
    Sleep                            2
    Go Back
    Element Should Be Visible        ${LOGO_XPATH}

02.01.01.07
    Log                              Retourner au menu principal via la flèche
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
    Sleep                            2
    Click Element                    xpath:(.//*[normalize-space(text()) and normalize-space(.)='Visualiser l’image'])[1]/preceding::*[name()='svg'][1]
    Element Should Be Visible        ${LOGO_XPATH}

02.01.01.08
    Log                              Retourner au menu principal via le bouton menu principal
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button
    Sleep                            2
    Click Element                    xpath:(.//*[normalize-space(text()) and normalize-space(.)='Visualiser l’image'])[1]/following::*[name()='svg'][1]
    Element Should Be Visible        ${LOGO_XPATH}

