*** Settings ***
Documentation       La liste des Différents pas de test

Library             Selenium2Library
Library             String

Resource            resource_ivan.robot

*** Variables ***


*** Keywords ***
OpenWebSite
    OpenBrowser
    Sleep                           2

OpenImportWindow
    ClickWindow                    ${IMPORT_DATA}
    Sleep                           2

Click
    ClickElement                   ${LOGO_XPATH}
    Sleep                           2

CloseImportWindowWithText
    ${txt} =                        String.generate random string   3
    EnterText                       ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Click
    OpenImportWindow
    ${result} =                     GetInputValue                   ${IMPORT_DATA_INPUT_TEXT}
    Run Keyword If                  "${result}" != "${txt}"         Fatal Error                 ${result} n'est pas égale à ${txt}
    Click

EnterCodeLessSevenCharacter
    ReturnMainPage
    OpenImportWindow
    ${txt} =                        String.generate random string   3
    EnterText                       ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Element Should Be Disabled      ${IMPORT_DATA_BUTTON}
    Clear Element Text              ${IMPORT_DATA_INPUT_TEXT}
    Click

EnterCodeMoreSevenCharacter
    ReturnMainPage
    OpenImportWindow
    ${txt} =                            String.generate random string   7
    EnterText                           ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Element Should Be Enabled            ${IMPORT_DATA_BUTTON}
    Clear Element Text                  ${IMPORT_DATA_INPUT_TEXT}
    Click

EnterFakeCode
    ReturnMainPage
    OpenImportWindow
    ${txt} =            String.generate random string   7
    EnterText           ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Sleep               2
    ClickElement        ${IMPORT_DATA_BUTTON}
    Sleep               5

EnterRealCode
    ReturnMainPage
    OpenImportWindow
    EnterText           ${IMPORT_DATA_INPUT_TEXT}       ${CODE_IMPORT}
    Sleep               2
    ClickElement        ${IMPORT_DATA_BUTTON}
    Sleep               5



OpenDashboard
    ClickElement        ${DASHBORD_BUTTON}
    Sleep               2
    ${url}=             Get Location
    Run Keyword If      "${url}" != "https://mixap-dev.surge.sh/dashboard"      Fatal Error        Nous ne somme pas sur le dashboard : ${url}
    ${contenu}=         ChekIfDisplayNone           ${MON_CONTENU}
    Run Keyword If      ${contenu} == "false"        Fatal Error        L'onglet Mon Contnu n'est pas visible

GoToSuiviDapprenants
    ClickElement    ${SUIVI_APPRENANTS_BUTTON}
    Sleep           2
    ${apprenants}=  ChekIfDisplayNone           ${SUIVI_APPRENANTS}
    Run Keyword If      ${apprenants} == "false"        Fatal Error        L'onglet Suivi d'Apprenants n'est pas visible

GoToMonContenu
    ClickElement    ${MON_CONTENU_BUTTON}
    Sleep           2
    ${contenu}=     ChekIfDisplayNone           ${MON_CONTENU}
    Run Keyword If      ${contenu} == "false"        Fatal Error        L'onglet Mon Contnu n'est pas visible




OpenAddActivityWindow
    ClickWindow                 ${ADD_ACTIVITY}
    Sleep                       2

CloseAddActivityWindow
    ClickElement    ${CLOSE_ADD_ACTIVITY_WINDOW}
    Sleep           2

CreateAugmenterUneImageActivity
    OpenAddActivityWindow
    ClickElement    ${AUGMENTER_UNE_IMAGE}
    Sleep           2

LookActivityCreate
    ${nbCard}=  GetChild    ${CARDS}
    FOR         ${i}        IN RANGE       ${nbCard}
        Element Should Be Visible        //*[@id="root"]/div/div[2]/div/div[${i+1}]
    END

DeleteOneActivity
    ${nbCard}=  GetChild    ${CARDS}
    ${number}=    Evaluate    random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement    //*[@id="root"]/div/div[2]/div/div[${number[0]}]/ul/li[4]/span/button/span
    Sleep           2
    ClickElement    xpath:/html/body/div[2]/div/div/ul/li/span/button/span
    Sleep           2

EditeOneActivity
    ${nbCard}=  GetChild    ${CARDS}
    ${number}=    Evaluate    random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement    //*[@id="root"]/div/div[2]/div/div[${number[0]}]/ul/li[3]/span/button/span
    Sleep           2
    ReturnMainPage
    Sleep           2

PlayOneActivity
    ${nbCard}=  GetChild    ${CARDS}
    ${number}=    Evaluate    random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement    //*[@id="root"]/div/div[2]/div/div[${number[0]}]/div[1]/div/div[2]/button/span
    Sleep           2
    ReturnMainPage
    Sleep           2
#    //*[@id="root"]/div/div[2]/div/div[2]/div[1]/button/span



OpenMoreOptionWindow
    ClickWindow                    ${MORE_OPTION_BUTTON}
    Sleep                          2