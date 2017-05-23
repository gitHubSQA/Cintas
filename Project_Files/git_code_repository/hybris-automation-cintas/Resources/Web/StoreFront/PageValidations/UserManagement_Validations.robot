*** Settings ***
Library           Collections
Library           DateTime
Library           ../../../../hybris-automation-shared/Libraries/DateUtils.py
Library           ../../../../hybris-automation-shared/Libraries/StringUtils.py
Resource          Common_Validation.robot
Resource          GlobalMessage_Validations.robot
Resource          ServiceRequest_Validations.robot
Resource          ../PageValidations/GlobalMessage_Validations.robot
Resource          ../PageObjects/Header_Page.robot
Resource          ../PageActions/SelectAnAccount_Actions.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../PageActions/ServiceRequest_Actions.robot
Resource          ../PageActions/ServiceRequestDetails_Actions.robot
Resource          ../PageActions/UserManagement_Actions.robot
Resource          ../PageActions/UserManagementAddUser_Actions.robot
Resource          ../PageActions/UserManagementEditUser_Actions.robot
Resource          ../PageActions/Header_Actions.robot
Resource          ../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../FunctionalKeywords/UserManagement_Features.robot

*** Keywords ***
# ------------------------ Valdiation for approval menu (CNTR-68) ---------------------
Validate Approver Menu Access Right
    [Arguments]    ${impx_ur1_acc_type}
    ${el1}=    Header_Page.lnk_OpenApprovals     # sr-approver,user-admin
    ${el2}=    Header_Page.lnk_ApprovalsUserRequests   # sr-approver
    ${el3}=    Header_Page.lnk_ApprovalsServiceRequests  # user-admin
    Run keyword if  '${impx_ur1_acc_type}'=='user-admin' or '${impx_ur1_acc_type}'=='sr-approver' or '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Header_Actions.Click Approvals
    Run keyword if  '${impx_ur1_acc_type}'=='user-admin' or '${impx_ur1_acc_type}'=='sr-approver' or '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Run Keyword And Continue On Failure   Page Should Contain Element  ${el1}
    Run keyword if  '${impx_ur1_acc_type}'=='user-admin' or '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Run Keyword And Continue On Failure   Page Should Contain Element  ${el2}
    Run keyword if  '${impx_ur1_acc_type}'=='sr-approver' or '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Run Keyword And Continue On Failure   Page Should Contain Element  ${el3}
    Run keyword unless  '${impx_ur1_acc_type}'=='user-admin' or '${impx_ur1_acc_type}'=='sr-approver' or '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Run Keyword And Continue On Failure   Page Should not Contain Element  ${el1}

Validate Approval Menu Pending User Request Number
    ${mnu_user_number} =  Header_Actions.Get Pending User Request Number
    Header_Actions.Click Approvals User Requests
    ${page_user_number} =  UserManagement_Actions.Get Total View Entry
    Run Keyword And Continue On Failure  should be equal  ${mnu_user_number}  ${page_user_number}

Validate Approval Menu Pending Service Request Number
    ${mnu_sr_number} =    Header_Actions.Get Pending Servcie Request Number
    Header_Actions.Click Approvals Service Requests
    ${page_sr_number} =    ServiceRequest_Actions.Get Total View Entry
    Run Keyword And Continue On Failure  should be equal  ${mnu_sr_number}  ${page_sr_number}

