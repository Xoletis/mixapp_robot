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
${DELAY}                    0
${TITLE}                    MIXAP

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
${MORE_OPTION_BUTTON}           xpath://*[@id="root"]/div/div[1]/div/div[1]/span/div/div[4]/button
${BOUTON_TITRE_MODIFIER}        xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[1]/h5/div/span
${BOUTON_DESCRIPTION_MODIFIER}  xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[2]/span/div
${RETOUR}                       xpath://*[@id="root"]/section/header/div/div/div/div/div/span
${SUIVANT}                      xpath://*[@id="board-content"]/footer/div/div/button/span[2]

#Element Html
${LOGO_XPATH}                   xpath://*[@id="root"]/div/div[1]/div/div[1]/div/span/span/img
${SUIVI_APPRENANTS}             xpath://*[@id="rc-tabs-0-panel-2"]
${MON_CONTENU}                  xpath://*[@id="rc-tabs-0-panel-1"]
${CARDS}                        xpath://*[@id="root"]/div/div[2]/div
${CODE_UTILISATEUR}             xpath:/html/body/div[7]/div/div/ul/li[2]/span/span[2]/strong
${ETAPE_NOMMAGE}                xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[1]
${ETAPE_MARQUEUR}               xpath:html/body/div[1]/section/section/main/section/main/header/div/div[2]
${ETAPE_AUGMENTATION}           xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[3]
${ETAPE_ESSAI}                  xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[4]
${EMPLACEMENT_TITRE}            xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[1]
${EMPLACEMENT_DESCRIPTION}      xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[2]
${PRENDRE_PHOTO}                xpath://*[@id="three-canvas"]/div[3]/div/div/div[1]/button/div/div[2]/div
${ADD_ACTIVITY_TXT}             xpath://*[@id=":r0:"]
${PLAY_ACTIVITY_WINDOW}         xpath://*[@id="three-canvas"]/div[4]/div/span[1]

#Autre
${CODE_IMPORT}                  5eda26
${TITRE}                        TitreTest
${DESCRIPTION}                  Ceci est une description
*** Keywords ***

OpenMixap
    [Arguments]                     ${BROWSER}
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

ReturnMainPage
    Go To       ${WELCOMEPAGE_URL}
    Sleep       2

GetChild
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}
    ${children}     Call Method
    ...                ${element}
    ...                find_elements
    ...                  by=xpath    value=child::*

    ${return}=        Get Length    ${children}
    [Return]          ${return}