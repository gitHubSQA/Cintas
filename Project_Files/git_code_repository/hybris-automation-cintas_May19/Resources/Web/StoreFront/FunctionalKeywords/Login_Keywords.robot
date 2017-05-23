*** Settings ***
Resource          ../PageActions/Login_Actions.robot
Resource          ../PageActions/TermsConditions_Actions.robot
Resource          ../PageActions/Common_Actions.robot
Resource          ../PageActions/RegistrationAccount_Actions.robot
Library           Dialogs

*** Keywords ***
Login Customer
    [Arguments]    ${email}    ${password}
    Login_Actions.Enter Email    ${email}
    Login_Actions.Enter Password    ${password}
    Login_Actions.Click Sign In
    Common_Actions.Wait For Loading

Accept Agreement
    TermsConditions_Actions.Check Agree
    TermsConditions_Actions.Click Submit

Login Customer Accept Agreement
    [Arguments]    ${email}    ${password}
    Login_Keywords.Login Customer    ${email}    ${password}
    Login_Keywords.Accept Agreement

Customer Self Registration
    [Arguments]    ${account_number}    ${zip_code}    ${first_name}    ${last_name}    ${email}    ${phone_number}
    Enter Customer Account Information    ${account_number}    ${zip_code}
    Enter Customer Information    ${first_name}     ${last_name}    ${email}    ${phone_number}

Enter Customer Account Information
    [Arguments]    ${account_number}    ${zip_code}
    Login_Actions.Enter Account Number    ${account_number}
    Login_Actions.Enter Account Zip Code    ${zip_code}
    Login_Actions.Click Register

Enter Customer Information
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${phone_number}
    RegistrationAccount_Actions.Enter First Name    ${first_name}
    RegistrationAccount_Actions.Enter Last Name    ${last_name}
    RegistrationAccount_Actions.Enter Email    ${email}
    RegistrationAccount_Actions.Enter Phone Number    ${phone_number}
    RegistrationAccount_Actions.Click Register