Validate Approval Menu Total Number
    [Arguments]    ${impx_ur1_acc_type}
    ${mnu_total_number} =  Header_Actions.Get Total Approval Number
    ${mnu_user_number} =  Run keyword if  '${impx_ur1_acc_type}'=='user-admin' or '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Header_Actions.Get Pending User Request Number
    ${mnu_sr_number} =    Run keyword if  '${impx_ur1_acc_type}'=='sr-approver' or '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Header_Actions.Get Pending Servcie Request Number
    ${total_calculated} =  Run keyword if  '${impx_ur1_acc_type}'=='sr-approver,user-admin'   evaluate  ${mnu_user_number}+${mnu_sr_number}
    Run keyword if  '${impx_ur1_acc_type}'=='sr-approver,user-admin'  Run Keyword And Continue On Failure   BuiltIn.Should Be True   ${mnu_total_number}==${total_calculated}
    Run keyword if  '${impx_ur1_acc_type}'=='user-admin'  Run Keyword And Continue On Failure   BuiltIn.Should Be True   ${mnu_total_number}==${mnu_user_number}
    Run keyword if  '${impx_ur1_acc_type}'=='sr-approver'  Run Keyword And Continue On Failure  BuiltIn.Should Be True   ${mnu_total_number}==${mnu_sr_number}


# ------------------------ Valdiation for Add/Edit User -------------
Validate Add User Details Field Error Message
    [Arguments]    ${csv_details}
    @{user_details} =    Split String   ${csv_details}  ;
    ${first_name} =  set variable  @{user_details}[0]
    ${last_name} =   set variable  @{user_details}[1]
    ${email} =       set variable  @{user_details}[2]
    Run Keyword If    '${first_name}' == '${EMPTY}'   run keyword and continue on failure    UserManagement_Validations.Validate User First Name Error Message   First name cannot be empty.
    Run Keyword If    '${last_name}' == '${EMPTY}'   run keyword and continue on failure     UserManagement_Validations.Validate User Last Name Error Message    Last name cannot be empty.
    Run Keyword If    '${email}' == '${EMPTY}'  run keyword and continue on failure       UserManagement_Validations.Validate User Email Error Message   Please enter a valid email.

Validate Add User Roles Error Message
    run keyword and continue on failure    UserManagement_Validations.Validate User Role Error Message   Please Select at least one role.
#--------------
Validate User First Name Error Message
    [Arguments]    ${fn_err_msg}
    ${act_err_msg} =   UserManagementAddUser_Actions.Get First Name Error Message
    run keyword and continue on failure  should be equal  ${fn_err_msg.lower()}  ${act_err_msg.lower()}

Validate User Last Name Error Message
    [Arguments]    ${ln_err_msg}
    ${act_err_msg} =   UserManagementAddUser_Actions.Get Last Name Error Message
    run keyword and continue on failure  should be equal  ${ln_err_msg.lower()}  ${act_err_msg.lower()}

Validate User Email Error Message
    [Arguments]    ${email_err_msg_exp}
    ${act_err_msg} =   UserManagementAddUser_Actions.Get Email Error Message
    run keyword and continue on failure  should be equal  ${email_err_msg_exp.lower()}  ${act_err_msg.lower()}

Validate User Role Error Message
    [Arguments]    ${user_role_err_msg_exp}
    ${act_err_msg} =   UserManagementAddUser_Actions.Get User Role Error Message
    run keyword and continue on failure  should be equal  ${user_role_err_msg_exp.lower()}  ${act_err_msg.lower()}


Valdiate User Account
    [Arguments]    ${csv_acc}
    @{all_acc_list} =   Split String  ${csv_acc}  ;
    :FOR    ${acc}    IN    @{all_acc_list}
    \    ${locator} =  UserManagementEditUser_Page.lbl_UserAccount  ${acc}
    \    run keyword and continue on failure   page should contain element  ${locator}

Valdiate User Udpate Service Request Content
    [Arguments]    ${admin_email}
    ${message_act} =	GlobalMessage_Actions.Get Global Message
    ${sr_number} =  get int from string  ${message_act}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request/detail/${sr_number}
    run keyword and continue on failure  PAGE SHOULD CONTAIN  Request to change accounts for myCintas profile
    run keyword and continue on failure  PAGE SHOULD CONTAIN  User Admin ${admin_email} has updated the sold-to selection for user
    run keyword and continue on failure  PAGE SHOULD CONTAIN  Please make the following changes for this user:
    run keyword and continue on failure  PAGE SHOULD CONTAIN  Add sold to(s):
    run keyword and continue on failure  PAGE SHOULD CONTAIN  Remove sold to(s):

