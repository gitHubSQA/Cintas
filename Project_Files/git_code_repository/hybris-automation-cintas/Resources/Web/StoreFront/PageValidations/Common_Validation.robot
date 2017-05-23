*** Settings ***
Resource          ../PageObjects/ServiceRequest_Page.robot
Resource          ../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../PageActions/ServiceRequest_Actions.robot
Resource          ../PageActions/ServiceRequestDetails_Actions.robot
Resource          GlobalMessage_Validations.robot
Library           ../../../../hybris-automation-shared/Libraries/DateUtils.py
Library           Collections

*** Keywords ***
Validate Page Title and URL
    [Arguments]    ${url}    ${title}
    [Documentation]    This keyword open page based on the given URL.
    ...    - ${pageURL}- Page url
    ...    - ${pageURI}- AppContent+URI
    ${hostURL}=    Common_Actions.Get Host Url
    ${exp_url}=    Set Variable    https://${hostURL}/${url}
    ${actual_url}    Get Location
    ${actual_title}    Get Title
    Run Keyword And Continue On Failure    Should Be Equal    ${exp_url}    ${actual_url}
    Run Keyword And Continue On Failure    Should Be Equal    ${title}    ${actual_title}

Validate Global Message
    [Arguments]    ${global_msg}
    [Documentation]    This keyword open page based on the given URL.
    ${actual_msg}=    GlobalMessage_Actions.Get Global Message
    Run Keyword And Continue On Failure    should Contain    ${actual_msg}    ${global_msg}

Validate Page URL
    [Arguments]    ${url}
    [Documentation]    This keyword open page based on the given URL.
    ...    - ${pageURL}- Page url
    ...    - ${pageURI}- AppContent+URI
    ${hostURL}=    Common_Actions.Get Host Url
    ${exp_url}=    Set Variable    https://${hostURL}/${url}
    ${actual_url}    Get Location
    Run Keyword And Continue On Failure    Should Be Equal    ${exp_url}    ${actual_url}

Validate Category URL
    [Arguments]    ${url}
    [Documentation]    This keyword open page based on the given URL.
    ...    - ${pageURL}- Page url
    ...    - ${pageURI}- AppContent+URI
    ${hostURL}=    Common_Actions.Get Host Url
    ${exp_url}=    Set Variable    https://${hostURL}/${url}
    ${actual_url}    Get Location
    Run Keyword And Continue On Failure    Should Contain    ${actual_url}    ${url}

Validate Global Message With Regex
    [Arguments]    ${global_msg}
    [Documentation]    match two sting with regular expression in the expected value
    ${actual_msg}=    GlobalMessage_Actions.Get Global Message
    Run Keyword And Continue On Failure    should match regexp   ${actual_msg}    ${global_msg}

Validate Patial URL
    [Arguments]    ${partial_url_exp}
    [Documentation]    Validate partial url in the full url
    ${full_url_act} =    Get Location
    Run Keyword And Continue On Failure    Should Contain    ${full_url_act}    ${partial_url_exp}