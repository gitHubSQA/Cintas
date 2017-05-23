*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/PLP_Page.robot

*** Keywords ***
Click On Product Image
    [Arguments]    ${product_style_number}
    ${locator} =    PLP_Page.imgProductImage    ${product_style_number}
    wait until element is visible   ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Face Category Text
    ${locator} =    PLP_Page.spnFacetText
    wait until element is visible   ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Click On Change Account Link
    ${locator} =    PLP_Page.lnkChangeAccount
    wait until element is visible   ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}