#-------------------------------------------------------------------------------
Validate All User Role Checkbox Optout
    [Documentation]  Roels should be seperated by ;--- Example: "user-admin;contract-editor;contract-viewer;sr-approver;wearer-editor;wearer-viewer;olbp-payer;olbp-viewer;reports"
    # check user roles
    ${csv_all_roles} =  set variable  user-admin;contract-editor;contract-viewer;sr-approver;wearer-editor;wearer-viewer;olbp-payer;olbp-viewer;reports
    @{all_roles_list} =   Split String  ${csv_all_roles}  ;
    :FOR    ${role}    IN    @{all_roles_list}
    \    ${status}=    Execute Javascript    return $("#${role}").prop("checked")
    \    run keyword and continue on failure  should be true  "${status}"=="${false}"


Validate User Detail Fields Empty
    [Documentation]
    ${first_name} =  UserManagementAddUser_Actions.Get User First Name
    ${last_name} =   UserManagementAddUser_Actions.Get User Last Name
    ${email} =  UserManagementAddUser_Actions.Get User Email Address
    run keyword and continue on failure  should be true  "${first_name}" == "${EMPTY}"
    run keyword and continue on failure  should be true  "${last_name}" == "${EMPTY}"
    run keyword and continue on failure  should be true  "${email}" == "${EMPTY}"

Validate Role Selection Logic
    [Arguments]    ${csv_roles}
    [Documentation]  Roels should be seperated by ;--- Example: "user-admin;contract-editor;contract-viewer;sr-approver;wearer-editor;wearer-viewer;olbp-payer;olbp-viewer;reports"
    # check user roles
    ${csv_all_roles} =  set variable  user-admin;contract-editor;contract-viewer;sr-approver;wearer-editor;wearer-viewer;olbp-payer;olbp-viewer;reports
    @{all_roles_list} =   Split String  ${csv_all_roles}  ;
    @{user_roles_list} =    Split String   ${csv_roles}  ;
    :FOR    ${role}    IN    @{user_roles_list}
    \    ${el1} =  set variable if   '${role}'=='contract-editor'    contract-viewer
    \    ${el2} =  set variable if   '${role}'=='wearer-editor'      wearer-viewer
    \    ${el3} =  set variable if   '${role}'=='olbp-payer'         olbp-viewer
    \    Run Keyword unless  "${el1}" == "${None}"  run keyword and continue on failure  element should be enabled  id=${el1}
    \    Run Keyword unless  "${el2}" == "${None}"  run keyword and continue on failure  element should be enabled  id=${el2}
    \    Run Keyword unless  "${el3}" == "${None}"  run keyword and continue on failure  element should be enabled  id=${el3}
    \    ${status}=    Execute Javascript    return $("#${role}").prop("checked")
    \    run keyword unless  ${status}   UserManagementAddUser_Actions.Check User Role  ${role}
    \    Remove Values From List    ${all_roles_list}  ${role}
    \    log  ${all_roles_list}
#    \    ${el1} =  set variable if   '${role}'=='contract-editor'    contract-viewer
#    \    ${el3} =  set variable if   '${role}'=='wearer-editor'      wearer-viewer
#    \    ${el5} =  set variable if   '${role}'=='olbp-payer'         olbp-viewer
    \    Run Keyword unless  "${el1}" == "${None}"  run keyword and continue on failure  element should be disabled  id=${el1}
    \    Run Keyword unless  "${el2}" == "${None}"  run keyword and continue on failure  element should be disabled  id=${el2}
    \    Run Keyword unless  "${el3}" == "${None}"  run keyword and continue on failure  element should be disabled  id=${el3}
    \    Run Keyword unless  "${el1}" == "${None}"  Remove Values From List    ${all_roles_list}  ${el1}
    \    Run Keyword unless  "${el2}" == "${None}"  Remove Values From List    ${all_roles_list}  ${el2}
    \    Run Keyword unless  "${el3}" == "${None}"  Remove Values From List    ${all_roles_list}  ${el3}
    \    log  ${all_roles_list}
     :FOR  ${role}  IN  @{all_roles_list}
    \   run keyword and continue on failure   element should be enabled   id=${role}

