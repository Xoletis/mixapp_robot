*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           Selenium2Library
Library           String
Library           OperatingSystem
Library           DateTime


*** Variables ***

#Important
${WELCOMEPAGE_URL}          https://mixap-dev.surge.sh/
${BROWSER}                  Chrome
${DELAY}                    0
${TITLE}                    MIXAP
${PATH}                     ${CURDIR}/result.txt

#Boutton
${IMPORT_DATA}                  xpath://*[@id="root"]/div/div[1]/div/div[1]/span/div/div[1]/button
${IMPORT_DATA_INPUT_TEXT}       xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[1]/input
${IMPORT_DATA_BUTTON}           xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[2]/button
${ADD_ACTIVITY}                 xpath://*[@id="root"]/div/div[2]/div/div[1]/div/div/button
${ADD_ACTIVITY_2}               xpath://*[@id="rc-tabs-3-panel-1"]/div/div[1]/div/div/button
${AUGMENTER_UNE_IMAGE}          xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div/div[1]/div[1]
${DASHBORD_BUTTON}              xpath://*[@id="root"]/div/div[1]/div/div/span/div/div[3]/button
${SUIVI_APPRENANTS_BUTTON}      xpath://*[@id="rc-tabs-0-tab-2"]/h4
${MON_CONTENU_BUTTON}           xpath://*[@id="rc-tabs-0-tab-1"]/h4
${CLOSE_ADD_ACTIVITY_WINDOW}    xpath:/html/body/div[2]/div/div[2]/div/div[2]/button


#Element Html
${LOGO_XPATH}               xpath://*[@id="root"]/div/div[1]/div/div[1]/div/span/span/img
${IMPORT_DATA_WINDOW}       xpath:/html/body/div[2]/div/div/div/div[2]/div[2]
${SUIVI_APPRENANTS}         xpath://*[@id="rc-tabs-0-panel-2"]
${MON_CONTENU}              xpath://*[@id="rc-tabs-0-panel-1"]

*** Keywords ***

OpenMixap
    Create File                     ${PATH}              Log\n
    OpenBrowser                     ${WELCOMEPAGE_URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed              ${DELAY}
    Wait Until Element Is Visible   ${LOGO_XPATH}        100000
    WelcomePageShouldBeOpen

WelcomePageShouldBeOpen
    Title Should Be   ${TITLE}

ClickWindow
    [Arguments]     ${Button}
    Click Button    ${Button}

EnterText
    [Arguments]  ${Input}   ${Text}
    Input Text  ${Input}    ${Text}

GetInputValue
    [Arguments]         ${Input}
    ${INPUT_RETURN}     get element attribute   ${Input}    value
    [return]            ${INPUT_RETURN}

ModifiFile
    [Arguments]         ${Text}
    ${file}=            Get File            ${PATH}
    ${date}=            Get Current Date    UTC                             exclude_millis=yes
    Create File         ${PATH}             ${file}${date} : ${Text}\n

ChekIfDisplayNone
    [Arguments]         ${Element}
    ${style}=           Get Element Attribute          ${Element}             style
    ${return}=          Set Variable                    "null"
    IF                  "${style}" == "display: none;"
        ${return}=  Set Variable                  "false"
    ELSE
        ${return}=  Set Variable                  "true"
    END
    [return]            ${return}