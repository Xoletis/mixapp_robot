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

${WELCOMEPAGE_URL}          https://mixap-dev.surge.sh/
${BROWSER}                  Chrome
${DELAY}                    0
${TITLE}                    MIXAP
${PATH}                     ${CURDIR}/result.txt
${IMPORT_DATA}              xpath://*[@id="root"]/div/div[1]/div/div[1]/span/div/div[1]/button
${LOGO_XPATH}               xpath://*[@id="root"]/div/div[1]/div/div[1]/div/span/span/img
${IMPORT_DATA_INPUT_TEXT}   xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[1]/input
${IMPORT_DATA_WINDOW}       xpath:/html/body/div[2]/div/div/div/div[2]/div[2]
${IMPORT_DATA_BUTTON}       xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[2]/button

*** Keywords ***

OpenMixap
    Create File                     ${PATH}              Log\n
    OpenBrowser                     ${WELCOMEPAGE_URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed              ${DELAY}
    Wait Until Element Is Visible   ${LOGO_XPATH}
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