*** Settings ***
Library           String
Library           Collections
Library           ../../../../hybris-automation-shared/Libraries/MathUtils.py
Resource          ../PageActions/SelectAnAccount_Actions.robot
Resource          ../PageActions/Common_Actions.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../PageActions/UserManagement_Actions.robot
Resource          ../PageActions/UserManagementAddUser_Actions.robot
Resource          ../PageActions/UserManagementEditUser_Actions.robot

*** Keywords ***
Filter By Account By Search
    [Arguments]    ${filter_text}    ${filter_state}    ${filter_sold_to}
    # Missing Click Filter By Account
    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
    SelectAnAccount_Actions.Click Search
    # Need to modify - Pass a list and select all Sold To's from the that list
    Run Keyword If    '${filter_sold_to}' != '${EMPTY}'    SelectAnAccount_Actions.Check Sold To Checkbox    ${filter_sold_to}
    SelectAnAccount_Actions.Click Select

Filter By Account All
    SelectAnAccount_Actions.Click Select All Accounts

Select An Account By MST
    [Arguments]    ${filter_text}    ${filter_state}    ${master_sold_to}
    # Missing Click Filter By Account
    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
    SelectAnAccount_Actions.Click Search
    SelectAnAccount_Actions.Click MST Select Button  ${master_sold_to}

Slect An Account By CST
    [Arguments]    ${filter_text}    ${filter_state}    ${customer_sold_to}
    # Missing Click Filter By Account
    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
    SelectAnAccount_Actions.Click Search
    SelectAnAccount_Actions.Click CST Select Button  ${customer_sold_to}
#----------------- Manage User Page -------------------------------------------
Navigate To User Management Page
    Common_Actions.Open Page    cintasrentalsstorefront/user-management
    Common_Actions.Wait For Loading

Select User Tab
    [Arguments]    ${userType}
    [Documentation]  ${userType} value should be "ALL" or "PENDING"
    log  ${userType}
    Run Keyword If    '${userType}' == 'ALL'        UserManagement_Actions.Click All Users Tab
    Run Keyword If    '${userType}' == 'PENDING'    UserManagement_Actions.Click Users Pending Approval Tab

#----------------- Add New User or Update Existing User -------------------------------------------
Enter New User Information
    [Arguments]    ${first_name}  ${last_name}   ${email}
    UserManagementAddUser_Actions.Enter User First Name  ${first_name}
    UserManagementAddUser_Actions.Enter User Last Name   ${last_name}
    UserManagementAddUser_Actions.Enter User Email Address   ${email}

Update User Information
    [Arguments]    ${first_name}  ${last_name}   ${email}
    [Documentation]  'None' means no input
    Run Keyword If    '${first_name}'!='None'    UserManagementAddUser_Actions.Enter User First Name  ${first_name}
    Run Keyword If    '${last_name}'!='None'    UserManagementAddUser_Actions.Enter User Last Name   ${last_name}
    run keyword unless  '${email}'=='None'  serManagementAddUser_Actions.Enter User Email Address   ${email}


Update User Information With CSV Arguments
    [Arguments]    ${csv_details}
    @{user_details} =    Split String   ${csv_details}  ;
    ${first_name} =  set variable  @{user_details}[0]
    ${last_name} =   set variable  @{user_details}[1]
    ${email} =       set variable  @{user_details}[2]
    Run Keyword If    '${first_name}' != '${EMPTY}'    UserManagementAddUser_Actions.Enter User First Name  ${first_name}
    Run Keyword If    '${last_name}' != '${EMPTY}'    UserManagementAddUser_Actions.Enter User Last Name   ${last_name}
    run keyword If  '${email}' != '${EMPTY}'  UserManagementAddUser_Actions.Enter User Email Address   ${email}


Update User Information With CSV Arguments1
    [Arguments]    ${csv_details}
    @{user_details} =    Split String   ${csv_details}  ;
    ${first_name} =  set variable  @{user_details}[0]
    ${last_name} =   set variable  @{user_details}[1]
    ${email} =       set variable  @{user_details}[2]
    Run Keyword If    '${first_name}'!='None'    UserManagementAddUser_Actions.Enter User First Name  ${first_name}
    Run Keyword If    '${last_name}'!='None'    UserManagementAddUser_Actions.Enter User Last Name   ${last_name}
    run keyword unless  '${email}'=='None'  serManagementAddUser_Actions.Enter User Email Address   ${email}




#
#Update User Information With CSV Arguments
#    [Arguments]    ${csv_details}
#    @{user_details} =    Split String   ${csv_details}  ;
#    ${first_name} =  set variable  @{user_details}[0]
#    ${last_name} =   set variable  @{user_details}[1]
#    ${email} =       set variable  @{user_details}[2]
#    Run Keyword If    '${first_name}' != '${EMPTY}'    UserManagementAddUser_Actions.Enter User First Name  ${first_name}
#    Run Keyword If    '${last_name}' != '${EMPTY}'    UserManagementAddUser_Actions.Enter User Last Name   ${last_name}
#    run keyword If  '${email}' != '${EMPTY}'  UserManagementAddUser_Actions.Enter User Email Address   ${email}



Select User Roles
    [Arguments]    ${csv_roles}
    [Documentation]  Roels should be seperated by ;--- Example: "user-admin;contract-editor;contract-viewer;sr-approver;wearer-editor;wearer-viewer;olbp-payer;olbp-viewer"
    @{user_roles} =    Split String   ${csv_roles}  ;
    :FOR    ${role}    IN    @{user_roles}
    \    ${status}=    Execute Javascript    return $("#${role}").prop("checked")
    \    run keyword unless  ${status}   UserManagementAddUser_Actions.Check User Role  ${role}

