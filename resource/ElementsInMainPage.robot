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
#################################################### Header #################################################################
#############################################################################################################################
${MORE_OPTION_BUTTON}           xpath://*[@id="root"]/div/div[1]/div/div[1]/span/div/div[4]/button
${MORE_OPTION_WINDOW}           xpath:/html/body/div[2]/div/div
${LOGO_XPATH}                   xpath://*[@id="root"]/div/div[1]/div/div[1]/div/span/span/img
${CODE_UTILISATEUR_TXT}         xpath:(.//*[normalize-space(text()) and normalize-space(.)='Copier code utilisateur'])[1]/following::strong[1]
${COPY_CODE_UTILISATEUR}        xpath:(.//*[normalize-space(text()) and normalize-space(.)='Copier code utilisateur'])[1]/following::*[name()='svg'][1]
${ACTIVE_MICRO_CAMERA}          xpath:(.//*[normalize-space(text()) and normalize-space(.)='Activité'])[1]/following::span[1]
${SUIVI_APPRENANTS}             xpath://*[@id="rc-tabs-0-panel-2"]
${MON_CONTENU}                  xpath://*[@id="rc-tabs-0-panel-1"]
${CODE_UTILISATEUR}             xpath:/html/body/div[7]/div/div/ul/li[2]/span/span[2]/strong

#############################################################################################################################
################################################## IMPORT DATA ##############################################################
#############################################################################################################################
${IMPORT_DATA}                  xpath://*[@id="root"]/div/div[1]/div/div[1]/span/div/div[1]/button
${IMPORT_DATA_BUTTON}           xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[2]/button
${IMPORT_INFORMATION}           xpath:(.//*[normalize-space(text()) and normalize-space(.)='Valider'])[1]/following::div[4]
${IMPORT_DATA_INPUT_TEXT}       xpath:/html/body/div[2]/div/div/div/div[2]/div[2]/div/div[1]/input
${CODE_IMPORT_WINDOW}           xpath:(.//*[normalize-space(text()) and normalize-space(.)='Activité'])[1]/following::div[9]

#############################################################################################################################
################################################## ADD ACTIVITY #############################################################
#############################################################################################################################
${ADD_ACTIVITY}                     xpath://*[@id="root"]/div/div[2]/div/div[1]/div/div/button
${AUGMENTER_UNE_IMAGE}              xpath:(//img[@alt='example'])[1]
${VALIDER_UNE_IMAGE}                xpath:(//img[@alt='example'])[2]
${ASSOSIER_DEUX_IMAGES}             xpath:(//img[@alt='example'])[3]
${SUPERPOSER_DEUX_CALQUES}          xpath:(//img[@alt='example'])[4]
${GROUPE_ACTIVITE}                  xpath:(//img[@alt='example'])[5]
${PARCOUR_ACTIVITE}                 xpath:(//img[@alt='example'])[6]
${CREATE_ACTIVITY_WINDOW_BORDER}    xpath:/html/body/div[2]/div/div[2]
${ADD_ACTIVITY_BUTTON_TXT}          xpath://*[@id=":r0:"]
${CLOSE_ADD_ACTIVITY_WINDOW}        xpath:/html/body/div[2]/div/div[2]/div/div[2]/button
${ACTIVITE_GROUPE_PARENT}           xpath://*[@id="root"]/div/div[2]/div

#############################################################################################################################
#################################################### SYNC DATA ##############################################################
#############################################################################################################################
${SYNC_DATA}                    xpath:(//button[@type='button'])[2]
${SYNC_INFORMATION_POP_UP}      xpath://*/text()[normalize-space(.)='Rien à synchroniser !']/parent::*

#############################################################################################################################
################################################# ACTIVITY ACTION ###########################################################
#############################################################################################################################
${CARDS}                        xpath://*[@id="root"]/div/div[2]/div
