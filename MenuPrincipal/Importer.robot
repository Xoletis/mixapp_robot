*** Settings ***
Documentation       La liste des Différents pas de test

Resource            ../resource/Import.robot


*** Keywords ***
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
    ReturnMainPage

EnterCodeMoreSevenCharacter
    OpenImportWindow
    ${txt} =                            String.generate random string   7
    EnterText                           ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Element Should Be Enabled            ${IMPORT_DATA_BUTTON}
    Clear Element Text                  ${IMPORT_DATA_INPUT_TEXT}
    ReturnMainPage

EnterFakeCode
    ReturnMainPage
    OpenImportWindow
    ${txt} =            String.generate random string   7
    EnterText           ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Sleep               2
    ClickElement        ${IMPORT_DATA_BUTTON}
    Sleep               2

EnterRealCode
    ReturnMainPage
    OpenImportWindow
    EnterText           ${IMPORT_DATA_INPUT_TEXT}       ${CODE_IMPORT}
    Sleep               2
    ClickElement        ${IMPORT_DATA_BUTTON}
    Sleep               2