Validate User Manage Page Access Right
    [Arguments]    ${impx_user_role}
    log  ${impx_user_role}
    ${page_uri} =  set variable  cintasrentalsstorefront/user-management
    ${error_msg_exp} =  set variable  We're sorry, you do not have the necessary rights to view this page
    ${page_title_exp} =  set variable  myCintas | Manage Users
    # Validate user-admin page access role
    Common_Actions.Open Page    ${page_uri}
    Run keyword if  '${impx_user_role}'=='user-admin'   Run Keyword And Continue On Failure   Title Should Be  ${page_title_exp}
    ...  ELSE  Run Keyword And Continue On Failure    Common_Validation.Validate Global Message    ${error_msg_exp}


Validate Newly Created User
    [Arguments]    ${user_email}
    UserManagement_Features.Filter User  ACTIVE  ${user_email}
    UserManagement_Validations.Validate User Text Search Result  Email  ${user_email}


Validate User Status
    [Arguments]    ${user_status}  ${user_email}
    UserManagement_Features.Filter User  ${user_status.upper()}  ${user_email}
    ${passed} =  run keyword and return status   UserManagement_Validations.Validate User Text Search Result  Email  ${user_email}
    run keyword unless  ${passed}   Page should contain   No results


Validate User Text Search Result
    [Arguments]    ${column_name}   ${search_text}
    @{filter_list} =    UserManagement_Features.Get Users Column All Values    ${column_name}
    @{filter_list_lower} =   convert_list_to_lowercase    ${filter_list}
    ${search_text_lower} =   Convert To Lowercase    ${search_text}
    : FOR    ${sr}    IN    @{filter_list_lower}
    \    run keyword and continue on failure    should contain    ${sr}    ${search_text_lower}    msg=Error - '${sr}' - did not contain text '${search_text_lower}'

Valdiate Active User Information
    [Arguments]    ${first_name_exp}   ${last_name_exp}   ${email_exp}   ${role}
    ${first_name_act} =  UserManagementEditUser_Actions.Get User First Name
    ${last_name_act} =  UserManagementEditUser_Actions.Get User Last Name
    ${email_act} =  UserManagementEditUser_Actions.Get User Email Address
    @{roles_list} =   Split String  ${role}  ,
    # Validation
    run keyword and continue on failure  should be equal  ${first_name_exp.lower()}  ${first_name_act.lower()}
    run keyword and continue on failure  should be equal  ${last_name_exp.lower()}  ${last_name_act.lower()}
    run keyword and continue on failure  should be equal  ${email_exp.lower()}  ${email_act.lower()}
    :FOR    ${role}    IN    @{roles_list}
    \    ${status} =    Execute Javascript    return $("#${role}").prop("checked")
    \    run keyword and continue on failure  should be equal  ${status}  ${TRUE}

#----------------------------------------------

Valdiate User Admin Access Right
    [Documentation]  user admin should NOT have "DEACTIVATE USER" Button and "User Admin" Role checkbox should be disabled. 
    ${locator} =  UserManagementEditUser_Page.btn_DeActivateUser
    run keyword and continue on failure  page should not contain element  ${locator}
    run keyword and continue on failure  element should be disabled  id=user-admin

