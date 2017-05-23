*** Settings ***
Library           Collections
Library           FakerLibrary
Library           String
Library           DateTime
Resource          ../../../Common/Impex_Keywords.robot
Resource          ../../../Common/Common_Keywords.robot
Resource          ../../PageActions/Dashboard_Actions.robot
Resource          ../../PageActions/UserManagement_Actions.robot
Resource          ../../PageActions/Header_Actions.robot
Resource          ../../PageActions/UserManagementAddUser_Actions.robot
Resource          ../../PageActions/UserManagementEditUser_Actions.robot
Resource          ../../FunctionalKeywords/Login_Keywords.robot
Resource          ../../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../../FunctionalKeywords/UserManagement_Features.robot
Resource          ../../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../../PageValidations/ServiceRequest_Validations.robot
Resource          ../../PageValidations/CreateNewRequest_Validations.robot
Resource          ../../PageValidations/AlertNotification_Validation.robot
Resource          ../../PageValidations/UserManagement_Validations.robot
*** Variables ***
#${CUSTOMER}
#${PRODUCTS}
*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
User Management Template
    [Arguments]    ${tc_data}
    set test variable  ${tc_data}

    # Set test date for template
    eSRVC_UserManagement_Template.Set Template Test Data

    # Begin Test
    eSRVC_UserManagement_Template.Begin Test

    # Register User
    eSRVC_UserManagement_Template.Customer Self Registration


    # Update User Registratio Status
    eSRVC_UserManagement_Template.Import Impex For Update User Status


    # Update User Role
    eSRVC_UserManagement_Template.Update User Role

    # Login to Front End
    eSRVC_UserManagement_Template.Login to Front End

    # approver menu access right for differenrt user
    eSRVC_UserManagement_Template.Validate Approver Menu Access Right

    # Approver menu total= pending user request + pending service request
    eSRVC_UserManagement_Template.Validate Approval Menu Total Number

    # Approver menu pending user request
    eSRVC_UserManagement_Template.Validate Approval Menu Pending User Request Number

    # Approver menu pending service request
    eSRVC_UserManagement_Template.Validate Approval Menu Pending Service Request Number

#------------------------- Add or Edit User ---------------------------------------
    # Access right to user management page
    eSRVC_UserManagement_Template.Validate User Manage Page Access Right

    # Naviagte to user management page
    eSRVC_UserManagement_Template.Navigate To User Management Page

    # Select ALL or USERS PENDING APPROVALS tab
    eSRVC_UserManagement_Template.Select User Tab

    # Click add new user button
    eSRVC_UserManagement_Template.Add New User


    # Filter user by status and search text
    eSRVC_UserManagement_Template.Filter User


    # Filter and open user by status and search text
    eSRVC_UserManagement_Template.Open User


    # Valdiate user detail fields empty
    eSRVC_UserManagement_Template.Validate User Detail Fields Empty


    # Valdiate all user roels are optout
    eSRVC_UserManagement_Template.Validate All User Role Checkbox Optout


    # Valdiate active user first name, last name, email and checked roles
    eSRVC_UserManagement_Template.Valdiate Active User Information


    # Fill up user details
    eSRVC_UserManagement_Template.Enter New User Information


    # Update user details
    eSRVC_UserManagement_Template.Update User Information With CSV Arguments


    # Select User Roles
    eSRVC_UserManagement_Template.Unchecked All User Roles


    # Select User Roles
    eSRVC_UserManagement_Template.Select User Roles


    # Validate User Role selection
    eSRVC_UserManagement_Template.Validate Role Selection Logic


    # Validate Add User Account
    eSRVC_UserManagement_Template.Validate MST and CST Optin Optout

    # Add User Account
    eSRVC_UserManagement_Template.Add User Accounts

    # Add All User Account
    eSRVC_UserManagement_Template.Select All Accounts


    # remove al User Account
    eSRVC_UserManagement_Template.Remove All Accounts Link


    # Click Create New User Button
    eSRVC_UserManagement_Template.Click Create New User Button


    # Click Save All Button
    eSRVC_UserManagement_Template.Click Save All Button


    # Approve User
    eSRVC_UserManagement_Template.Approve User

    # Deny
    eSRVC_UserManagement_Template.Deny User

    # User Details field validation error
    eSRVC_UserManagement_Template.Validate Add User Details Field Error Message


    # User roles selection validation error
    eSRVC_UserManagement_Template.Validate Add User Roles Error Message


    # Check Global message on the top of the page
    eSRVC_UserManagement_Template.Validate Global Message1


    # validate newly creadted user
    eSRVC_UserManagement_Template.Validate User Status

