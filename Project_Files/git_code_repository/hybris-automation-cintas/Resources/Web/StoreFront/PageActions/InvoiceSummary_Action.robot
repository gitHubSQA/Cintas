*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/InvoiceSummary_Page.robot

*** Keywords ***
Get Open Invocie Total
    ${locator} =    InvoiceSummary_Page.divOpenInvocieTotal
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${total} =    Get Text    ${locator}
    [Return]    ${total}