Valdiate Deactivate Popup Component
    [Documentation]  should have yes and no button and warning msg
    ${locator} =  UserManagementEditUser_Page.dlg_DeActivateUserModal
    run keyword and continue on failure  Element Should Contain  ${locator}  Are you sure you want to deactivate this user?
    ${locator1} =  UserManagementEditUser_Page.btn_DeActivateUserModalYes
    ${locator2} =   UserManagementEditUser_Page.btn_DeActivateUserModalNo
    run keyword and continue on failure  page should contain element  ${locator1}
    run keyword and continue on failure  page should contain element  ${locator2}

Valdiate Pending User Information
#    [Arguments]    ${column_name}   ${search_text}-- TODO



##---------------- Valdiation for Searching and sorting ---------------------

Validate User Filter Components
    ${locator1} =  UserManagement_Page.ddl_SelectStatus
    ${locator2} =  UserManagement_Page.txt_Search
    ${locator3} =  UserManagement_Page.btn_Search
    ${locator4} =  UserManagement_Page.btn_FilterByAccount
    # Valdiation
    run keyword and continue on failure  page should contain element  ${locator1}
    run keyword and continue on failure  page should contain element  ${locator2}
    run keyword and continue on failure  page should contain element  ${locator3}
    run keyword and continue on failure  page should contain element  ${locator4}


Validate User Results View
    ${locator1} =  UserManagement_Page.tbl_HeaderLastName
    ${locator2} =  UserManagement_Page.tbl_HeaderdivFirstName
    ${locator3} =  UserManagement_Page.tbl_HeaderdivEmail
    ${locator4} =  UserManagement_Page.tbl_HeaderdivSubmitted
    # Valdiation
    run keyword and continue on failure  page should contain element  ${locator1}
    run keyword and continue on failure  page should contain element  ${locator2}
    run keyword and continue on failure  page should contain element  ${locator3}
    run keyword and continue on failure  page should contain element  ${locator4}

Validate User Default Status
    ${status}=  UserManagement_Actions.Get User Selected Status
    run keyword and continue on failure  should be equal  ${status}  Active


Validate User Table Row Click Option
    [Arguments]    ${status}
    ${href_act} =   UserManagement_Actions.Get User Table Row Href By Index  1
    ${href_active_exp} =   set variable   cintasrentalsstorefront/user-management/edit-user
    ${href_pending_exp} =   set variable   cintasrentalsstorefront/user-management/approval
    Run keyword if  '${status.upper()}'=='ACTIVE'  run keyword and continue on failure   should contain  ${href_act}  ${href_active_exp}
    Run keyword if  '${status.upper()}'=='PENDING_APPROVAL'  run keyword and continue on failure   should contain  ${href_act}  ${href_pending_exp}
    Run keyword if  '${status.upper()}'=='INACTIVE' or '${status.upper()}'=='REJECTED'  run keyword and continue on failure   should be equal  ${href_act}  ${None}


Validate User Search Result
    [Arguments]    ${column_name}   ${search_text}
    @{filter_list} =    UserManagement_Features.Get Users Column All Values    ${column_name}
    @{filter_list_lower} =   convert_list_to_lowercase    ${filter_list}
    ${search_text_lower} =   Convert To Lowercase    ${search_text}
    : FOR    ${sr}    IN    @{filter_list_lower}
    \    run keyword and continue on failure    should contain    ${sr}    ${search_text_lower.strip()}    msg=Error - '${sr}' - did not contain text '${search_text_lower}'

Validate User No Record Message
    [Arguments]    ${exp_msg}
    ${act_msg} =  UserManagement_Actions.Get User No Search Result Message
    run keyword and continue on failure  should be equal  ${exp_msg.lower()}  ${act_msg.lower()}

