*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Resource        Import.robot


*** Variables ***

#Important
${WELCOMEPAGE_URL}              https://mixap-dev.surge.sh/
${DELAY}                        0
${TITLE}                        MIXAP

#Boutton
${IMPORT_DATA}                  xpath://*[@id="root"]/div/div[1]/div/div[1]/span/div/div[1]/button
${IMPORT_DATA_INPUT_TEXT}       xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[1]/input
${IMPORT_DATA_BUTTON}           xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[2]/button
${SYNC_DATA}                    xpath:(//button[@type='button'])[2]
${ADD_ACTIVITY}                 xpath://*[@id="root"]/div/div[2]/div/div[1]/div/div/button
${ADD_ACTIVITY_2}               xpath://*[@id="rc-tabs-3-panel-1"]/div/div[1]/div/div/button
${AUGMENTER_UNE_IMAGE}          xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div/div[1]/div[1]
${VALIDER_UNE_IMAGE}            xpath:(//img[@alt='example'])[2]
${GROUPE_ACTIVITE}              xpath:(//img[@alt='example'])[5]
${DASHBORD_BUTTON}              xpath://*[@id="root"]/div/div[1]/div/div/span/div/div[3]/button
${SUIVI_APPRENANTS_BUTTON}      xpath://*[@id="rc-tabs-0-tab-2"]/h4
${MON_CONTENU_BUTTON}           xpath://*[@id="rc-tabs-0-tab-1"]/h4
${CLOSE_ADD_ACTIVITY_WINDOW}    xpath:/html/body/div[2]/div/div[2]/div/div[2]/button
${MORE_OPTION_BUTTON}           xpath://*[@id="root"]/div/div[1]/div/div[1]/span/div/div[4]/button
${BOUTON_TITRE_MODIFIER}        xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[1]/h5/div/span
${BOUTON_DESCRIPTION_MODIFIER}  xpath://*[@id='board-content']/div/div/div/div[2]/div/div[2]/span/div
${RETOUR}                       xpath://*[@id="root"]/section/header/div/div/div/div/div/span
${SUIVANT}                      //button[@type = 'button' and (text() = 'Suivant' or . = 'Suivant')]
${SUIVANT_2}                    //*[@id="board-content"]/footer/div/div[2]/button
${ALLUMER_CAMERA}               xpath://*[@id="three-canvas"]/div[3]/div/div/div[1]/button/div/div[2]/div
${PRENDRE_PHOTO}                //div[3]/div/div[2]/button
${IMPORT_IMAGE}                 //div[@id='three-canvas']/div[3]/div/div/div[3]/span/div/span/div/button
${ADD_ACTIVITY_GA}              //button[@type = 'button' and (text() = 'Activité' or . = 'Activité')]
${VALIDE_BUTON}                 //span[(text() = 'Valider' or . = 'Valider')]
${BUTON_NEXT}                   //div[@id='three-canvas']/div[6]/div/div/div[2]/button
${BUTON_PREVIUS}                //div[@id="three-canvas"]/div[6]/div/div/div[1]/button
${VIEW_ALL_ACTIVITY}            //div[@id="three-canvas"]/div[6]/div/div/div[3]/button
${CLOSE_VIEW_ACTIVITIES_BUTON}  //div[3]/div/div/div[1]/div/button

#Element Html
${LOGO_XPATH}                   xpath://*[@id="root"]/div/div[1]/div/div[1]/div/span/span/img
${CODE_IMPORT_WINDOW}           xpath:(.//*[normalize-space(text()) and normalize-space(.)='Activité'])[1]/following::div[9]
${SUIVI_APPRENANTS}             xpath://*[@id="rc-tabs-0-panel-2"]
${MON_CONTENU}                  xpath://*[@id="rc-tabs-0-panel-1"]
${CARDS}                        xpath://*[@id="root"]/div/div[2]/div
${CODE_UTILISATEUR}             xpath:/html/body/div[7]/div/div/ul/li[2]/span/span[2]/strong
${EMPLACEMENT_TITRE}            xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[1]
${EMPLACEMENT_DESCRIPTION}      xpath://main[@id='board-content']/div/div/div/div[2]/div/div[2]
${EMPLACEMENT_CONSIGNE}         xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[3]
${PRENDRE_PHOTO}                //*[@id="three-canvas"]/div[3]/div/div/div[1]/button
${ADD_ACTIVITY_TXT}             xpath://*[@id=":r0:"]
${PLAY_ACTIVITY_WINDOW}         xpath://*[@id="three-canvas"]/div[4]/div/span[1]
${PHOTO_AREA}                   xpath:/html/body/div[17]/div/div[2]/div/div[2]/div[2]
${AUGMENTATION_WINDOW}          //*[@id="three-canvas"]/div[3]/div/div
${TEXT_AUGMENTATION}            //*[@id="three-canvas"]/div[2]/div/div/button[1]/span[2]
${SELECTION_WINDOW}             xpath://*[@id="board-content"]/div/div/div/div/div
${ADD_ACTIVITY_GA_WINDOW}       xpath:(.//*[normalize-space(text()) and normalize-space(.)='Sélectionner le groupe d‘activités'])[1]/following::div[2]
${TEST_WINDOW}                  //span[(text() = 'Placer l‘image dans le cadre' or . = 'Placer l‘image dans le cadre')]
${VIEW_ALL_ACTIVITY_WINDOW}     //div/div[3]/div/div/div/div/div
${ACTIVITIES_IN_GA}             //div[3]/div/div/div[2]/div/div/div
${IMPORT_INFORMATION}           xpath:(.//*[normalize-space(text()) and normalize-space(.)='Valider'])[1]/following::div[4]
${SYNC_INFORMATION}             xpath://*/text()[normalize-space(.)='Rien à synchroniser !']/parent::*

#Autre
${CODE_IMPORT}                  5eda26
${TITRE}                        TitreTest
${DESCRIPTION}                  Ceci est une description
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

CreateActivity
    [Arguments]         ${Activity}
    #OpenAddActivityWindow
    ClickElement    ${Activity}
    Sleep           2

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
    [Return]          ${children}


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
    ClickWindow                     ${IMPORT_DATA}
    Sleep                           2
    Element Should Be Visible       ${CODE_IMPORT_WINDOW}