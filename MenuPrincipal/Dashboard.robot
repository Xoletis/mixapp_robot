*** Settings ***
Documentation       Cas de test sur le dashboard


Resource            ../resource/Import.robot


*** Keywords ***
OpenDashboard
    ClickElement        ${DASHBORD_BUTTON}
    Sleep               2
    ${url}=             Get Location
    Run Keyword If      "${url}" != "https://mixap-dev.surge.sh/dashboard"      Fatal Error        Nous ne somme pas sur le dashboard : ${url}
    ${contenu}=         ChekIfDisplayNone           ${MON_CONTENU}
    Run Keyword If      ${contenu} == "false"        Fatal Error        L'onglet Mon Contnu n'est pas visible

GoToSuiviDapprenants
    ClickElement    ${SUIVI_APPRENANTS_BUTTON}
    Sleep           2
    ${apprenants}=  ChekIfDisplayNone           ${SUIVI_APPRENANTS}
    Run Keyword If      ${apprenants} == "false"        Fatal Error        L'onglet Suivi d'Apprenants n'est pas visible

GoToMonContenu
    ClickElement    ${MON_CONTENU_BUTTON}
    Sleep           2
    ${contenu}=     ChekIfDisplayNone           ${MON_CONTENU}
    Run Keyword If      ${contenu} == "false"        Fatal Error        L'onglet Mon Contnu n'est pas visible