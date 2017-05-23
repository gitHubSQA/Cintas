*** Settings ***
Library           Selenium2Library
Library           Collections
Library           DateTime
Library           ../../../hybris-automation-shared/Libraries/DateUtils.py
Variables          ../../../Configurations/GlobalVariables.py
Variables         ../../../Configurations/TestEnvironments.py
Resource          ../../../hybris-automation-shared/Resources/API/Hac_API.robot

*** Keywords ***
Change HAC Configuration Data Type
    [Arguments]    ${set_value}
    ${value} =	Convert To Lowercase	${set_value}
    Run Keyword If    '${value}' != 'true' and '${value}' != 'false'    Fail    Invalid parameter: ${set_value}
    ${config_prop1} =    Set Variable    webservice.data.get_service_request.dummy
    ${config_prop2} =    Set Variable    webservice.data.create_service_request.dummy
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    Hac_API.HAC Modify Property Value    ${SITE_URL}    ${config_prop1}    ${value}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    Hac_API.HAC Modify Property Value    ${SITE_URL}    ${config_prop2}    ${value}    ${HAC_USERNAME}    ${HAC_PASSWORD}
