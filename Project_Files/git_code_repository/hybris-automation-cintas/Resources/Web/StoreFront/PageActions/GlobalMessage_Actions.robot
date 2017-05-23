*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/GlobalMessage_Page.robot

*** Keywords ***
Get Global Message
    ${locator} =    GlobalMessage_Page.divGlobalMessage
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text}=    Get Text    ${locator}
    log  ${text}
    [Return]    ${text}

Dismiss Global Message
    ${locator} =    GlobalMessage_Page.btnGlobalMessageClose
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}
