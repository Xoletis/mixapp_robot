*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Resource        Import.robot


*** Keywords ***

OpenWithChrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   modules=sys      # EdgeOptions() à changer en fonction du navigateur
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream           # Évite d'avoir à accorder des autorisations pour les caméras et les microphones.
    Call Method    ${options}    add_argument    --auto-select-desktop-capture-source     # Sélectionne automatiquement une source de média (en général la webcam)
    OpenMixap      Chrome          ${options}
    Sleep          2

OpenMixap
    [Arguments]                     ${BROWSER}              ${options}
    Open Browser    ${WELCOMEPAGE_URL}   ${BROWSER}   options=${options}
    Maximize Browser Window
    Set Selenium Speed              ${DELAY}
    Wait Until Element Is Visible   ${LOGO_XPATH}        100000
    WelcomePageShouldBeOpen

WelcomePageShouldBeOpen
    Title Should Be   ${TITLE}

EnterText
    [Arguments]  ${Input}   ${Text}
    SeleniumLibrary.Input Text  ${Input}    ${Text}

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

CreateActivity
    [Arguments]         ${Activity}
    #OpenAddActivityWindow
    ClickElement    ${Activity}
    Sleep           2

ReturnMainPage
    Go To                           ${WELCOMEPAGE_URL}
    Wait Until Element Is Visible   ${LOGO_XPATH}        100000

GetChildNb
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}
    ${children}     Call Method
    ...                ${element}
    ...                find_elements
    ...                  by=xpath    value=child::*

    ${return}=        Get Length    ${children}
    [Return]          ${return}


AfficherCreationStage
    [Arguments]     ${nb}
    FOR    ${i}    IN RANGE   ${nb}
        Element Should Be Visible       xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[${i+1}]
    END

PasserEtapeSuivante
    [Arguments]                 ${elements}
    Click Element               ${SUIVANT}
    Sleep                       2
    Element Should Be Visible   ${elements}

OpenImportWindow
    Click Element                   ${IMPORT_DATA}
    Sleep                           2
    Element Should Be Visible       ${CODE_IMPORT_WINDOW}

CreateAllActivies
    FOR    ${i}    IN RANGE   4
        Click Element                    ${ADD_ACTIVITY}
        Sleep                            1
        CreateActivity                   xpath:(//img[@alt='example'])[${i+1}]
        ReturnMainPage
    END

GetImage
    [Arguments]            ${img}
    ${src}=                Get Element Attribute             ${img}            src
    [Return]               ${src}