#    # validate no user record
#    eSRVC_UserManagement_Template.Validate User No Record Message

##****************************************** Searching and sorting  **************************************************************

##************************************ My Services Add Wearer Page  *******************************
#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Begin Test
    Common_Keywords.Begin Web Test

Customer Self Registration
    Run Keyword If    ${tc_data.workflow_createNewUser}  Login_Keywords.Customer Self Registration    ${tc_data.input_account}    ${tc_data.input_accZipCode}    ${first_name}    ${last_name}
    ...    ${email}    ${phone_number}
    Run Keyword If    ${tc_data.workflow_createNewUser}    page should contain    ${reg_msg}
    Run Keyword If    ${tc_data.workflow_createNewUser}    Common_Actions.Customer Sign Out

Import Impex For Update User Status
    Run Keyword If    ${tc_data.workflow_updateUser}  Impex_Keywords.Import Impex For Update User Status   ${email}  ${tc_data.input_roles.lower()}  ${tc_data.input_regStatus}

Update User Role
    ${impx_first_login} =  set variable  False
    Run Keyword If    ${tc_data.workflow_impxUpdateUserRole}    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${tc_data.input_impxUserEmail}    ${tc_data.input_impxUserRole.lower()}   ${impx_first_login}

Login to Front End
    Run Keyword If    ${tc_data.workflow_login}    Login_Keywords.Login Customer    ${tc_data.input_customerEmail}    ${tc_data.input_customerPassword}

#------------------------ Keyword for approver menu -----------------------------------------------------------------------------
Validate Approver Menu Access Right
    Run Keyword If    ${tc_data.validate_approverMenu}   UserManagement_Validations.Validate Approver Menu Access Right  ${tc_data.input_impxUserRole.lower()}

Validate Approval Menu Total Number
    Run Keyword If    ${tc_data.validate_ApproverTotalNumber}  Header_Actions.Click Approvals
    Run Keyword If    ${tc_data.validate_ApproverTotalNumber}   UserManagement_Validations.Validate Approval Menu Total Number  ${tc_data.input_impxUserRole.lower()}

Validate Approval Menu Pending User Request Number
    Run Keyword If    ${tc_data.validate_pedingUserReqNumber}   Header_Actions.Click Approvals
    Run Keyword If    ${tc_data.validate_pedingUserReqNumber}   UserManagement_Validations.Validate Approval Menu Pending User Request Number

Validate Approval Menu Pending Service Request Number
    Run Keyword If    ${tc_data.validate_PendingSrReqNumber}   Header_Actions.Click Approvals
    Run Keyword If    ${tc_data.validate_PendingSrReqNumber}   UserManagement_Validations.Validate Approval Menu Pending Service Request Number

#-----------------------------------------------------------------------------------------------------------------

#------------------------ Keyword for add/update user accounts  -------------------------------------
Validate User Manage Page Access Right
    Run Keyword If   ${tc_data.validation_manageUserAcess}    UserManagement_Validations.Validate User Manage Page Access Right  ${tc_data.input_impxUserRole.lower()}

Navigate To User Management Page
    Run Keyword If    ${tc_data.workflow_openManageUsersPage}   UserManagement_Features.Navigate To User Management Page


Select User Tab
    Run Keyword If    '${tc_data.workflow_selectTab}' != '${EMPTY}'  UserManagement_Features.Select User Tab   ${tc_data.workflow_selectTab.upper()}


Add New User
    Run Keyword If    ${tc_data.workflow_clickAddNewUser}   Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.workflow_clickAddNewUser}   UserManagement_Actions.Click Add New User Button

Filter User
    Run Keyword If    ${tc_data.workflow_filterUser}   UserManagement_Features.Filter User  ${tc_data.input_status}  ${tc_data.input_searchText}


Open User
    ${tc_data.input_searchText} =   set variable if  '${tc_data.input_searchText}' == '${EMPTY}'  ${email}
    Run Keyword If    ${tc_data.workflow_openUser}   UserManagement_Features.Filter User  ${tc_data.input_status}  ${tc_data.input_searchText}
    Run Keyword If    ${tc_data.workflow_openUser}   UserManagement_Actions.Click User Table Row By Index  1


Enter New User Information
    Run Keyword If    ${tc_data.workflow_fillUserDetails}   Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.workflow_fillUserDetails}   UserManagement_Features.Enter New User Information  ${first_name}  ${last_name}  ${email}


Validate User Detail Fields Empty
    Run Keyword If    ${tc_data.validate_textFieldEmpty}   Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.validate_textFieldEmpty}   UserManagement_Validations.Validate User Detail Fields Empty

