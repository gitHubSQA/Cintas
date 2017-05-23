*** Settings ***
Resource          ../PageActions/CreateNewRequest_Actions.robot
Resource          ../PageActions/GlobalMessage_Actions.robot
Resource          ../PageObjects/CreateNewRequest_Page.robot
Resource          GlobalMessage_Validations.robot
Resource          ../PageActions/Common_Actions.robot
Resource          ../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../PageActions/Header_Actions.robot
Resource          ../FunctionalKeywords/Login_Keywords.robot
Resource          ../PageActions/Dashboard_Actions.robot
Library           Dialogs

*** Keywords ***
Validate SR File Attachment
    [Arguments]    ${file_name}
    #--------------------------------    Validate Confirmation Message    -----------------
    ${message_exp}=    Set Variable    The file has been uploaded.
    ${message_act} =    GlobalMessage_Actions.Get Global Message
    run keyword and continue on failure    Should Contain    ${message_act}    ${message_exp}
    #--------------------------------    FileName    -----------------
    ${el1}=    CreateNewRequest_Page.lnkAttachmentFileName
    ${act_file_name}=    Get Text    ${el1}
    run keyword and continue on failure    should be equal    ${act_file_name}    ${file_name}
    #--------------------------------    Remove File X    -----------------
    ${el2}=    CreateNewRequest_Page.spnRemoveAttachment
    run keyword and continue on failure    Page Should Contain Element    ${el2}

Validate SR Remove Attachment
    #--------------------------------    FileName    -----------------
    ${el1}=    CreateNewRequest_Page.lnkAttachmentFileName
    run keyword and continue on failure    Page Should NOT Contain Element    ${el1}
    #--------------------------------    Remove File X    -----------------
    ${el2}=    CreateNewRequest_Page.spnRemoveAttachment
    run keyword and continue on failure    Page Should NOT Contain Element    ${el2}

Validate SR Confirmation for Message Category
    [Arguments]    ${group}  ${conf_msg}
    Run keyword and continue on failure    GlobalMessage_Validations.Validate Message Contains  ${conf_msg}
    ${request_id} =  Run Keyword If    '${group}' == 'group12'    ServiceRequest_Keywords.Get New Service Request ID
    log  ${group}
    log  ${request_id}
    Set Test Variable    ${request_id}

Validate Confirmation of New SR
    [Arguments]    ${impx_ur_account_type}
    Run Keyword If    '${impx_ur_account_type}' == 'WEARER-EDITOR'    run keyword and continue on failure    GlobalMessage_Validations.Validate Message Contains    Your service request have been submitted for approval.
    Run Keyword If    '${impx_ur_account_type}' == 'SR-APPROVER'    run keyword and continue on failure    GlobalMessage_Validations.Validate Message Contains    Your service request has been submitted to Cintas, request ID is

Validate Upload File Modal Error Msg
    [Arguments]    ${file_type}
    [Documentation]    The file is greater than allowed max size.
    ...    The file does not have a valid extension.
    ...    Please choose a file.
    Run Keyword If    '${file_type}' == 'NO_FILE'    run keyword and continue on failure    CreateNewRequest_Validations.Validate Upload File Modal Message Contains    Please choose a file.
    Run Keyword If    '${file_type}' == 'INVALID_EXT'    run keyword and continue on failure    CreateNewRequest_Validations.Validate Upload File Modal Message Contains    The file does not have a valid extension.
    Run Keyword If    '${file_type}' == 'INVALID_SIZE'    run keyword and continue on failure    CreateNewRequest_Validations.Validate Upload File Modal Message Contains    The file is greater than allowed max size.

Validate Upload File Modal Message Contains
    [Arguments]    ${message_exp}
    ${message_act} =    CreateNewRequest_Actions.get Upload File Modal Error Message
    run keyword and continue on failure    should contain    ${message_act}    ${message_exp}

Validate Update of Service Request
    [Arguments]    ${response}
    run keyword and continue on failure    GlobalMessage_Validations.Validate Message Contains    The service request has been updated.

Validate Attachment of Pending SR in Details Page
    [Arguments]    ${file_name}    ${description}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select an Service Request    ${description}
    #--------------------------------    FileName    -----------------
    ${el1}=    CreateNewRequest_Page.lnkAttachmentFileName
    ${act_file_name}=    Get Text    ${el1}
    run keyword and continue on failure    should be equal    ${act_file_name}    ${file_name}
    #--------------------------------    Remove File X    -----------------
    ${el2}=    CreateNewRequest_Page.spnRemoveAttachment
    run keyword and continue on failure    Page Should Contain Element    ${el2}

Validate Attachment of Pending SR in Approval Details Page
    [Arguments]    ${file_name}    ${description}    ${approver_email}
    Header_Actions.Click Menu Sign out
    Login_Keywords.Login Customer    ${approver_email}    ${in_customer_password}
    Dashboard_Actions.Click Service Request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select an Service Request    ${description}
    #
    ${el1}=    CreateNewRequest_Page.lnkAttachmentFileName
    ${act_file_name}=    Get Text    ${el1}
    run keyword and continue on failure    should be equal    ${act_file_name}    ${file_name}
    #--------------------------------    Remove File X    -----------------
    ${el2}=    CreateNewRequest_Page.spnRemoveAttachment
    run keyword and continue on failure    Page Should Contain Element    ${el2}

Validate Message Category for User Roles
    [Arguments]    ${in_group}
#    #-------------------------------     Common Message for Group-12     --------------------------
    ${msg1}=    ServiceRequestDetails_Page.spnMessageCategoryText    Billing Question
    ${msg2}=    ServiceRequestDetails_Page.spnMessageCategoryText    Product or Service Issue
    ${msg3}=    ServiceRequestDetails_Page.spnMessageCategoryText    General Inquiry
    #---------------- Group-2 Element -----------------------
    ${msg4}=    ServiceRequestDetails_Page.spnMessageCategoryText    Change Current Product or Service
    ${msg5}=    ServiceRequestDetails_Page.spnMessageCategoryText    Add a Product
    #--------------------------------    Validate Confirmation Message    -----------------
    Run keyword and continue on failure    page should contain element  ${msg1}
    Run keyword and continue on failure    page should contain element  ${msg2}
    Run keyword and continue on failure    page should contain element  ${msg3}
    Run Keyword If    '${in_group}' == 'group12'    run keyword and continue on failure    page should Not contain element  ${msg4}
    Run Keyword If    '${in_group}' == 'group12'    run keyword and continue on failure    page should Not contain element  ${msg5}
    #---------------- For group-2 -----------------------------
    Run Keyword If    '${in_group}' == 'group2'    run keyword and continue on failure     page should contain element  ${msg4}
    Run Keyword If    '${in_group}' == 'group2'    run keyword and continue on failure     page should contain element  ${msg5}
