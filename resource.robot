*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           Selenium2Library
Library    String


*** Variables ***

${WELCOMEPAGE_URL}    https://petstore.octoperf.com/
${BROWSER}        Chrome
${DELAY}          0

*** Keywords ***

Open Browser To Welcome Page
    Open Browser    ${WELCOMEPAGE_URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Welcome Page Should Be Open

