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

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
User Management Update Template
    [Arguments]    ${tc_data}
    set test variable  ${tc_data}

    # Set test date for template
    eSRVC_UserManagementUpdate_Template.Set Template Test Data

    # Begin Test
    eSRVC_UserManagementUpdate_Template.Begin Test

    # Update User Role
    eSRVC_UserManagementUpdate_Template.Update User Role

    # Login to Front End
    eSRVC_UserManagementUpdate_Template.Login to Front End

#------------------------- Add or Edit User ---------------------------------------

    # Naviagte to user management page
    eSRVC_UserManagementUpdate_Template.Navigate To User Management Page

    # Create New User
    eSRVC_UserManagementUpdate_Template.Create New User


    # Filter user by status and search text
    eSRVC_UserManagementUpdate_Template.Filter User

    # Valdiate active user first name, last name, email and checked roles
    eSRVC_UserManagementUpdate_Template.Valdiate Active User Information

    # Update user details
    eSRVC_UserManagementUpdate_Template.Update User Information With CSV Arguments1

    # Deactivate User
    eSRVC_UserManagementUpdate_Template.Click Deactivate User Button


    # Deactivate Popup Valdiation
    eSRVC_UserManagementUpdate_Template.Valdiate Deactivate Popup Component


    # Deactivate Popup Operation (Yes,No,Close)
    eSRVC_UserManagementUpdate_Template.Perform Deactivate Operation

#================================================================================
    # Select User Roles
    eSRVC_UserManagementUpdate_Template.Unchecked All User Roles


    # User Admin Access Right
    eSRVC_UserManagementUpdate_Template.Valdiate User Admin Access Right


    # Select User Roles
    eSRVC_UserManagementUpdate_Template.Select User Roles

    # Validate User Role selection
    eSRVC_UserManagementUpdate_Template.Validate Role Selection Logic

    # remove all User Account
    eSRVC_UserManagementUpdate_Template.Remove All Accounts Link

    # Add New User Account
    eSRVC_UserManagementUpdate_Template.Add User Accounts

    # Validate Selected User Account
    eSRVC_UserManagementUpdate_Template.Valdiate User Account

    # Click Save All Button
    eSRVC_UserManagementUpdate_Template.Click Save All Button

    # User Details field validation error
    eSRVC_UserManagementUpdate_Template.Validate Add User Details Field Error Message


    # User roles selection validation error
    eSRVC_UserManagementUpdate_Template.Validate Add User Roles Error Message


    # Check Global message on the top of the page
    eSRVC_UserManagementUpdate_Template.Validate Global Message1


    # validate user status
    eSRVC_UserManagementUpdate_Template.Validate User Status


    # validate user update service request content
    eSRVC_UserManagementUpdate_Template.Valdiate User Udpate Service Request Content


#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Begin Test
    Common_Keywords.Begin Web Test


Update User Role
    ${impx_first_login} =  set variable  False
    Run Keyword If    ${tc_data.workflow_impxUpdateUserRole}    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${tc_data.input_impxUserEmail}    ${tc_data.input_impxUserRole.lower()}   ${impx_first_login}

Login to Front End
    Run Keyword If    ${tc_data.workflow_login}    Login_Keywords.Login Customer    ${tc_data.input_customerEmail}    ${tc_data.input_customerPassword}


Navigate To User Management Page
    Run Keyword If    ${tc_data.workflow_openManageUsersPage}   UserManagement_Features.Navigate To User Management Page

# Create New User
Create New User
    Run Keyword If    ${tc_data.workflow_createNewUser}   Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.workflow_createNewUser}   UserManagement_Actions.Click Add New User Button
    Run Keyword If    ${tc_data.workflow_createNewUser}   Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.workflow_createNewUser}   UserManagement_Features.Enter New User Information  ${first_name}  ${last_name}  ${email}
    Run Keyword If    ${tc_data.workflow_createNewUser}   UserManagement_Features.Select User Roles  ${tc_data.input_newUserRole}
    Run Keyword If    ${tc_data.workflow_createNewUser}   UserManagement_Features.Add User Accounts  ${tc_data.input_newUserAccount}
    Run Keyword If    ${tc_data.workflow_createNewUser}   UserManagementAddUser_Actions.Click Create New User Button


