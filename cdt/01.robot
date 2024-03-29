*** Settings ***
Resource            ../resource/Import.robot
Documentation       Menu Principal

Test Teardown    Close Browser

*** Test Cases ***
#Auteur : Ivan
01.01
    Log                             Ouvrir la fenêtre "Importer des données"
    OpenWithChrome
    OpenImportWindow

#Auteur : Ivan
01.02
    Log                             Fermer la fenêtre "Importer des données" - champ de texte vide
    OpenWithChrome
    OpenImportWindow
    Click Element                   ${LOGO_XPATH}
    Sleep                           2
    Element Should Not Be Visible   ${CODE_IMPORT_WINDOW}

#Auteur : Ivan
01.03
    Log                             Fermer la fenêtre "Importer des données" - champ de texte rempli
    OpenWithChrome
    OpenImportWindow

    ${txt} =                        String.generate random string   4
     SeleniumLibrary.Input Text     ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Click Element                   ${LOGO_XPATH}
    Sleep                           2
    Element Should Not Be Visible   ${CODE_IMPORT_WINDOW}

    OpenImportWindow
    Element Should Be Visible       ${CODE_IMPORT_WINDOW}
    ${result} =                     SeleniumLibrary.Get Element Attribute       ${IMPORT_DATA_INPUT_TEXT}        value
    Run Keyword If                  "${result}" != "${txt}"                     Fatal Error                      ${result} n'est pas égale à ${txt}

#Auteur : Ivan
01.04
    Log                             Importer des données avec un code valide
    OpenWithChrome
    OpenImportWindow
     SeleniumLibrary.Input Text     ${IMPORT_DATA_INPUT_TEXT}       ${CODE_IMPORT}
    Click Element                   ${IMPORT_DATA_BUTTON}
    Sleep                           5                                 #Important ne pas changer
    Element Should Be Visible       ${IMPORT_INFORMATION}

#Auteur : Ivan
01.05
    Log                             Importer des données avec un code non valide
    OpenWithChrome
    OpenImportWindow

    ${txt} =                        String.generate random string   6
    SeleniumLibrary.Input Text      ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Click Element                   ${IMPORT_DATA_BUTTON}
    Sleep                           2
    Element Should Be Visible       ${IMPORT_INFORMATION}

#Auteur : Ivan
01.06
    Log                             Synchroniser ses données /!\ A Modifier /!\
    OpenWithChrome
    Click Element                   ${ADD_ACTIVITY}
    CreateActivity                  ${AUGMENTER_UNE_IMAGE}
    ReturnMainPage
    Sleep                           2
    Click Element                   ${SYNC_DATA}
    Sleep                           2
    Element Should Be Visible       ${SYNC_INFORMATION_POP_UP}

#Auteur : Ivan
01.07
    Log                             Synchroniser ses données (vides)
    OpenWithChrome
    Click Element                   ${SYNC_DATA}
    Sleep                           2
    Element Should Be Visible       ${SYNC_INFORMATION_POP_UP}

#Auteur : Ivan
01.08
    Log                             Ouverture du menu "Tableau de Bord"
    OpenWithChrome
    Click Element                   ${DASHBORD_BUTTON}
    Sleep                           ${PAUSE}
    Element Should Be Visible       ${DASHBORD_WINDOW}

#Auteur : Ivan
01.09
    Log                              Ouverture du menu "Suivi d'Apprenants"
    OpenWithChrome
    Click Element                    ${DASHBORD_BUTTON}
    Sleep                            ${PAUSE}
    Click Element                    ${SUIVI_APPRENANTS_BUTTON}
    Sleep                            ${PAUSE}
    Element Should Be Visible        ${SUIVI_APPRENANTS}

#Auteur : Ivan
01.10
    Log                              Ouverture du menu "Mon Contenu"
    OpenWithChrome
    Click Element                    ${DASHBORD_BUTTON}
    Sleep                            ${PAUSE}
    Click Element                    ${MON_CONTENU_BUTTON}
    Sleep                            ${PAUSE}
    Element Should Be Visible        ${MON_CONTENU}

#Auteur : Ivan
01.11
    Log                              Ouvrir le menu "Ajouter Activité"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            ${PAUSE}
    Element Should Be Visible        ${ADD_ACTIVITY_BUTTON_TXT}

#Auteur : Ivan
01.12.01
    Log                              Ajouter une activité de type "Augmenter une image"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            1
    Click Element                    ${AUGMENTER_UNE_IMAGE}
    Sleep                            1
    ReturnMainPage
    Element Should Be Visible        ${PREMIER_ACTIVITE}

