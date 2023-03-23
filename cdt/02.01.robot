#autor : Ivan Rocque

*** Settings ***
Resource            ../resource/Import.robot

Test Teardown    Close Browser

*** Test Cases ***

#Auteur : Ibrahim
02.01.01.01
    Log                              Passer à l'étape "Augmentation"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${GO_TO_AMELIORATION_WINDOW_IN_HEADER_MENU}
    Sleep                            2
    Element Should Be Visible        ${HEADER_IN_ACTIVITY_SET_UP}

#Auteur : Ibrahim
02.01.01.02
    Log                              Afficher les étapes de créations
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${NEXT_WINDOW_FOR_SET_UP_ACTIVITY_BUTTON}
    Sleep                            2
    Element Should Be Visible        ${HEADER_IN_ACTIVITY_SET_UP}

#Auteur : Ibrahim
02.01.01.03.01
    Log                              Prendre une photo
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${GO_TO_AMELIORATION_WINDOW_IN_HEADER_MENU}
    Sleep                            2
    Click Element                    ${TAKE_PHOTO_BUTTON}
    Sleep                            2
    Element Should Be Visible        ${TAKE_PHOTO_WINDOW}

#Auteur : Ibrahim
02.01.01.03.03
    Log                              Importer une photo
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${TAKE_PHOTO_BUTTON}
    Sleep                            2
    Choose File                      ${IMPORT_PHOTO_BUTTON}           ../resource/IMM.jpg
    Sleep                            5
    Element Should Be Visible        ${TAKE_PHOTO_WINDOW}

#Auteur : Ibrahim
02.01.01.06
    Log                              Retourner au menu principal via le bouton retour arrière du navigateur
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${GO_TO_AMELIORATION_WINDOW_IN_HEADER_MENU}
    Sleep                            2
    Go Back
    Element Should Be Visible        ${LOGO_XPATH}

#Auteur : Ivan et Ibrahim
02.01.01.07
    Log                              Retourner au menu principal via la flèche
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${GO_TO_AMELIORATION_WINDOW_IN_HEADER_MENU}
    Sleep                            2
    Click Element                    ${GO_BACK_TO_MAIN_MENU_WITH_ARROW_BUTTON}
    Element Should Be Visible        ${LOGO_XPATH}

#Auteur : Ivan et Ibrahim
02.01.01.08
    Log                              Retourner au menu principal via le bouton menu principal
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${GO_TO_AMELIORATION_WINDOW_IN_HEADER_MENU}
    Sleep                            2
    Click Element                    ${GO_BACK_TO_MAIN_MENU_WITH_HOME_BUTTON}
    Element Should Be Visible        ${LOGO_XPATH}

#Auteur : Ivan
02.01.04.01
    Log                              Passer à l'étape "Marqueur"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Click Element                    ${NEXT_WINDOW_FOR_SET_UP_ACTIVITY_BUTTON}
    Sleep                            2
    Element Should Be Visible        ${HEADER_IN_ACTIVITY_SET_UP}

#Auteur : Ivan et Ibrahim
02.01.04.02
    Log                              Afficher les étapes de créations
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            2
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            2
    Element Should Be Visible        ${HEADER_IN_ACTIVITY_SET_UP}