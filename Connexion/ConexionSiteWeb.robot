*** Settings ***
Documentation       Connexion au site web

Library             Selenium2Library
Library             String

Resource            ../resources.robot

*** Keywords ***
OpenWebSiteChrome
    OpenMixap                       Chrome
    Sleep                           2