#Auteur : Ivan
01.12.02
    Log                              Ajouter une activité de type "Valider une image"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            1
    Click Element                    ${VALIDER_UNE_IMAGE}
    Sleep                            1
    ReturnMainPage
    Element Should Be Visible        ${PREMIER_ACTIVITE}

#Auteur : Ivan
01.12.03
    Log                              Ajouter une activité de type "Associer deux images"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            1
    Click Element                    ${ASSOSIER_DEUX_IMAGES}
    Sleep                            1
    ReturnMainPage
    Element Should Be Visible        ${PREMIER_ACTIVITE}

#Auteur : Ivan
01.12.04
    Log                              Ajouter une activité de type "Superposer deux calques"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            1
    Click Element                    ${SUPERPOSER_DEUX_CALQUES}
    Sleep                            1
    ReturnMainPage
    Element Should Be Visible        ${PREMIER_ACTIVITE}

#Auteur : Ivan
01.12.05
    Log                              Ajouter une activité de type "Groupe d'activité"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            1
    Click Element                    ${GROUPE_ACTIVITE}
    Sleep                            1
    ReturnMainPage
    Element Should Be Visible        ${PREMIER_ACTIVITE}

#Auteur : Ivan
01.12.06
    Log                              Ajouter une activité de type "Parcours d'activité"
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            1
    Click Element                    ${PARCOUR_ACTIVITE}
    Sleep                            1
    ReturnMainPage
    Element Should Be Visible        ${PREMIER_ACTIVITE}

#Auteur : Ivan
01.13
    Log                              Annuler la création d'activité en cliquant à coté
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            ${PAUSE}
    Click Element                    ${CREATE_ACTIVITY_WINDOW_BORDER}
    Sleep                            ${PAUSE}
    Element Should Not Be Visible    ${ADD_ACTIVITY_BUTTON_TXT}

#Auteur : Ivan
01.14
    Log                              Annuler la création d'activité en cliquant sur la croix
    OpenWithChrome
    Click Element                    ${ADD_ACTIVITY}
    Sleep                            ${PAUSE}
    Click Element                    ${CLOSE_ADD_ACTIVITY_WINDOW}
    Sleep                            ${PAUSE}
    Element Should Not Be Visible    ${ADD_ACTIVITY_BUTTON_TXT}

#Auteur : Ivan
01.15
    Log                              Afficher la listes des activités créées
    OpenWithChrome
    CreateAllActivies
    Sleep                            2
    ${nb}=                           GetChildNb         ${ACTIVITE_GROUPE_PARENT}
    Log                              ${nb}
    FOR    ${i}    IN RANGE    ${nb}
         #L'activité séléctioner ${i+1} doit être visible
         Element Should Be Visible        //*[@id="root"]/div/div[2]/div/div[${i+1}]
    END

#Auteur : Ivan
01.16
    Log                              Afficher les plus d'option
    OpenWithChrome
    Click Element                    ${MORE_OPTION_BUTTON}
    Sleep                            ${PAUSE}
    Element Should Be Visible        ${MORE_OPTION_WINDOW}

#Auteur : Ivan
01.17.01
    Log                              Lancer l'activité en cliquant sur l'objet
    OpenWithChrome
    CreateAllActivies
    Sleep                           1
    ${nbCard}=                      GetChildNb    ${CARDS}
    ${number}=                      Evaluate    random.sample(range(2, ${nbCard+1}), 1)    random
    Click Element                   xpath://*[@id="root"]/div/div[2]/div/div[${number[0]}]/div[1]/div/div[2]/button/span
    Sleep                           5
    Element Should Be Visible       //*[@id="three-canvas"]/div[4]/div/span[2]

#Auteur : Ivan
01.17.02
    Log                            Consulter l'activité
    OpenWithChrome
    CreateAllActivies
    Sleep                           1
    ${nbCard}=                      GetChildNb    ${CARDS}
    ${number}=                      Evaluate      random.sample(range(2, ${nbCard+1}), 1)    random
    #Image de l'activité choisie
    ClickElement                    xpath://div[@id='root']/div/div[2]/div/div[${number[0]}]/ul/li/span/a/button
    Sleep                           ${PAUSE}
    Element Should Be Visible       xpath:/html/body

#Auteur : Ivan
01.17.03
    Log                            Aimer l'activité
    OpenWithChrome
    CreateAllActivies
    Sleep                           1
    ${nbCard}=                      GetChildNb    ${CARDS}
    ${number}=                      Evaluate      random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement                    xpath://div[@id='root']/div/div[2]/div/div[${number[0]}]/ul/li[2]/span/button
    Sleep                           ${PAUSE}

