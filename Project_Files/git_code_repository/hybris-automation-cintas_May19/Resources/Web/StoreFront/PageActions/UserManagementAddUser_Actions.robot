*** Settings ***
Library           Selenium2Library
Library           String
Resource          ../PageObjects/UserManagementAddUser_Page.robot

*** Keywords ***

Click Back To Result Button
    ${locator} =  UserManagementAddUser_Page.lnk_UserManagementPageBackBtn
    wait until element is visible  ${locator}
    click element   ${locator}

#---------- User Information Form -----------------
Enter User First Name
    [Arguments]  ${first_name}
    ${locator} =  UserManagementAddUser_Page.txt_UserFirstName
    wait until element is visible  ${locator}
    input text  ${locator}  ${first_name}

Enter User Last Name
    [Arguments]  ${last_name}
    ${locator} =  UserManagementAddUser_Page.txt_UserLastName
    wait until element is visible  ${locator}
    input text  ${locator}  ${last_name}

Enter User Email Address
    [Arguments]  ${email}
    ${locator} =  UserManagementAddUser_Page.txt_UserEmail
    wait until element is visible  ${locator}
    input text  ${locator}  ${email}

Get User Last Name
    ${locator} =  UserManagementAddUser_Page.txt_UserLastName
    wait until element is visible  ${locator}
    ${text} =  Selenium2Library.Get Element Attribute  ${locator}@value
    [Return]  ${text}

Get User First Name
    ${locator} =  UserManagementAddUser_Page.txt_UserFirstName
    wait until element is visible  ${locator}
    ${text} =  Selenium2Library.Get Element Attribute  ${locator}@value
    [Return]  ${text}

Get User Email Address
    ${locator} =  UserManagementAddUser_Page.txt_UserEmail
    wait until element is visible  ${locator}
    ${text} =  Selenium2Library.Get Element Attribute  ${locator}@value
    [Return]  ${text}

#---------- User Role -----------------
Check User Admin Role
    ${locator} =  UserManagementAddUser_Page.chk_UserAdmin
    wait until element is visible  ${locator}
    click element   ${locator}

Check SR Approver Role
    ${locator} =  UserManagementAddUser_Page.chk_SRApprover
    wait until element is visible  ${locator}
    click element   ${locator}

Check Reports Role
    ${locator} =  UserManagementAddUser_Page.chk_Reports
    wait until element is visible  ${locator}
    click element   ${locator}

Check Contract Editor Role
    ${locator} =  UserManagementAddUser_Page.chk_ContractEditor
    wait until element is visible  ${locator}
    click element   ${locator}

Check Contract Viewer Role
    ${locator} =  UserManagementAddUser_Page.chk_ContractViewer
    wait until element is visible  ${locator}
    click element   ${locator}

Check Wearer Editor Role
    ${locator} =  UserManagementAddUser_Page.chk_WearerEditor
    wait until element is visible  ${locator}
    click element   ${locator}

Check Wearer Viewer Role
    ${locator} =  UserManagementAddUser_Page.chk_WearerViewer
    wait until element is visible  ${locator}
    click element   ${locator}

Check OLBP Payer Role
    ${locator} =  UserManagementAddUser_Page.chk_OLBPPayer
    wait until element is visible  ${locator}
    click element   ${locator}

Check OLBP Viewer Role
    ${locator} =  UserManagementAddUser_Page.chk_OLBPViewer
    wait until element is visible  ${locator}
    click element   ${locator}

Check User Role
    [Arguments]    ${role}
    ${locator} =  UserManagementAddUser_Page.chk_UserRole  ${role}
    wait until element is visible  ${locator}
    click element   ${locator}

#---------- User Account ----------------

Click Select Account Button
    ${locator} =  UserManagementAddUser_Page.btn_SelectAccount
    wait until element is visible  ${locator}
    click element   ${locator}

Click Create New User Button
    ${locator} =  UserManagementAddUser_Page.btn_CreateNewUser
    wait until element is visible  ${locator}
    click element   ${locator}

Click Remove All Accounts Link
    ${locator} =  UserManagementAddUser_Page.btn_RemoveAllAccounts
    wait until element is visible  ${locator}
    click element   ${locator}

Get User Account Number
    UserManagementAddUser_Page.lbl_UserAccount




#------------ Error Message -------------------
Get First Name Error Message
    ${locator} =    UserManagementAddUser_Page.lbl_UserFirstNameErrMsg
    wait until element is visible    ${locator}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

Get Last Name Error Message
    ${locator} =    UserManagementAddUser_Page.lbl_UserLastNameErrMsg
    wait until element is visible    ${locator}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

Get Email Error Message
    ${locator} =    UserManagementAddUser_Page.lbl_EmailErrMsg
    wait until element is visible    ${locator}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

Get User Role Error Message
    ${locator} =    UserManagementAddUser_Page.lbl_UserRoleErrMsg
    wait until element is visible    ${locator}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

