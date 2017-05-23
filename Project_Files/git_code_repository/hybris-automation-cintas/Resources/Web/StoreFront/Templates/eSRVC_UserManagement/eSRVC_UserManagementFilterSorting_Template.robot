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
User Management Sorting And Filtering Template
    [Arguments]    ${tc_data}
    set test variable  ${tc_data}

    # Set test date for template
    eSRVC_UserManagementFilterSorting_Template.Set Template Test Data

    # Begin Test
    eSRVC_UserManagementFilterSorting_Template.Begin Test

    # Register User
    eSRVC_UserManagementFilterSorting_Template.Customer Self Registration


    # Update User Registratio Status
    eSRVC_UserManagementFilterSorting_Template.Import Impex For Update User Status


    # Update User Role
    eSRVC_UserManagementFilterSorting_Template.Update User Role

    # Login to Front End
    eSRVC_UserManagementFilterSorting_Template.Login to Front End

#------------------------- Add or Edit User ---------------------------------------

    # Naviagte to user management page
    eSRVC_UserManagementFilterSorting_Template.Navigate To User Management Page

    # Select ALL or USERS PENDING APPROVALS tab
    eSRVC_UserManagementFilterSorting_Template.Select User Tab

    # Filter user by status and search text
    eSRVC_UserManagementFilterSorting_Template.Filter User

    # Search user by First or Last Name or Email
    eSRVC_UserManagementFilterSorting_Template.Search User

    # Validate Search Result  by First or Last Name or Email column
    eSRVC_UserManagementFilterSorting_Template.Validate User Search Result


    # Validate the message when there are no record
    eSRVC_UserManagementFilterSorting_Template.Validate User No Record Message

    # Validate Filter Facet
    eSRVC_UserManagementFilterSorting_Template.Validate Clear Search Filter Functionality

    # Check all filter Options are available
    eSRVC_UserManagementFilterSorting_Template.Validate User Filter Components


    # Check FirstName,LastName,Email,SubmittedDate are available
    eSRVC_UserManagementFilterSorting_Template.Validate User Results View


    # Validate that "Active status" is set as default
    eSRVC_UserManagementFilterSorting_Template.Validate User Default Status

    # Validate that "Inactive and Rejcted" row are not clickable, only active and pending are click able
    eSRVC_UserManagementFilterSorting_Template.Validate User Table Row Click Option

    # Validate Pagination
    eSRVC_UserManagementFilterSorting_Template.Validate Pagination

    # Validate Total Entry per page Except the last page
    eSRVC_UserManagementFilterSorting_Template.Validate Total Entry Per Page


    # Validate Sorting of User list
    eSRVC_UserManagementFilterSorting_Template.Validate Sort Asc And Dec For User

    # Check Global message on the top of the page
    eSRVC_UserManagementFilterSorting_Template.Validate Global Message


#    # validate newly creadted user
#    eSRVC_UserManagementFilterSorting_Template.Validate User Status

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


#-----------------------------------------------------------------------------------------------------------------


Navigate To User Management Page
    Run Keyword If    ${tc_data.workflow_openManageUsersPage}   UserManagement_Features.Navigate To User Management Page


Select User Tab
    Run Keyword If    '${tc_data.workflow_selectTab}' != '${EMPTY}'  UserManagement_Features.Select User Tab   ${tc_data.workflow_selectTab.upper()}



Filter User
    Run Keyword If    ${tc_data.workflow_filterUser}   UserManagement_Features.Filter User  ${tc_data.input_status}  ${tc_data.input_searchText}


Search User
    ${search_key} =   Run Keyword If    ${tc_data.workflow_search}  eSRVC_UserManagementFilterSorting_Template.Select Search Text  ${tc_data.input_searchKey}
    Run Keyword If    ${tc_data.workflow_search}   UserManagement_Features.Search User   ${search_key}

Select Search Text
    [Arguments]    ${input_searchKey}
    ${search_key} =   run keyword if   '${input_searchKey.upper()}'=='FNAME'  set variable  ${first_name}
    ...    ELSE IF   '${input_searchKey.upper()}'=='LNAME'  set variable  ${last_name}
    ...    ELSE IF   '${input_searchKey.upper()}'=='EMAIL'  set variable  ${email}
    ...    ELSE   set variable  ${input_searchKey}
    [Return]   ${search_key}


Validate User Search Result
    ${search_key} =   Run Keyword If    ${tc_data.validation_searchResult}  eSRVC_UserManagementFilterSorting_Template.Select Search Text  ${tc_data.input_searchKey}
    Run Keyword If    ${tc_data.validation_searchResult}   UserManagement_Validations.Validate User Search Result  ${tc_data.input_columnName}  ${search_key}


Validate User No Record Message
    Run Keyword If   ${tc_data.validation_noSearchResult}  UserManagement_Validations.Validate User No Record Message  	No results


Validate Clear Search Filter Functionality
    Run Keyword If   ${tc_data.validation_cleaFilter}  UserManagement_Validations.Validate Clear Search Filter Functionality  hyb30


Validate User Filter Components
    Run Keyword If   ${tc_data.validation_filterComponents}  UserManagement_Validations.Validate User Filter Components



Validate User Results View
    Run Keyword If   ${tc_data.validation_resultView}  UserManagement_Validations.Validate User Results View


Validate User Default Status
    Run Keyword If   ${tc_data.validation_defaultStatus}  UserManagement_Validations.Validate User Default Status

Validate User Table Row Click Option
    Run Keyword If   ${tc_data.validation_userRowLink}  UserManagement_Validations.Validate User Table Row Click Option  ${tc_data.input_status}


Validate Pagination
    Run Keyword If   ${tc_data.validation_pagination}  UserManagement_Validations.Validate Pagination


Validate Total Entry Per Page
    Run Keyword If   ${tc_data.validation_pageEntry}  UserManagement_Validations.Validate Total Entry Per Page


Validate Sort Asc And Dec For User
    Run Keyword If   ${tc_data.validate_sort}  UserManagement_Validations.Validate Sort Asc And Dec For User  ${tc_data.expected_column}  ${tc_data.expected_sortType}


Validate Global Message
    Run Keyword If   ${tc_data.validation_globalMessage}    GlobalMessage_Validations.Validate Message Contains  ${tc_data.input_globalMessage}



#Validate User Status
#    Run Keyword unless   '${tc_data.input_userListPage}'=='${EMPTY}'   UserManagement_Features.Navigate To User Management Page
#    Run Keyword unless   '${tc_data.input_tab}'=='${EMPTY}'   UserManagement_Features.Select User Tab  ${tc_data.input_tab.upper()}
#    Run Keyword If   ${tc_data.validation_userStatus}   UserManagement_Validations.Validate User Status  ${tc_data.expected_status}  ${email}

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

