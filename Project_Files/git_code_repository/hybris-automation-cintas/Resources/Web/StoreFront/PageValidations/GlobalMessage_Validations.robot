*** Settings ***
Resource          ../PageActions/GlobalMessage_Actions.robot
Library           Dialogs
Library           String


*** Keywords ***
Validate Message Contains
    [Arguments]    ${message_exp}
    ${message_act} =	GlobalMessage_Actions.Get Global Message
    ${message_act} =  convert to lowercase  ${message_act}
    ${message_exp} =  convert to lowercase  ${message_exp}
    run keyword and continue on failure    should contain    ${message_act}     ${message_exp}
