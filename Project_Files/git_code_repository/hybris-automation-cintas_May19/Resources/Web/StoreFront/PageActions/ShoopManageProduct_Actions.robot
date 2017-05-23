*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/ShoopManageProduct_Page.robot

*** Keywords ***
Click Continue Button
    ${locator} =    ShoopManageProduct_Page.btnContinueButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Change Button
    [Arguments]    ${product_name}
    ${locator} =    ShoopManageProduct_Page.btnChangeProduct    ${product_name}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Add Product Button
    ${locator} =    ShoopManageProduct_Page.btnAddProduct
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Change Button By Index
    [Arguments]    ${position}
    ${locator} =    ShoopManageProduct_Page.btnChangeProductByIndex  ${position}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element  ${locator}
