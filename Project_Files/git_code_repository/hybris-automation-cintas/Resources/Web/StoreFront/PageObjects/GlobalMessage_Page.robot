*** Settings ***
Library           Selenium2Library

*** Keywords ***
divGlobalMessage
    [Return]    css=#globalMessages div.alert

btnGlobalMessageClose
    [Return]    css=#globalMessages button.close
