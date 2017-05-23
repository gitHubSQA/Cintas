*** Settings ***
Library           Selenium2Library

*** Keywords ***
lnk_UserManagementPageBackBtn
    [Return]    id=userManagementPageBackBtn
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

btn_CreateNewUser
    [Return]    css=#b2BCustomerForm .btn.btn-primary

btn_RemoveAllAccounts
    [Return]    css=.btn.btn-link.js-btn-removeallaccounts

lbl_UserAccount
    [Arguments]    ${acc}
    [Return]    css=#text_${acc}+div

#---------- Warning error message---------------

lbl_UserLastNameErrMsg
    [Return]    id=lastName-error

lbl_UserFirstNameErrMsg
    [Return]    id=firstName-error

lbl_EmailErrMsg
    [Return]    id=email-error

lbl_UserRoleErrMsg
    [Return]    id=chkUserRole-error


