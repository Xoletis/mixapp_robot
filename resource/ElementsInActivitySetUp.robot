#Auteur : Ivan
*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Resource        Import.robot


*** Variables ***
${PREMIER_ACTIVITE}             xpath://div[@id='root']/div/div[2]/div/div[2]/div[2]/div/div/div/div

#############################################################################################################################
#################################################### Footer #################################################################
#############################################################################################################################
${NEXT_WINDOW_FOR_SET_UP_ACTIVITY_BUTTON}       xpath:/html/body/div[1]/section/section/main/section/main/footer/div/div/button/span[2]



#############################################################################################################################
##################################################### Header ################################################################
#############################################################################################################################
${HEADER_IN_ACTIVITY_SET_UP}                    xpath:/html/body/div[1]/section/section/main/section/main/header
${GO_BACK_TO_MAIN_MENU_WITH_ARROW_BUTTON}       xpath:(.//*[normalize-space(text()) and normalize-space(.)='Visualiser l’image'])[1]/preceding::*[name()='svg'][1]
${GO_BACK_TO_MAIN_MENU_WITH_HOME_BUTTON}        xpath:(.//*[normalize-space(text()) and normalize-space(.)='Visualiser l’image'])[1]/following::*[name()='svg'][1]
${GO_TO_AMELIORATION_WINDOW_IN_HEADER_MENU}     xpath:/html/body/div[1]/section/section/main/section/main/header/div/div[3]/div/div[2]

#############################################################################################################################
########################################### ECRANT SELECTION MARQUEUR #######################################################
#############################################################################################################################
${TAKE_PHOTO_BUTTON}                            xpath://div[@id='three-canvas']/div[3]/div/div
${TAKE_PHOTO_WINDOW}                            xpath://*[@id="rc-tabs-5-panel-0"]
${IMPORT_PHOTO_BUTTON}                          xpath:/html/body/div[1]/section/section/main/section/main/div/div[3]/div/div/div[3]/span/div/span 

#############################################################################################################################
##################################################### Nomage ################################################################
#############################################################################################################################
${EMPLACEMENT_TITRE}            xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[1]
${EMPLACEMENT_DESCRIPTION}      xpath://main[@id='board-content']/div/div/div/div[2]/div/div[2]
${EMPLACEMENT_CONSIGNE}         xpath://*[@id="board-content"]/div/div/div/div[2]/div/div[3]