# Facet Filter Clearing
Validate Clear Search Filter Functionality
    [Arguments]    ${search_text}
    ${total_entry} =    UserManagement_Actions.Get Total View Entry
    UserManagement_Features.Search User  ${search_text}
    # Read Facet Filter Text
    ${filter_text} =  UserManagement_Actions.Get User Filter Text
    run keyword and continue on failure  Should Contain   ${search_text.upper()}  ${filter_text.upper()}
    # Read total entry after filtering
    ${total_entry_after_filter} =    UserManagement_Actions.Get Total View Entry
    # Validate Filter Search Result Should be less than or equal to no search result
    run keyword and continue on failure  should be true  ${total_entry} >= ${total_entry_after_filter}
    # Remove Filter by clicking x button
    UserManagement_Actions.Click On Remove Filter Search X Button
    ${total_entry_after_filter_remove} =    UserManagement_Actions.Get Total View Entry
    run keyword and continue on failure  should be true  ${total_entry} == ${total_entry_after_filter_remove}

Validate Pagination
    ${total_entry} =   UserManagement_Actions.Get Total View Entry
    ${cntr_total} =    Evaluate    ${total_entry} / 10
    Run keyword if  ${cntr_total}>0   UserManagement_Validations.Validate Page List Available  ${total_entry}
    Run keyword if  ${cntr_total}==0  UserManagement_Validations.Validate Page List Not Available


Validate Page List Available
    [Arguments]   ${total_entry}
    ${locator1} =    UserManagement_Page.divTopPageList
    ${locator2} =    UserManagement_Page.divBottomPageList
    run keyword and continue on failure  page should contain element  ${locator1}
    run keyword and continue on failure  page should contain element  ${locator2}
    ${count_total} =  UserManagement_Features.Count Number of Users
    run keyword and continue on failure  should be true  ${total_entry}==${count_total}

Validate Page List Not Available
    ${locator1} =    UserManagement_Page.divTopPageList
    ${locator2} =    UserManagement_Page.divBottomPageList
    run keyword and continue on failure  page should not contain element  ${locator1}
    run keyword and continue on failure  page should not contain element  ${locator2}


Validate Total Entry Per Page
    ${cntr_total} =    UserManagement_Actions.Get Total View Entry
    ${cntr_total} =    roundup    ${cntr_total}
    ${cntr_total} =    Evaluate    ${cntr_total} / 10
    ${total_count} =   Set variable  ${0}
    : FOR    ${INDEX}    IN RANGE    1    ${cntr_total} + 1
    \    UserManagement_Actions.Click Page Index    ${INDEX}
    \    ${user_per_page} =   UserManagement_Actions.Get User Table Row Count
    \    Run keyword unless  ${INDEX}==${cntr_total}  run keyword and continue on failure  should be true  ${user_per_page}==10


##********************************* Sorting *************************************************
Validate Sort Asc And Dec For User
    [Arguments]    ${column_name}  ${sort_type}
    run keyword if  '${column_name}'!='Date Submitted' and '${sort_type.upper()}'=='ASC'   UserManagement_Validations.Validate Sort Asc For User   ${column_name}
    run keyword if  '${column_name}'!='Date Submitted' and '${sort_type.upper()}'=='DSC'   UserManagement_Validations.Validate Sort Dsc For User   ${column_name}
    run keyword if  '${column_name}'=='Date Submitted' and '${sort_type.upper()}'=='ASC'   UserManagement_Validations.Validate Date Sort Asc For User  ${column_name}
    run keyword if  '${column_name}'=='Date Submitted' and '${sort_type.upper()}'=='DSC'   UserManagement_Validations.Validate Date Sort Dsc For User  ${column_name}

Validate Sort Asc For User
    [Arguments]    ${column_name}
    Run Keyword If    '${column_name}' != 'Last Name'  UserManagement_Features.Sort Users By Column    ${column_name}
    @{actual_list_asc} =    UserManagement_Features.Get Users Column All Values  ${column_name}
    ${length} =  Get Length   ${actual_list_asc}
    Log Many   @{actual_list_asc}
    # Expected
    ${expected_list_asc} =    Copy list    ${actual_list_asc}
    Sort list    ${expected_list_asc}
    Log Many   @{expected_list_asc}
    run keyword and continue on failure    Lists should be equal    ${expected_list_asc}    ${actual_list_asc}

