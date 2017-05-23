*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/ShoopRibbon_Page.robot

*** Keywords ***
Click Choose Bar
    ${locator} =    ShoopRibbon_Page.lnkChooseBar
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Manage Bar
    ${locator} =    ShoopRibbon_Page.lnkManageBar
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Select Account Bar
    ${locator} =    ShoopRibbon_Page.lnkSelectAccountBar
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Review Request Bar
    ${locator} =    ShoopRibbon_Page.lnkReviewRequestBar
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
