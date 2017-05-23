*** Settings ***
Library           Selenium2Library

*** Keywords ***
txtFirstName
    [Return]    id=firstName

txtLastName
    [Return]    id=lastName

txtEmail
    [Return]    id=email

txtPhoneNumber
    [Return]    id=phoneNumber

btnRegister
    [Return]    css=.btn-primary.btn-block
