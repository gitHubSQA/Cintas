*** Settings ***
Resource          ../PageObjects/MyAccount_Page.robot
Resource          Common_Validation.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../PageValidations/GlobalMessage_Validations.robot
Resource          GlobalMessage_Validations.robot
Resource          ../PageObjects/Header_Page.robot
Resource          ../PageActions/Login_Actions.robot
Resource          ../FunctionalKeywords/Login_Keywords.robot
Resource          ../PageActions/TermsConditions_Actions.robot
Resource          ../PageObjects/TermsConditions_Page.robot
Library           ../../../../hybris-automation-shared/Libraries/DateUtils.py
Library           ../../../../hybris-automation-shared/Libraries/StringUtils.py
Library           Collections
Library           DateTime

*** Keywords ***
Validate User First Time Login Term and Conditions
    Common_Validation.Validate Page Title and URL    cintasrentalsstorefront/disclaimer/terms-and-conditions    myCintas | Terms & Conditions
    ${el1} =    TermsConditions_Page.cbxAgree
    run keyword and continue on failure    page should contain element    ${el1}
    ${el2} =    TermsConditions_Page.btnSubmit
    run keyword and continue on failure    page should contain element    ${el2}
    ${el3}=    TermsConditions_Page.divTermConditionDescription
    run keyword and continue on failure    page should contain element    ${el3}
