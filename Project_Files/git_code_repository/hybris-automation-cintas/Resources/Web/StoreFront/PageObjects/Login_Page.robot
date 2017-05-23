*** Settings ***
Library           Selenium2Library

*** Keywords ***
txtEmail
    [Return]    id=j_username

txtPassword
    [Return]    id=j_password

btnSignIn
    [Return]    css=.js-btn-login

txtAccountNumber
    [Return]    id=registerAccountNumber

txtAccountZipCode
    [Return]    id=billingZipCode

btnRegister
    [Return]    css=.btn-register-account
