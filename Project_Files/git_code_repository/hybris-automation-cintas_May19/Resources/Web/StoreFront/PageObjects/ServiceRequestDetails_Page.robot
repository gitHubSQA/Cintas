*** Settings ***
Library           Selenium2Library

*** Keywords ***
btnApprove
    [Return]    css=.service-request-detail-btn-wrapper .js-btn-sr-approve
    #[Return]    xpath=//*[@id='serviceRequestDetailMessageForm']/descendant::button[contains(text(),'Approve')]

btnReject
    [Return]    css=.service-request-detail-btn-wrapper .js-btn-sr-reject

btnBack
    [Return]    id=serviceRequestDetailPageBackBtn

btnConfirmationReject
    [Return]    xpath=//div[@id='rejectServiceRequestModal']/descendant::button[contains(text(),'Reject')]

btnConfirmationApprove
    [Return]    xpath=//div[@id='approveServiceRequestModal']/descendant::button[contains(text(),'Approve')]

btnApproveConfirmationCancel
    [Return]    xpath=//div[@id='approveServiceRequestModal']/descendant::*[contains(text(),'Cancel')]

btnRejectConfirmationCancel
    [Return]    xpath=//div[@id='rejectServiceRequestModal']/descendant::*[contains(text(),'Cancel')]

btnConfirmationClose
    [Return]    css=.close

txtMessage
    [Return]    id=serviceRequestDetailMessage

# Service Request Details
divServiceRequestID
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'ID:')]/following-sibling::div

divDateSubmitted
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Date Submitted:')]/following-sibling::div

divLastName
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Last Name')]/following-sibling::div

divFirstName
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'First Name:')]/following-sibling::div

divEmail
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Email:')]/following-sibling::div

divStatus
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Status:')]/following-sibling::div

divMessageCategory
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Message Category:')]/following-sibling::div


divSubject
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Subject:')]/following-sibling::div

divDescription
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Details:')]/following-sibling::div

# New SR fields
divSystemSelectedAccount
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'System Selected Account:')]/following-sibling::div

divAdditionalAccountsLinkedToUse
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Additional Accounts Linked To User:')]/following-sibling::div

divCommentsFromRequester
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Comments From Requester:')]/following-sibling::div

divServiceRequestApproverDetails
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Service Request Approver Details:')]/following-sibling::div

divCommentsFromApprover
    [Return]    xpath=//*[@class='service-request-detail']/descendant::div[contains(text(),'Comments From Approver:')]/following-sibling::div

#===============================================================================================================================
lblMessageBoxErrorMessage
    [Return]    id=serviceRequestDetailMessage-error

divApproveServiceRequestModal
    [Return]    id=approveServiceRequestModal

divRejectServiceRequestModal
    [Return]    id=rejectServiceRequestModal

buttonMessageCategory
    [Return]    css=button[data-id=serviceCategory]

spnMessageCategoryText
    [Arguments]    ${category_text}
    [Return]    xpath=//*[@class='text' and text()='${category_text}']

lblReply
    [Return]    xpath=//*[@class='control-label' and text()='Reply']

txtRequestChat
    [Return]    id=serviceRequestDetailChat

btnSubmitChat
    [Return]    css=.js-btn-sr-submit-chat

spnMsgAuthorTitle
    [Arguments]    ${msg_number}
    [Return]    xpath=//*[@class='msg-group'][${msg_number}]/descendant::span[@class='msg-author']

spnMsgText
    [Arguments]    ${msg_number}
    [Return]    xpath=//*[@class='msg-group'][${msg_number}]/descendant::span[2]

spnMsgTimeStamp
    [Arguments]    ${msg_number}
    [Return]    xpath=//*[@class='msg-group'][${msg_number}]/descendant::div[@class='msg-timestamp']
