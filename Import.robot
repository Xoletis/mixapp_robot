*** Settings ***
Library             Selenium2Library
Library             String
Library           OperatingSystem
Library           DateTime

Resource            Activites/Nomage.robot
Resource            Connexion/ConexionSiteWeb.robot
Resource            Connexion/AfficherMenuPrincipale.robot
Resource            MenuPrincipal/Importer.robot
Resource            MenuPrincipal/Dashboard.robot
Resource            MenuPrincipal/CreateActivity.robot
Resource            Activites/AugmenterUneImage/Commun.robot
Resource            Activites/AugmenterUneImage/Marqueur.robot
Resource            resources.robot
Resource            Activites/GroupeActivité/Commun.robot
Resource            Activites/Commun.robot