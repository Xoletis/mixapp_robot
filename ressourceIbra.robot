*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           Selenium2Library
Library           String


*** Variables ***

${WELCOMEPAGE_URL}                https://mixap-dev.surge.sh
${BROWSER}                        Chrome
${INITIAL_DELAY}                  0
${DELAY}                          0.5
${TITLE}                          MIXAP    
${TITRE}                          TitreTest
${DESCRIPTION}                    Ceci est une description                     
${+ACTIVITE}                      xpath:/html/body/div[1]/div/div[2]/div/div[1]/div/div/button/span[2]
${+ACTIVITE2}                     xpath://*[@id="rc-tabs-0-panel-1"]/div/div[1]/div/div/button
${AUGMENT_ACTIVITY}               xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div/div[1]/div[1]
${RETOUR}                         xpath://*[@id="root"]/section/header/div/div/div/div/div/span
#Page nommage 
${ETAPE_NOMMAGE}                  xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[1]
${ETAPE_MARQUEUR}                 xpath:html/body/div[1]/section/section/main/section/main/header/div/div[2]
${ETAPE_AUGMENTATION}             xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[3]
${ETAPE_ESSAI}                    xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[4]
${HOME}                           xpath://*[@id="root"]/section/header/div/div/span/div/div/a/button
${SUIVANT_NOMMAGE}                xpath://*[@id="board-content"]/footer/div/div/button/span[2]
${PRENDRE_PHOTO}                  xpath://*[@id="three-canvas"]/div[3]/div/div/div[1]/button/div/div[2]/div
${PHOTO_AREA}                     xpath:/html/body/div[15]/div/div[2]/div/div[2]
${BOUTON_TITRE_MODIFIER}          xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[1]/h5/div/span
${EMPLACEMENT_TITRE}              xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[1]
${BOUTON_DESCRIPTION_MODIFIER}    xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[2]/span/div  
${EMPLACEMENT_DESCRIPTION}        xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[2]         

*** Keywords ***
SleepA
    Sleep    ${DELAY}
Welcome Page Should Be Open
    Title Should Be    ${TITLE}
Open Browser To Welcome Page
    Open Browser    ${WELCOMEPAGE_URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${INITIAL_DELAY}
    Welcome Page Should Be Open
Start Test
    Open Browser To Welcome Page
    SleepA
Go to Augment Activity
    Click Element    ${+ACTIVITE}
    SleepA
    Click Element    ${AUGMENT_ACTIVITY}
    SleepA
Go to Marqueur
    Click Element    ${SUIVANT_NOMMAGE}
    SleepA