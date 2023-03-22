*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Resource        Import.robot

*** Keywords ***

#Auteur : Ivan et Ibrahim
OpenWithChrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   modules=sys      # EdgeOptions() à changer en fonction du navigateur
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream           # Évite d'avoir à accorder des autorisations pour les caméras et les microphones.
    Call Method    ${options}    add_argument    --auto-select-desktop-capture-source     # Sélectionne automatiquement une source de média (en général la webcam)
    OpenMixap      Chrome          ${options}
    Sleep          2

#Auteur : Ivan
OpenMixap
    [Arguments]                     ${BROWSER}              ${options}
    Open Browser    ${WELCOMEPAGE_URL}   ${BROWSER}   options=${options}
    Maximize Browser Window
    Set Selenium Speed              ${DELAY}
    Wait Until Element Is Visible   ${LOGO_XPATH}        100000
    WelcomePageShouldBeOpen

#Auteur : Ivan
WelcomePageShouldBeOpen
    Title Should Be   ${TITLE}

#Auteur : Ivan
CreateActivity
    [Arguments]         ${Activity}
    #OpenAddActivityWindow
    ClickElement    ${Activity}
    Sleep           2

#Auteur : Ivan
ReturnMainPage
    Go To                           ${WELCOMEPAGE_URL}
    Wait Until Element Is Visible   ${LOGO_XPATH}        100000

#Auteur : Ivan
GetChildNb
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}
    ${children}     Call Method
    ...                ${element}
    ...                find_elements
    ...                  by=xpath    value=child::*

    ${return}=        Get Length    ${children}
    [Return]          ${return}

#Auteur : Ivan
OpenImportWindow
    Click Element                   ${IMPORT_DATA}
    Sleep                           2
    Element Should Be Visible       ${CODE_IMPORT_WINDOW}

#Auteur : Ivan
CreateAllActivies
    FOR    ${i}    IN RANGE   4
        Click Element                    ${ADD_ACTIVITY}
        Sleep                            1
        CreateActivity                   xpath:(//img[@alt='example'])[${i+1}]
        ReturnMainPage
    END

#Auteur : Ivan
GetImage
    [Arguments]            ${img}
    ${src}=                Get Element Attribute             ${img}            src
    [Return]               ${src}