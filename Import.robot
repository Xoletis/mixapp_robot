*** Settings ***
Library             Selenium2Library
Library             String

Resource            Activites/AugmenterUneImage/Nomage.robot
Resource            Connexion/ConexionSiteWeb.robot
Resource            Connexion/AfficherMenuPrincipale.robot
Resource            MenuPrincipal/Importer.robot
Resource            MenuPrincipal/Dashboard.robot
Resource            MenuPrincipal/CreateActivity.robot
Resource            Activites/AugmenterUneImage/Commun.robot
Resource            Activites/AugmenterUneImage/Marqueur.robot
Resource            resources.robot