Filter User
    ${search_text} =  set variable if  '${tc_data.input_searchText}'=='${EMPTY}'  ${email}  ${tc_data.input_searchText}
    Run Keyword If    ${tc_data.workflow_filterUser}   UserManagement_Features.Select User Tab   ${tc_data.input_selectTab.upper()}
    Run Keyword If    ${tc_data.workflow_filterUser}   UserManagement_Features.Filter User  ${tc_data.input_status}  ${search_text}
    Run Keyword unless  '${tc_data.input_openUser}'=='${EMPTY}'   UserManagement_Actions.Click User Table Row By Index  1


Open User
    ${tc_data.input_searchText} =   set variable if  '${tc_data.input_searchText}' == '${EMPTY}'  ${email}
    Run Keyword If    ${tc_data.workflow_openUser}   UserManagement_Features.Filter User  ${tc_data.input_status}  ${tc_data.input_searchText}
    Run Keyword If    ${tc_data.workflow_openUser}   UserManagement_Actions.Click User Table Row By Index  1


#=============================================Edit User Page =====================================================================================

Valdiate Active User Information
    Run Keyword If    ${tc_data.validate_activeUserInfo}    Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.validate_activeUserInfo}   UserManagement_Validations.Valdiate Active User Information  ${first_name}  ${last_name}  ${email}  ${tc_data.input_newUserRole.lower()}

Update User Information With CSV Arguments1
    Run Keyword If    ${tc_data.workflow_editDetails}   UserManagement_Features.Update User Information With CSV Arguments1  ${tc_data.input_detailsValues}

Click Deactivate User Button
    Run Keyword If    ${tc_data.workflow_clickDeactivate}   UserManagementEditUser_Actions.Click Deactivate User Button

Valdiate Deactivate Popup Component
    Run Keyword If    ${tc_data.validate_decPopup}   UserManagement_Validations.Valdiate Deactivate Popup Component

Perform Deactivate Operation
    Run Keyword If    ${tc_data.workflow_deactivate}  UserManagement_Features.Perform Deactivate Operation  ${tc_data.input_decDecision}

Select User Roles
    Run Keyword If    ${tc_data.workflow_selectUserRoles}   UserManagement_Features.Select User Roles  ${tc_data.input_userRoels}

Valdiate User Admin Access Right
    Run Keyword If    ${tc_data.validate_userAdminAccessRight}   UserManagement_Validations.Valdiate User Admin Access Right

Unchecked All User Roles
    Run Keyword If    ${tc_data.workflow_uncheckedAllUserRoles}   UserManagement_Features.Unchecked All User Roles


Validate Role Selection Logic
    Run Keyword If    ${tc_data.validation_roleSelection}   UserManagement_Validations.Validate Role Selection Logic   ${tc_data.input_userRoels}


Remove All Accounts Link
    Run Keyword If    ${tc_data.workflow_removeAllAccounts}   UserManagementAddUser_Actions.Click Remove All Accounts Link

Add User Accounts
    Run Keyword If    ${tc_data.workflow_addAccounts}   UserManagement_Features.Add User Accounts  ${tc_data.input_userAccounts}

Valdiate User Account
    Run Keyword If    ${tc_data.validation_selectedAcc}   UserManagement_Validations.Valdiate User Account  ${tc_data.expected_acc}

Click Create New User Button
    Run Keyword If    ${tc_data.workflow_clickCreateNewUser}    Common_Actions.Wait For Loading
    Run Keyword If    ${tc_data.workflow_clickCreateNewUser}    UserManagementAddUser_Actions.Click Create New User Button

Click Save All Button
    Run Keyword If    ${tc_data.workflow_clickSaveAll}    UserManagementEditUser_Actions.Click Save All Changes Button

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



Valdiate User Udpate Service Request Content
    Run Keyword If   ${tc_data.validation_serviceRequest}   UserManagement_Validations.Valdiate User Udpate Service Request Content  ${tc_data.input_customerEmail}

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


