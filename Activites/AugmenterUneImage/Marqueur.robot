*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../../resource/Import.robot


*** Keywords ***
PrendreUnePhoto
    Click Element    ${ALLUMER_CAMERA}
    Sleep            2
    Click Element    ${PRENDRE_PHOTO}
    Sleep            2
    Click Element    ${PRENDRE_PHOTO}
    Sleep            2
    Element Should Not be Visible    ${ALLUMER_CAMERA}

ImporterImage
    Click Button  ${IMPORT_IMAGE}
    Sleep         2
    Choose File   ${IMPORT_IMAGE}       "C:\Users\Admin\Desktop\Scrum\mixapp_robot\resource\IMM.jpg"
    Sleep         2

PasserEtapeAugmentation
    Click Element               ${SUIVANT_2}
    Sleep                       2
    Element Should Be Visible   ${TEXT_AUGMENTATION}