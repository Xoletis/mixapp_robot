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

*** Keywords ***

Open Browser To Welcome Page
    Create File                 ${PATH}              Log\n
    Open Browser                ${WELCOMEPAGE_URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed          ${DELAY}
    Welcome Page Should Be Open

Welcome Page Should Be Open
    Title Should Be   ${TITLE}

Click Window
    [Arguments]     ${Button}
    Click Button    ${Button}

Enter Text
    [Arguments]  ${Input}   ${Text}
    Input Text  ${Input}    ${Text}

GetInputValue
    [Arguments]         ${Input}
    ${INPUT_RETURN}     get element attribute   ${Input}    value
    [return]            ${INPUT_RETURN}

Modifi File
    [Arguments]         ${Text}
    ${file}=            Get File            ${PATH}
    ${date}=            Get Current Date    UTC                             exclude_millis=yes
    Create File         ${PATH}             ${file}${date} : ${Text}\n