#Auteur : Ivan
01.17.04
    Log                            Editer l'activité
    OpenWithChrome
    CreateAllActivies
    Sleep                           1
    ${nbCard}=                      GetChildNb    ${CARDS}
    ${number}=                      Evaluate      random.sample(range(2, ${nbCard+1}), 1)    random
    ClickElement                    xpath://div[@id='root']/div/div[2]/div/div[${number[0]}]/ul/li[3]/span/button
    Sleep                           ${PAUSE}
    Element Should Be Visible       ${HEADER_IN_ACTIVITY_SET_UP}

#Auteur : Ivan
01.17.05
    Log                            Afficher plus d'option
    OpenWithChrome
    CreateAllActivies
    Sleep                           1
    ${nbCard}=                      GetChildNb    ${CARDS}
    ${number}=                      Evaluate      random.sample(range(2, ${nbCard+1}), 1)    random
    Click Element                   xpath://div[@id='root']/div/div[2]/div/div[${number[0]}]/ul/li[4]/span/button
    Sleep                           ${PAUSE}
    Element Should Be Visible       xpath:/html/body/div[2]/div/div/ul/li/span/button/span

#Auteur : Ivan
01.17.06
    Log                            Supprimer une activité
    OpenWithChrome
    CreateAllActivies
    Sleep                           1
    ${nbCard}=                      GetChildNb    ${CARDS}
    ${number}=                      Evaluate      random.sample(range(2, ${nbCard+1}), 1)    random
    Click Element                    xpath://div[@id='root']/div/div[2]/div/div[${number[0]}]/ul/li[4]/span/button
    Sleep                           ${PAUSE}
    Click Element                   xpath:/html/body/div[2]/div/div/ul/li/span/button/span
    Sleep                           1
    Element Should Be Visible       xpath://div[(text() = 'Activité placée dans la corbeille !' or . = 'Activité placée dans la corbeille !')]
    ${nbCardAfterDeleted}=          GetChildNb    ${CARDS}
    Run Keyword If                  ${nbCardAfterDeleted} == ${nbCard}        Fatal Error        Aucune activité n'a été supprimée
    Run Keyword If                  ${nbCardAfterDeleted} < ${nbCard - 1}     Fatal Error        Plusieurs activités ont été supprimées

#Auteur : Ivan
01.18
    Log                            Afficher le code utilisateur
    OpenWithChrome
    Click Element                  ${MORE_OPTION_BUTTON}
    Sleep                          ${PAUSE}
    Element Should Be Visible      ${CODE_UTILISATEUR_TXT}

#Auteur : Ivan
01.19
    Log                            Copier le code utilisateur
    OpenWithChrome
    Click Element                  ${MORE_OPTION_BUTTON}
    Sleep                          ${PAUSE}
    Click Element                  ${COPY_CODE_UTILISATEUR}
    ${clipboard}=                  Get clipboard value
    ${txt}                         SeleniumLibrary.Get Text            xpath:/html/body/div[2]/div/div/ul/li[2]/span/span[2]/strong
    Should Be Equal As Strings     ${clipboard}        ${txt}

#Auteur : Ivan
01.20
    Log                            Autoriser le micro / camera
    OpenWithChrome
    Click Element                  ${MORE_OPTION_BUTTON}
    Sleep                          ${PAUSE}
    Click Element                  ${ACTIVE_MICRO_CAMERA}
    Sleep                          1
    Element Should Be Visible      xpath:(.//*[normalize-space(text()) and normalize-space(.)='Version MIXAP v1.1.3'])[1]/following::span[2]

#Auteur : Ivan
01.21
    Log                             Entrer un code utilisateur à moins de 7 caractères
    OpenWithChrome
    OpenImportWindow

    ${txt} =                        String.generate random string   4
    SeleniumLibrary.Input Text      ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Sleep                           1
    Element Should Be Disabled      ${IMPORT_DATA_BUTTON}

#Auteur : Ivan
01.22
    Log                             Entrer un code utilisateur à plus de 7 caractères
    OpenWithChrome
    OpenImportWindow

    ${txt} =                        String.generate random string   8
    SeleniumLibrary.Input Text      ${IMPORT_DATA_INPUT_TEXT}       ${txt}
    Sleep                           1
    Element Should Be Enabled       ${IMPORT_DATA_BUTTON}