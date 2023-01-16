*** Settings ***
Documentation       Création d'acivité

Resource            ../resource/Import.robot


*** Keywords ***

OpenAddActivityWindow
    ClickWindow                 ${ADD_ACTIVITY}
    Sleep                       2
    Element Should Be Visible   ${ADD_ACTIVITY_TXT}

CloseAddActivityWindow
    ClickElement                 ${CLOSE_ADD_ACTIVITY_WINDOW}
    Element Should Be Visible    ${LOGO_XPATH}
    Sleep                        2

CreateAugmenterUneImageActivity
    CreateActivity    ${AUGMENTER_UNE_IMAGE}

CreateValideUneImageActivity
    CreateActivity    ${VALIDER_UNE_IMAGE}

CreateGroupeActivite
    CreateActivity    ${GROUPE_ACTIVITE}

LookActivityCreate
    ReturnMainPage
    Sleep           2
    ${nbCard}=  GetChild    ${CARDS}
    FOR         ${i}        IN RANGE       ${nbCard}
        Element Should Be Visible        //*[@id="root"]/div/div[2]/div/div[${i+1}]
    END

DeleteOneActivity
    ReturnMainPage
    ${nbCard}=  GetChild    ${CARDS}
    ${number}=    Evaluate    random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement    //*[@id="root"]/div/div[2]/div/div[${number[0]}]/ul/li[4]/span/button/span
    Sleep           2
    ClickElement    xpath:/html/body/div[2]/div/div/ul/li/span/button/span
    Sleep           2

EditeOneActivity
    ReturnMainPage
    ${nbCard}=  GetChild    ${CARDS}
    ${number}=    Evaluate    random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement    //*[@id="root"]/div/div[2]/div/div[${number[0]}]/ul/li[3]/span/button/span
    Element Should Be Visible       ${ETAPE_NOMMAGE}
    Sleep           2

PlayOneActivity
    ReturnMainPage
    ${nbCard}=  GetChild    ${CARDS}
    ${number}=    Evaluate    random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement    //*[@id="root"]/div/div[2]/div/div[${number[0]}]/div[1]/div/div[2]/button/span
    Sleep           2
    Element Should Be Visible       ${PLAY_ACTIVITY_WINDOW}


CreateAllActivies
    FOR    ${i}    IN RANGE   4
        CreateActivity    xpath:(//img[@alt='example'])[${i+1}]
            AfficherCreationStageAI
            ModifyTitle
            ModifyDesc
            ReturnMainPage
    END