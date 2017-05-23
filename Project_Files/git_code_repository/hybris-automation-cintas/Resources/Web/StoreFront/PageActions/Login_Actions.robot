*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/Login_Page.robot

*** Keywords ***
Enter Email
    [Arguments]    ${email_address}
    ${locator} =    Login_Page.txtEmail
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${email_address}

Enter Password
    [Arguments]    ${password}
    ${locator} =    Login_Page.txtPassword
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${password}

Click Sign In
    ${locator} =    Login_Page.btnSignIn
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Enter Account Number
    [Arguments]    ${account_number}
    ${locator} =    Login_Page.txtAccountNumber
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${account_number}

Enter Account Zip Code
    [Arguments]    ${zip_code}
    ${locator} =    Login_Page.txtAccountZipCode
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${zip_code}

Click Register
    ${locator} =    Login_Page.btnRegister
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}
