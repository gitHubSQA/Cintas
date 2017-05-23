*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/RegistrationAccount_Page.robot

*** Keywords ***
Enter First Name
    [Arguments]    ${first_name}
    ${locator} =    RegistrationAccount_Page.txtFirstName
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${first_name}

Enter Last Name
    [Arguments]    ${last_name}
    ${locator} =    RegistrationAccount_Page.txtLastName
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${last_name}

Enter Email
    [Arguments]    ${email}
    ${locator} =    RegistrationAccount_Page.txtEmail
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${email}

Enter Phone Number
    [Arguments]    ${phone_number}
    ${locator} =    RegistrationAccount_Page.txtPhoneNumber
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${phone_number}

Click Register
    ${locator} =    RegistrationAccount_Page.btnRegister
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