Unselect User Roles
    [Arguments]    ${csv_roles}
    [Documentation]  Roels should be seperated by ;--- Example: "user-admin;contract-editor;contract-viewer;sr-approver;wearer-editor;wearer-viewer;olbp-payer;olbp-viewer"
    @{user_roles} =    Split String   ${csv_roles}  ;
    :FOR    ${role}    IN    @{user_roles}
    \    ${status}=    Execute Javascript    return $("#${role}").prop("checked")
    \    run keyword if  ${status}   UserManagementAddUser_Actions.Check User Role  ${role}

Unchecked All User Roles
    ${csv_roles} =  set variable  user-admin;contract-editor;contract-viewer;sr-approver;wearer-editor;wearer-viewer;olbp-payer;olbp-viewer;reports
    Unselect User Roles  ${csv_roles}
#-------------------- User Account  ----------------------------

Add User Accounts
    [Arguments]  ${csv_csts}
    @{cst_list} =  Split String   ${csv_csts}  ;
    UserManagementAddUser_Actions.Click Select Account Button
    : FOR    ${cst}    IN    @{cst_list}
    \    SelectAnAccount_Actions.Check User CST Checkbox   ${cst}
    SelectAnAccount_Actions.Click Select

Remove User MST Accounts
    [Arguments]  @{mst_list}
    : FOR    ${mst}    IN    @{mst_list}
    \   log  ${mst}
    \    UserManagementEditUser_Actions.Click MST Remove X Button   ${mst}

Remove User CST Accounts
    [Arguments]  @{cst_list}
    : FOR    ${cst}    IN    @{cst_list}
    \   log  ${cst}
    \    UserManagementEditUser_Actions.Click CST Remove X Button   ${cst}


Select All Accounts
    UserManagementAddUser_Actions.Click Select Account Button
    SelectAnAccount_Actions.Click Select All Accounts





#********************* Keywords For Sarching and Sorting ******************************
#-------------------- Searching ----------------------------
Search User
    [Arguments]    ${search_text}
    UserManagement_Actions.Enter Search Text    ${search_text}
    UserManagement_Actions.Click Search Button
    Common_Actions.Wait For Loading


Filter User
    [Arguments]    ${user_status}  ${search_text}
    Run Keyword If    '${user_status}' != '${EMPTY}'   UserManagement_Actions.Select User Status By Value   ${user_status}
    Run Keyword If    '${search_text}' != '${EMPTY}'    UserManagement_Actions.Enter Search Text    ${search_text}
    UserManagement_Actions.Click Search Button
    Common_Actions.Wait For Loading


Get Users Column All Values
    [Arguments]    ${column_name}
    ${cntr_total} =    UserManagement_Actions.Get Total View Entry
    ${cntr_total} =    roundup    ${cntr_total}
    ${cntr_total} =    Evaluate    ${cntr_total} / 10
    @{cntr_values} =    Create List
    : FOR    ${INDEX}    IN RANGE    1    ${cntr_total} + 1
    \    @{page_values} =    UserManagement_Actions.Get User Table Column Values    ${INDEX}    ${column_name}
    \    ${cntr_values} =    Combine Lists    ${cntr_values}    ${page_values}
    [Return]    @{cntr_values}

Count Number of Users
    ${cntr_total} =    UserManagement_Actions.Get Total View Entry
    ${cntr_total} =    roundup    ${cntr_total}
    ${cntr_total} =    Evaluate    ${cntr_total} / 10
    ${total_count} =   Set variable  ${0}
    : FOR    ${INDEX}    IN RANGE    1    ${cntr_total} + 1
    \    UserManagement_Actions.Click Page Index    ${INDEX}
    \    ${user_per_page} =   UserManagement_Actions.Get User Table Row Count
    \    ${total_count} =    Evaluate    ${total_count}+${user_per_page}
    [Return]    ${total_count}

#-------------------- Sorting ---------------------------
Sort Users By Asc
    [Arguments]    ${sort_column}
    log  ${sort_column}
    Run Keyword If    '${sort_column}' != 'Last Name' and '${sort_column}' != 'First Name'   UserManagement_Features.Sort Users By Column    ${sort_column}

Sort Users By Dsc
    [Arguments]    ${sort_column}
    UserManagement_Features.Sort Users By Asc    ${sort_column}

Sort Users By Column
    [Arguments]    ${sort_column}
    # Uniform
    Run Keyword If    '${sort_column}' == 'Last Name'          UserManagement_Actions.Click Last Name Header
    Run Keyword If    '${sort_column}' == 'First Name'         UserManagement_Actions.Click First Name Header
    Run Keyword If    '${sort_column}' == 'Email'              UserManagement_Actions.Click Email Header
    Run Keyword If    '${sort_column}' == 'Date Submitted'     UserManagement_Actions.Click Submitted Date Header

#-------------------- Deactivation  ---------------------------

Perform Deactivate Operation
    [Arguments]    ${decision}
    Run Keyword If    '${decision.upper()}' == 'YES'        UserManagementEditUser_Actions.Click Deactivate User Modal Yes Button
    Run Keyword If    '${decision.upper()}' == 'NO'         UserManagementEditUser_Actions.Click Deactivate User Modal No Button
    Run Keyword If    '${decision.upper()}' == 'CANCEL'     UserManagementEditUser_Actions.Click Deactivate User Modal Close Button




#----------- Approve and Reject User ----------------------
Approve User Request
    UserManagementEditUser_Actions.Click Approve User Button
    Common_Actions.Wait For Loading

Deny User Request
    UserManagementEditUser_Actions.Click Reject User Button
    UserManagementEditUser_Actions.Enter Reject Modal Comment   Sorry
    UserManagementEditUser_Actions.Click Reject Modal Reject Button
    Common_Actions.Wait For Loading


