*** Settings ***
Resource            Activites/AugmenterUneImage/Nomage.robot
Resource            CasDeTest.robot
Resource            Connexion/ConexionSiteWeb.robot
Resource            Connexion/AfficherMenuPrincipale.robot
Resource            MenuPrincipal/Import.robot
Resource            MenuPrincipal/Dashboard.robot
Resource            MenuPrincipal/CreateActivity.robot

Test Teardown    Close Browser
*** Test Cases ***

Test1
    OpenWebSiteChrome
    ShowMainMenu
    AfficherCreationStage
    ModifyTitle
    ModifyDesc
    PasserEtapeSuivante