Validate Sort Dsc For User
    [Arguments]    ${column_name}
    Run Keyword If    '${column_name}' != 'Last Name'   UserManagement_Features.Sort Users By Column    ${column_name}
    UserManagement_Features.Sort Users By Column    ${column_name}
    @{actual_list_dsc} =    UserManagement_Features.Get Users Column All Values   ${column_name}
    Log Many     @{actual_list_dsc}
    # Expected
    ${expected_list_dsc} =    Copy list    ${actual_list_dsc}
    Sort list    ${expected_list_dsc}
    Reverse List    ${expected_list_dsc}
    Log Many   @{expected_list_dsc}
    run keyword and continue on failure    Lists should be equal    ${expected_list_dsc}    ${actual_list_dsc}


Validate Date Sort Asc For User
    [Arguments]    ${column_name}
    Run Keyword If    '${column_name}' != 'Last Name'  UserManagement_Features.Sort Users By Column    ${column_name}
    @{actual_list_asc} =    UserManagement_Features.Get Users Column All Values  ${column_name}
    ${length} =  Get Length   ${actual_list_asc}
    Log Many   @{actual_list_asc}
    # Expected
    @{sorted_sr_list_asc} =    Copy list    ${actual_list_asc}
    ${sorted_sr_list_asc} =    sort_date_list    ${sorted_sr_list_asc}    %m/%d/%Y
    Log Many  @{sorted_sr_list_asc}
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_asc}    ${actual_list_asc}



Validate Date Sort Dsc For User
    [Arguments]    ${column_name}
    Run Keyword If    '${column_name}' != 'Last Name'  UserManagement_Features.Sort Users By Column    ${column_name}
    UserManagement_Features.Sort Users By Column    ${column_name}
    @{actual_list_asc} =    UserManagement_Features.Get Users Column All Values  ${column_name}
    ${length} =  Get Length   ${actual_list_asc}
    Log Many   @{actual_list_asc}
    # Expected
    @{sorted_sr_list_asc} =    Copy list    ${actual_list_asc}
    ${sorted_sr_list_asc} =    sort_date_list    ${sorted_sr_list_asc}    %m/%d/%Y
    Log Many  @{sorted_sr_list_asc}
    Reverse List  ${sorted_sr_list_asc}
    Log Many  @{sorted_sr_list_asc}
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_asc}    ${actual_list_asc}






#Validate Sort Dsc For User
#    [Arguments]    ${column_name}
#    @{actual_list} =    UserManagement_Features.Get Users Column All Values    ${column_name}
#    ${length} =  Get Length   ${actual_list}
#    ${url} =  get location
#    Selenium2Library.Go To  ${url}
#    Log Many   @{actual_list}
#    UserManagement_Features.Sort Users By Asc   ${column_name}
#    UserManagement_Features.Sort Users By Asc   ${column_name}
##    UserManagement_Features.Sort Users By Dsc    ${column_name}
#    @{actual_list_asc} =    UserManagement_Features.Get Users Column All Values  ${column_name}
#    ${length} =  Get Length   ${actual_list_asc}
#    Log Many   @{actual_list_asc}
#    ${expected_list_asc} =    Copy list    ${actual_list}
#    ${length} =  Get Length   ${expected_list_asc}
#    Log Many   @{expected_list_asc}
#    Sort list    ${expected_list_asc}
#    ${length} =  Get Length   ${expected_list_asc}
#    Log Many     @{expected_list_asc}
#    run keyword and continue on failure    Lists should be equal    ${expected_list_asc}    ${actual_list_asc}


