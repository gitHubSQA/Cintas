*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/TermsConditions_Page.robot

*** Keywords ***
Check Agree
    ${locator} =    TermsConditions_Page.cbxAgree
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Submit
    ${locator} =    TermsConditions_Page.btnSubmit
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Scroll Down Term Condition
    Execute Javascript    $(".cintas-terms-conditions-description").animate({scrollTop: $(".cintas-terms-conditions-description")[0].scrollHeight}, "fast")
