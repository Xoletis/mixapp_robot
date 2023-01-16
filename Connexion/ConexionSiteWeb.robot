*** Settings ***
Documentation       Connexion au site web

Resource            ../resource/Import.robot

*** Keywords ***
OpenWebSiteChrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   modules=sys      # EdgeOptions() à changer en fonction du navigateur
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream           # Évite d'avoir à accorder des autorisations pour les caméras et les microphones.
    Call Method    ${options}    add_argument    --auto-select-desktop-capture-source     # Sélectionne automatiquement une source de média (en général la webcam)
    OpenMixap                       Chrome          ${options}
    Sleep                           2