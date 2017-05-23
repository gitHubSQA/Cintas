*** Settings ***
Resource          ../PageObjects/ServiceRequestDetails_Page.robot

*** Keywords ***
Click Reject Button
    ${locator} =    ServiceRequestDetails_Page.btnReject
    Wait Until Element Is Visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Approve Button
    ${locator} =    ServiceRequestDetails_Page.btnApprove
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
    #Click Button    ${locator}

Click Back Button
    ${locator} =    ServiceRequestDetails_Page.btnBack
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Confirmation Reject Button
    ${locator} =    ServiceRequestDetails_Page.btnConfirmationReject
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
    # To click using javascripts
    #Comment    Execute Javascript    $('.btn.btn-primary').get(2).click()

Click Confirmation Approve Button
    ${locator} =    ServiceRequestDetails_Page.btnConfirmationApprove
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Approve Confirmation Cancel Button
    ${locator} =    ServiceRequestDetails_Page.btnApproveConfirmationCancel
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Reject Confirmation Cancel Button
    ${locator} =    ServiceRequestDetails_Page.btnRejectConfirmationCancel
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Confirmation Close Button
    ${locator} =    ServiceRequestDetails_Page.btnConfirmationClose
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Enter Message
    [Arguments]    ${message}
    ${locator} =    ServiceRequestDetails_Page.txtMessage
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${message}

#------------------Read Servcie Request Details Information -----------------------
Get Request ID
    ${locator} =    ServiceRequestDetails_Page.divServiceRequestID
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Date Submitted Text
    ${locator} =    ServiceRequestDetails_Page.divDateSubmitted
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Last Name
    ${locator} =    ServiceRequestDetails_Page.divLastName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get First Name
    ${locator} =    ServiceRequestDetails_Page.divFirstName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Email
    ${locator} =    ServiceRequestDetails_Page.divEmail
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get SR Status
    ${locator} =    ServiceRequestDetails_Page.divStatus
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get SR Message Category
    ${locator} =    ServiceRequestDetails_Page.divMessageCategory
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}


Get Subject
    ${locator} =    ServiceRequestDetails_Page.divSubject
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Description
    ${locator} =    ServiceRequestDetails_Page.divDescription
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}
#--------------------------------- new details ---------------------
Get System Selected Account
    ${locator} =    ServiceRequestDetails_Page.divSystemSelectedAccount
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Additional Accounts Linked To Use
    ${locator} =    ServiceRequestDetails_Page.divAdditionalAccountsLinkedToUse
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Comments From Requester
    ${locator} =    ServiceRequestDetails_Page.divCommentsFromRequester
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Service Request Approver Details
    ${locator} =    ServiceRequestDetails_Page.divServiceRequestApproverDetails
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Comments From Approver
    ${locator} =    ServiceRequestDetails_Page.divCommentsFromApprover
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

#==============================================================================

Get Message Box Error Text
    ${locator} =    ServiceRequestDetails_Page.lblMessageBoxErrorMessage
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Click Update Message
    ${locator} =    ServiceRequestDetails_Page.btnUpdateMessage
    Click Element    ${locator}

Select Message Category
    [Arguments]    ${category_text}
    ${locator} =    ServiceRequestDetails_Page.buttonMessageCategory
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
    # select Text
    ${el1} =    ServiceRequestDetails_Page.spnMessageCategoryText    ${category_text}
    wait until element is visible    ${el1}    ${DEFAULT_TIMEOUT}
    Click Element    ${el1}


Enter Chat Message
    [Arguments]    ${message}
    ${locator} =    ServiceRequestDetails_Page.txtRequestChat
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${message}

Click Chat Send Button
    ${locator} =    ServiceRequestDetails_Page.btnSubmitChat
    wait until element is visible    ${locator}
    Click Element    ${locator}

Get Msg Author Title
    [Arguments]    ${msg_number}
    ${locator} =    ServiceRequestDetails_Page.spnMsgAuthorTitle    ${msg_number}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${author_title}=    Get Text    ${locator}
    [Return]    ${author_title}

Get Msg Text
    [Arguments]    ${msg_number}
    ${locator} =    ServiceRequestDetails_Page.spnMsgText    ${msg_number}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${msg_text} =    Get Text    ${locator}
    [Return]    ${msg_text}

Get Msg Time Stamp
    [Arguments]    ${msg_number}
    ${locator} =    ServiceRequestDetails_Page.spnMsgTimeStamp    ${msg_number}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${time_stamp} =    Get Text    ${locator}
    [Return]    ${time_stamp}


