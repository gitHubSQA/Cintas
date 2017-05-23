*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/ShoopSelectAccount_Page.robot

*** Keywords ***
Click On Select Account For Each product
    [Arguments]    ${product_name}
    ${locator} =    ShoopSelectAccount_Page.btnSelectAccountForEachProduct    ${product_name}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Continue Button
    ${locator} =    ShoopSelectAccount_Page.btnSelectAccountContinueButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Select Account For All Product
    ${locator} =    ShoopSelectAccount_Page.btnSelectAccountForAllProduct
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
