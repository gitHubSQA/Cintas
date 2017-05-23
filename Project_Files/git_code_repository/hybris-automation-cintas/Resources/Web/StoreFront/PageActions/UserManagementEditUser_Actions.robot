*** Settings ***
Library           Selenium2Library
Library           String
Resource          ../PageObjects/UserManagementEditUser_Page.robot
*** Keywords ***

Click Back To Result Button
    ${locator} =  UserManagementEditUser_Page.lnk_UserManagementPageBackBtn
    wait until element is visible  ${locator}
    click element   ${locator}

#---------- User Details ----------------------
Get User Account Name
    ${locator} =  UserManagementEditUser_Page.lbl_AccountContent
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    [Return]  ${text}    

Get User Account ID
    ${locator} =  UserManagementEditUser_Page.lbl_AccountIdContent
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    [Return]  ${text}

Get User Address
    ${locator} =  UserManagementEditUser_Page.lbl_AddressContent
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    [Return]  ${text}

Get User First Name Content
    ${locator} =  UserManagementEditUser_Page.lbl_FirstNameContent
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    [Return]  ${text}

Get User Last Name Content
    ${locator} =  UserManagementEditUser_Page.lbl_LastNameContent
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    [Return]  ${text}

Get User Email Address Content
    ${locator} =  UserManagementEditUser_Page.lbl_EmailAddressContent
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    [Return]  ${text}

Get User Phone
    ${locator} =  UserManagementEditUser_Page.lbl_PhoneContent
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    [Return]  ${text}

#---------- User Information -----------------
Enter User First Name
    [Arguments]  ${first_name}
    ${locator} =  UserManagementEditUser_Page.txt_UserFirstName
    wait until element is visible  ${locator}
    input text  ${locator}  ${first_name}

Enter User Last Name
    [Arguments]  ${last_name}
    ${locator} =  UserManagementEditUser_Page.txt_UserLastName
    wait until element is visible  ${locator}
    input text  ${locator}  ${last_name}

Get User Last Name
    ${locator} =  UserManagementEditUser_Page.txt_UserLastName
    wait until element is visible  ${locator}
    ${text} =  Selenium2Library.get element attribute  ${locator}@value
    [Return]  ${text}

Get User First Name
    ${locator} =  UserManagementEditUser_Page.txt_UserFirstName
    wait until element is visible  ${locator}
    ${text} =  Selenium2Library.get element attribute  ${locator}@value
    [Return]  ${text}

Get User Email Address
    ${locator} =  UserManagementEditUser_Page.txt_UserEmail
    wait until element is visible  ${locator}
    ${text} =  Selenium2Library.get element attribute  ${locator}@value
    [Return]  ${text}


#---------- Check and Uncheck User Role -----------------
Check User Admin Role
    ${locator} =  UserManagementEditUser_Page.chk_UserAdmin
    wait until element is visible  ${locator}
    click element   ${locator}

Check SR Approver Role
    ${locator} =  UserManagementEditUser_Page.chk_SRApprover
    wait until element is visible  ${locator}
    click element   ${locator}

Check Reports Role
    ${locator} =  UserManagementEditUser_Page.chk_Reports
    wait until element is visible  ${locator}
    click element   ${locator}

Check Contract Editor Role
    ${locator} =  UserManagementEditUser_Page.chk_ContractEditor
    wait until element is visible  ${locator}
    click element   ${locator}

Check Contract Viewer Role
    ${locator} =  UserManagementEditUser_Page.chk_ContractViewer
    wait until element is visible  ${locator}
    click element   ${locator}

Check Wearer Editor Role
    ${locator} =  UserManagementEditUser_Page.chk_WearerEditor
    wait until element is visible  ${locator}
    click element   ${locator}

Check Wearer Viewer Role
    ${locator} =  UserManagementEditUser_Page.chk_WearerViewer
    wait until element is visible  ${locator}
    click element   ${locator}

Check OLBP Payer Role
    ${locator} =  UserManagementEditUser_Page.chk_OLBPPayer
    wait until element is visible  ${locator}
    click element   ${locator}

Check OLBP Viewer Role
    ${locator} =  UserManagementEditUser_Page.chk_OLBPViewer
    wait until element is visible  ${locator}
    click element   ${locator}

Check User Role
    [Arguments]    ${role}
    ${locator} =  UserManagementEditUser_Page.chk_UserRole  ${role}
    wait until element is visible  ${locator}
    click element   ${locator}

#---------- User Account -----------------
Click Select Account Button
    ${locator} =  UserManagementEditUser_Page.btn_SelectAccount
    wait until element is visible  ${locator}
    click element   ${locator}

Click Save All Changes Button
    ${locator} =  UserManagementEditUser_Page.btn_SaveAllChanges
    wait until element is visible  ${locator}
    click element   ${locator}

Click Remove All Accounts Link
    ${locator} =  UserManagementEditUser_Page.btn_RemoveAllAccounts
    wait until element is visible  ${locator}
    click element   ${locator}

Click MST Remove X Button
    [Arguments]    ${mst}
    UserManagementEditUser_Page.btn_RemoveMSTButton   ${cst}

Click CST Remove X Button
    [Arguments]    ${cst}
    UserManagementEditUser_Page.btn_RemoveCSTButton   ${cst}

#------------ Error Message -------------------

Get First Name Error Message
    ${locator} =    UserManagementEditUser_Page.lbl_UserFirstNameErrMsg
    wait until element is visible    ${locator}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

Get Last Name Error Message
    ${locator} =    UserManagementEditUser_Page.lbl_UserLastNameErrMsg
    wait until element is visible    ${locator}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

Get User Role Error Message
    ${locator} =    UserManagementEditUser_Page.lbl_UserRoleErrMsg
    wait until element is visible    ${locator}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

#--------- Deactivate User Account------------
Click Deactivate User Button
    ${locator} =  UserManagementEditUser_Page.btn_DeActivateUser
    wait until element is visible  ${locator}
    click element   ${locator}

Click Deactivate User Modal Close Button
    ${locator} =  UserManagementEditUser_Page.btn_DeActivateUserModalClose
    wait until element is visible  ${locator}
    click element   ${locator}

Click Deactivate User Modal Yes Button
    ${locator} =  UserManagementEditUser_Page.btn_DeActivateUserModalYes
    wait until element is visible  ${locator}
    click element   ${locator}

Click Deactivate User Modal No Button
    ${locator} =  UserManagementEditUser_Page.btn_DeActivateUserModalNo
    wait until element is visible  ${locator}
    click element   ${locator}

#--------- Approval Process ------------

Click Approve User Button
    ${locator} =  UserManagementEditUser_Page.btn_Approve
    wait until element is visible  ${locator}
    click element   ${locator}

Click Reject User Button
    ${locator} =  UserManagementEditUser_Page.btn_Reject
    wait until element is visible  ${locator}
    click element   ${locator}

Enter Reject Modal Comment
    [Arguments]  ${comment}
    ${locator} =  UserManagementEditUser_Page.txt_RejectUserModalComment
    wait until element is visible  ${locator}
    input text  ${locator}  ${comment}

Click Reject Modal Reject Button
    ${locator} =  UserManagementEditUser_Page.btn_RejectUserModalReject
    wait until element is visible  ${locator}
    click element   ${locator}


Click Reject Modal Close Button
    ${locator} =  UserManagementEditUser_Page.btn_RejectUserModalClose
    wait until element is visible  ${locator}
    click element   ${locator}

