*** Settings ***
Library           Selenium2Library

*** Keywords ***

lnk_UserManagementPageBackBtn
    [Return]    id=userManagementPageBackBtn

#--------- Deactivate User Account------------
btn_DeActivateUser
    [Return]    css=.btn.btn-default.js-btn-deactivateuser

dlg_DeActivateUserModal
    [Return]    id=deactivateUserModal

btn_DeActivateUserModalYes
    [Return]    css=#deactivateUserModal .btn.btn-primary

btn_DeActivateUserModalNo
    [Return]    css=#deactivateUserModal .btn-default

btn_DeActivateUserModalClose
    [Return]    css=#deactivateUserModal .close

#---------- User Details ----------------------
lbl_AccountContent
    [Return]    xpath=//*[@class='title' and contains(.,'Account:')]/following-sibling::div[@class='content']

lbl_AccountIdContent
    [Return]    xpath=//*[@class='title' and contains(.,'Account ID:')]/following-sibling::div[@class='content']

lbl_AddressContent
    [Return]    xpath=//*[@id='b2BCustomerForm']/div/div/div[2]/div[3]/div[3]/div/div[3]/div[2]  # Read the full address.

lbl_FirstNameContent
    [Return]    xpath=//*[@class='title' and contains(.,'First Name:')]/following-sibling::div[@class='content']

lbl_LastNameContent
    [Return]    xpath=//*[@class='title' and contains(.,'Last Name:')]/following-sibling::div[@class='content']

lbl_EmailAddressContent
    [Return]    xpath=//*[@class='title' and contains(.,'Email Address:')]/following-sibling::div[@class='content']

lbl_PhoneContent
    [Return]    xpath=//*[@class='title' and contains(.,'Phone:')]/following-sibling::div[@class='content']

#---------- User Information Form -----------------
txt_UserLastName
    [Return]    id=lastName

txt_UserFirstName
    [Return]    id=firstName

txt_UserEmail
    [Return]    id=email

#---------- User Role -----------------
chk_UserAdmin
    [Return]    css=#user-admin+span

chk_SRApprover
    [Return]    css=#sr-approver+span

chk_Reports
    [Return]    css=#reports+span

chk_ContractEditor
    [Return]    css=#contract-editor+span

chk_ContractViewer
    [Return]    css=#contract-viewer+span

chk_WearerEditor
    [Return]    css=#wearer-editor+span

chk_WearerViewer
    [Return]    css=#wearer-viewer+span

chk_OLBPPayer
    [Return]    css=#olbp-payer+span

chk_OLBPViewer
    [Return]    css=#olbp-viewer+span

chk_UserRole
    [Arguments]    ${role}
    [Return]    css=#${role}+span

#---------- User Account -----------------

btn_SelectAccount
    [Return]    css=.btn.btn-default.js-btn-selectaccounts

btn_SaveAllChanges
    [Return]    css=#b2BCustomerForm .btn.btn-primary

btn_RemoveAllAccounts
    [Return]    css=.btn.btn-link.js-btn-removeallaccounts

btn_RemoveMSTButton
    [Arguments]    ${mst}
    [Return]    xpath=//*[@class='js-mst-remove btn-remove' and @data-mst-id='${mst}']/i

btn_RemoveCSTButton
    [Arguments]    ${cst}
    [Return]    xpath=//*[@class='js-cst-remove btn-remove' and @data-cst-id='${cst}']/i

lbl_UserAccount
    [Arguments]    ${acc}
    [Return]    css=#text_${acc}

#-------- Error Message --------------

lbl_UserLastNameErrMsg
    [Return]    id=lastName-error

lbl_UserFirstNameErrMsg
    [Return]    id=firstName-error

lbl_EmailErrMsg
    [Return]    id=email-error

lbl_UserRoleErrMsg
    [Return]    id=chkUserRole-error

#---------- User Approval -----------------

btn_Approve
    [Return]    css=.btn.btn-primary.js-btn-approvenewuser

btn_Reject
    [Return]    css=.btn.btn-default.js-btn-denynewuser
#--- modal-----
dlg_RejectUserModal
    [Return]    id=rejectUserModal

txt_RejectUserModalComment
    [Return]    css=#rejectUserForm #comments

btn_RejectUserModalReject
    [Return]    css=.btn.btn-primary.js-btn-denyUserRegistration

btn_RejectUserModalClose
    [Return]    css=#rejectUserModal .close

