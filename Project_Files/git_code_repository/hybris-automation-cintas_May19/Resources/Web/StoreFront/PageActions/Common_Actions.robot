*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/Common_Page.robot

*** Keywords ***
Wait For Loading
    ${ref} =    Common_Page.spinnerLoading
    Wait Until Page Does Not Contain Element  ${ref}   ${DEFAULT_TIMEOUT}

Open Page
    [Arguments]    ${pageURI}
    [Documentation]    This keyword open page based on the given URL.
    ...    - ${pageURL}- Page url
    ...    - ${pageURI}- AppContent+URI
    ${hostURL} =    Execute Javascript    return window.location.host
    Go To    https://${hostURL}/${pageURI}
    Common_Actions.Wait For Loading

Refresh page
    [Documentation]    This keyword reloads the current page
    reload page

Get Host Url
    [Documentation]    This keyword open page based on the given URL.
    ...    - ${pageURL}- Page url
    ...    - ${pageURI}- AppContent+URI
    ${hostURL} =    Execute Javascript    return window.location.host
    [Return]    ${hostURL}

Get Page Url
    ${URL} =    Get Location
    ${title} =    Get Title
    [Return]    ${url}

Get Page Title
    ${URL} =    Get Location
    ${title} =    Get Title
    [Return]    ${title}

Customer Sign Out
    Common_Actions.Open Page    cintasrentalsstorefront/logout

Get Breadcrumb Section Title Text
    ${locator} =    Common_Page.brcBreadcrumbActiveSectionTitle
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    ${active_section_title} =   Get Text  ${locator}
    [Return]    ${active_section_title}


