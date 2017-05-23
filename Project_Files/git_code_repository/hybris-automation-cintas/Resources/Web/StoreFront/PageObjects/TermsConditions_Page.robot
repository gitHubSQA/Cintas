*** Settings ***
Library           Selenium2Library

*** Keywords ***
cbxAgree
    [Return]    name=termsAndConditions

btnSubmit
    [Return]    css=#termsAndConditionsForm button.btn-primary

divTermConditionDescription
    [Return]    css=.cintas-terms-conditions-description