Validate All User Role Checkbox Optout
    Run Keyword If    ${tc_data.validate_roleCheckboxOptout}   UserManagement_Validations.Validate All User Role Checkbox Optout


Valdiate Active User Information
    Run Keyword If    ${tc_data.validate_activeUserInfo}   UserManagement_Validations.Valdiate Active User Information  ${first_name}  ${last_name}  ${email}  ${tc_data.input_roles.lower()}


Update User Information With CSV Arguments
    Run Keyword If    ${tc_data.workflow_editDetails}   UserManagement_Features.Update User Information With CSV Arguments  ${tc_data.input_detailsValues}

Select User Roles
    Run Keyword If    ${tc_data.workflow_selectUserRoles}   UserManagement_Features.Select User Roles  ${tc_data.input_userRoels}

Unchecked All User Roles
    Run Keyword If    ${tc_data.workflow_uncheckedAllUserRoles}   UserManagement_Features.Unchecked All User Roles


Validate Role Selection Logic
    Run Keyword If    ${tc_data.validation_roleSelection}   UserManagement_Validations.Validate Role Selection Logic   ${tc_data.input_userRoels}


Validate MST and CST Optin Optout
    Run Keyword If    ${tc_data.validation_accSelection}   UserManagement_Validations.Validate MST And CST Optin Optout  ${tc_data.input_userAccounts}


Add User Accounts
    Run Keyword If    ${tc_data.workflow_addAccounts}   UserManagement_Features.Add User Accounts  ${tc_data.input_userAccounts}

Select All Accounts
    Run Keyword If    ${tc_data.workflow_addAllAccounts}   UserManagement_Features.Select All Accounts

Remove All Accounts Link
    Run Keyword If    ${tc_data.workflow_removeAllAccounts}   UserManagementAddUser_Actions.Click Remove All Accounts Link
#=================== CREATE/UPDATE/APPROVE/REJECT ======================
Click Create New User Button
    Run Keyword If    ${tc_data.workflow_clickCreateNewUser}    Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.workflow_clickCreateNewUser}    UserManagementAddUser_Actions.Click Create New User Button

Click Save All Button
    Run Keyword If    ${tc_data.workflow_clickSaveAll}    UserManagementEditUser_Actions.Click Save All Changes Button

Approve User
    Run Keyword If    ${tc_data.workflow_approveUser}    UserManagement_Features.Approve User Request

Deny User
    Run Keyword If    ${tc_data.workflow_denyUser}    UserManagement_Features.Deny User Request


#=======================================================================================================================


Validate Add User Details Field Error Message
    Run Keyword If    ${tc_data.validation_detailsErrorMsg}   UserManagement_Validations.Validate Add User Details Field Error Message   ${tc_data.input_detailsValues}

Validate Add User Roles Error Message
    Run Keyword If    ${tc_data.validation_roleErrorMessage}   UserManagement_Validations.Validate Add User Roles Error Message

Validate Global Message1
    Run Keyword If   ${tc_data.validation_globalMessage1}    GlobalMessage_Validations.Validate Message Contains  ${tc_data.input_globalMessage1}

Validate User Status
    Run Keyword unless   '${tc_data.input_userListPage}'=='${EMPTY}'   UserManagement_Features.Navigate To User Management Page
    Run Keyword unless   '${tc_data.input_tab}'=='${EMPTY}'   UserManagement_Features.Select User Tab  ${tc_data.input_tab.upper()}
    Run Keyword If   ${tc_data.validation_userStatus}   UserManagement_Validations.Validate User Status  ${tc_data.expected_status}  ${email}


#Validate User No Record Message
#    Run Keyword If   ${tc_data.validation_noSearchResult1}   UserManagement_Features.Filter User  PENDING_APPROVAL  ${email}
#    Run Keyword If   ${tc_data.validation_noSearchResult1}  UserManagement_Validations.Validate User No Record Message  	No results
#



#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Set Template Test Data
    # Set Customer Registration data
    ${key} =    get_datetime_stamp
    ${first_name} =  Catenate    SEPARATOR=  FName    ${key}
    ${last_name} =  Catenate    SEPARATOR=  LName    ${key}
    ${email}=    Catenate    SEPARATOR=    hyb    ${key}    @test.com
    Set Test Variable    ${first_name}
    Set Test Variable    ${last_name}
    Set Test Variable    ${email}
    Set Test Variable    ${phone_number}    514-123-4567
    Set Test Variable    ${reg_msg}    Thank you for your registration request. The request is being reviewed by your company’s myCintas account Admin.

#    Run Keyword If    ${tc_data.}   UserManagement_Validations