#Validate Sort Asc And Dec For User
#    [Arguments]    ${column_name}
#    @{actual_list} =    UserManagement_Features.Get Users Column All Values    ${column_name}
#    ${length} =  Get Length   ${actual_list}
#    ${url} =  get location
#    Selenium2Library.Go To  ${url}
#    Log Many   @{actual_list}
##    Common_Actions.Refresh page
##    pause execution
##    execute javascript  window.location.reload(true)
#    UserManagement_Features.Sort Users By Asc   ${column_name}
##    sleep  10s
#    @{actual_list_asc} =    UserManagement_Features.Get Users Column All Values  ${column_name}
#    ${length} =  Get Length   ${actual_list_asc}
#    Log Many   @{actual_list_asc}
#    ${expected_list_asc} =    Copy list    ${actual_list}
#    ${length} =  Get Length   ${expected_list_asc}
#    Log Many   @{expected_list_asc}
#    Sort list    ${expected_list_asc}
#    ${length} =  Get Length   ${expected_list_asc}
#    Log Many     @{expected_list_asc}
#    run keyword and continue on failure    Lists should be equal    ${expected_list_asc}    ${actual_list_asc}
#    # Click Search to return to page 1
#    ${url} =  get location
#    Selenium2Library.Go To  ${url}
#    UserManagement_Features.Sort Users By Dsc    ${column_name}
#    @{actual_list_dsc} =    UserManagement_Features.Get Users Column All Values   ${column_name}
#    @{expected_list_dsc} =    Copy list    ${actual_list}
#    Sort list    ${expected_list_dsc}
#    Reverse List    ${expected_list_dsc}
#    Log Many     @{expected_list_dsc}
#    run keyword and continue on failure    Lists should be equal    ${expected_list_dsc}    ${actual_list_dsc}


Validate MST and CST Optin Optout
    [Arguments]    ${csv_cst}
    @{csv_cst_list} =    Split String   ${csv_cst}  ;
    ${mst}   set variable  @{csv_cst_list}[0]
        UserManagementAddUser_Actions.Click Select Account Button
    # OptIn Valdiation-1
    SelectAnAccount_Actions.Check MST Checkbox   ${mst}
    :FOR    ${cst}    IN    @{csv_cst_list}
     \    Log    ${cst}
     \    ${locator} =    SelectAnAccount_Page.chk_CSTCheckbox1  ${cst}
     \    run keyword and continue on failure   Checkbox Should Be Selected  ${locator}
    # OptOut Valdiation-1
    SelectAnAccount_Actions.Check MST Checkbox   ${mst}
    :FOR    ${cst}    IN    @{csv_cst_list}
     \    Log    ${cst}
     \    ${locator} =    SelectAnAccount_Page.chk_CSTCheckbox1  ${cst}
     \    run keyword and continue on failure   Checkbox Should Not Be Selected  ${locator}
    # OptOut Valdiation-2
     :FOR    ${cst}    IN    @{csv_cst_list}
     \    Log    ${cst}
     \    SelectAnAccount_Actions.Check CST Checkbox   ${cst}
     \    ${locator} =    SelectAnAccount_Page.chk_MSTCheckbox1  ${mst}
     \    run keyword and continue on failure   Checkbox Should Not Be Selected  ${locator}
     \    SelectAnAccount_Actions.Check CST Checkbox   ${cst}
     # OptIn Valdiation-2
     :FOR    ${cst}    IN    @{csv_cst_list}
     \    Log    ${cst}
     \    SelectAnAccount_Actions.Check CST Checkbox   ${cst}
    ${locator} =    SelectAnAccount_Page.chk_MSTCheckbox1  ${mst}
    run keyword and continue on failure   Checkbox Should Be Selected  ${locator}
    SelectAnAccount_Actions.Click Select









Check MST Checkbox
    [Arguments]    ${mst}

    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    click element  ${locator}

Check CST Checkbox
    [Arguments]    ${cst}
    ${locator} =    SelectAnAccount_Page.chk_CSTCheckbox  ${cst}