*** Settings ***
Library           Collections
Resource          ../../FunctionalKeywords/MyAccount_Keywords.robot
Resource          ../../PageActions/MyAccount_Actions.robot
Resource          ../../FunctionalKeywords/Login_Keywords.robot
Resource          ../../PageActions/Dashboard_Actions.robot
Resource          ../../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../../../Common/Common_Keywords.robot
Resource          ../../../Common/Impex_Keywords.robot
Resource          ../../PageValidations/AlertNotification_Validation.robot

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Dashboard Alert Notification Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_DashboardAlertNotification_Template.Set Template Test Data    ${tc_data}
    # Call User Request Impex If '${impx_ur_update}' == 'True'
    eSRVC_DashboardAlertNotification_Template.Call User Request Impex    ${impx_ur_update}    ${ip_change_account}    ${impx_ur_account_type}
    # Begin Test
    eSRVC_DashboardAlertNotification_Template.Begin Test
    # Register User
    eSRVC_DashboardAlertNotification_Template.Call Customer Self Registration    ${wf_new_ur_req}
    eSRVC_DashboardAlertNotification_Template.Login to Front End    ${wf_login}    ${in_customer_email}    ${in_customer_password}
    # Create SR and Logout
    eSRVC_DashboardAlertNotification_Template.Call Create Service Request and Logout    ${wf_create_new_sr}
    # Validate Notificaiton components
    eSRVC_DashboardAlertNotification_Template.Call Validate Notification Components in Dashboard Page    ${vp_db_noti_comp}
    # Create SR using dashboard button
    eSRVC_DashboardAlertNotification_Template.Call Create Service Request from Dashboard Page    ${vp_create_sr_dp}
    # update user Name
    eSRVC_DashboardAlertNotification_Template.Call Update User Name    ${wf_update_profile}
    # update user password
    eSRVC_DashboardAlertNotification_Template.Call Update User Password    ${wf_change_pwd}

    # Add user Account (SoldTos)
    eSRVC_DashboardAlertNotification_Template.Call Add User Account  ${wf_add_acc}

    # Remove user Account (SoldTos)
    eSRVC_DashboardAlertNotification_Template.Call Remove User Account  ${wf_rmv_acc}
    # Verify Activity log Message
    eSRVC_DashboardAlertNotification_Template.Call Validate Activity Log    ${vp_activity_type}    ${ip_activity_ur}
    # Valdiate notification description link
    eSRVC_DashboardAlertNotification_Template.Call Validate Notification Description Link From Dashboard Page  ${vp_noti_desc_link}

    # Set User Default Roles
    eSRVC_DashboardAlertNotification_Template.Call Import Impex User Default Role    ${wf_default_role}    ${ip_change_account}

#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${wf_login}    ${in_customer_email}    ${in_customer_password}
    ${wf_login}=    Convert To Lowercase    ${wf_login}
    Run Keyword If    '${wf_login}'=='yes'    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

#------------------------------------------------

Call User Request Impex
    [Arguments]    ${impx_ur_update}    ${ip_change_account}    ${impx_ur_account_type}
    Run Keyword If    '${impx_ur_update}' == 'TRUE' or '${impx_ur_update}' == '1'    Impex_Keywords.Import Impex User multiple Roles    ${ip_change_account}    ${impx_ur_account_type}

Go to Service Requests
    Dashboard_Actions.Click Service Request

Select Requests To View
    [Arguments]    ${wf_requests_to_view}
    ServiceRequest_Keywords.Select Requests To View    ${wf_requests_to_view}

Open Page
    [Arguments]    ${arg1}

Call Import Impex User Default Role
    [Arguments]    ${wf_default_role}    ${ip_change_account}
    ${wf_default_role}=    Convert To Lowercase    ${wf_default_role}
    Run Keyword If    '${wf_default_role}'!='${EMPTY}' or '${wf_default_role}'=='no'    Impex_Keywords.Import Impex User multiple Roles    ${ip_change_account}    ${wf_default_role}
    Comment    Run Keyword If    '${impx_ur_update}' == 'TRUE' or '${impx_ur_update}' == '1'    Impex_Keywords.Import Impex User multiple Roles    ${ip_change_account}    ${impx_ur_account_type}

Call Validate No Activity Message in Dashboard
    [Arguments]    ${vp_no_activity_db}
    ${vp_no_activity_db}=    Convert To Lowercase    ${vp_no_activity_db}
    Run Keyword If    '${vp_no_activity_db}'=='yes'    MyAccount_Validations.Validate No Activity Message in Dashboard

Call Checked User All Notificaiton Options
    [Arguments]    ${wf_unchecked_all}
    MyAccount_Keywords.Navigate to Notification Preferances
    ${wf_unchecked_all}=    Convert To Lowercase    ${wf_unchecked_all}
    Run Keyword If    '${wf_unchecked_all}'=='yes'    MyAccount_Keywords.Checked User All Notificaiton Options    ${impx_ur_account_type}

Call Create Service Request and Logout
    [Arguments]    ${wf_create_new_sr}
    ${wf_create_new_sr}=    Convert To Lowercase    ${wf_create_new_sr}
    Run Keyword If    '${wf_create_new_sr}'=='yes'    ServiceRequest_Keywords.Create Service Request and Logout    Add a Product    Subject: New SR Notification    Details: New SR Notification

Call Customer Self Registration
    [Arguments]    ${wf_new_ur_req}
    ${wf_new_ur_req}=    Convert To Lowercase    ${wf_new_ur_req}
    Run Keyword If    '${wf_new_ur_req}'=='yes'    Login_Keywords.Customer Self Registration    ${account_number}    ${zip_code}    ${first_name}    ${last_name}
    ...    ${email}    ${phone_number}
    Run Keyword If    '${wf_new_ur_req}'=='yes'    page should contain    ${reg_msg}
    Run Keyword If    '${wf_new_ur_req}'=='yes'    Common_Actions.Customer Sign Out


Call Create Service Request from Dashboard Page
    [Arguments]    ${vp_create_sr_dp}
    ${vp_create_sr_dp}=    Convert To Lowercase    ${vp_create_sr_dp}
    Run Keyword If    '${vp_create_sr_dp}'=='yes'    ServiceRequest_Keywords.Create Service Request from Dashboard Page    Product or Service Issue    Subject: Create SR    Description: Create SR

Call Validate Notification Components in Dashboard Page
    [Arguments]    ${vp_db_noti_comp}
    ${vp_db_noti_comp}=    Convert To Lowercase    ${vp_db_noti_comp}
    Run Keyword If    '${vp_db_noti_comp}'=='yes'    AlertNotification_Validation.Validate Notification Components in Dashboard Page

Call Update User Name
    [Arguments]    ${wf_update_profile}
    ${wf_update_profile}=    Convert To Lowercase    ${wf_update_profile}
    Run Keyword If    '${wf_update_profile}'=='yes'    MyAccount_Keywords.Update User Name    ${first_name}    ${last_name}

Call Update User Password
    [Arguments]    ${wf_change_pwd}
    ${wf_change_pwd}=    Convert To Lowercase    ${wf_change_pwd}
    Run Keyword If    '${wf_change_pwd}'=='yes'    MyAccount_Keywords.Update User Password    ${current_password}  ${new_password}  ${confirm_password}

Call Add User Account
    [Arguments]    ${wf_add_acc}
    ${wf_add_acc}=  Convert To Lowercase    ${wf_add_acc}
    Run Keyword If   '${wf_add_acc}'=='yes'   Impex_Keywords.Import Impex To Update Account  ${in_customer_email}   ${in_default_acc}
    Run Keyword If   '${wf_add_acc}'=='yes'   Impex_Keywords.Import Impex To Update Account  ${in_customer_email}   ${in_default_acc},${in_candidate_acc}


Call Remove User Account
    [Arguments]    ${wf_rmv_acc}
    ${wf_rmv_acc}=  Convert To Lowercase    ${wf_rmv_acc}
    Run Keyword If   '${wf_rmv_acc}'=='yes'   Impex_Keywords.Import Impex To Update Account  ${in_customer_email}   ${in_default_acc},${in_candidate_acc}
    Run Keyword If   '${wf_rmv_acc}'=='yes'   Impex_Keywords.Import Impex To Update Account  ${in_customer_email}   ${in_default_acc}

Call Validate Activity Log
    [Arguments]    ${vp_activity_type}    ${ip_activity_ur}
    Run Keyword If    '${vp_activity_type}'=='sr_approver'    AlertNotification_Validation.Validate New SR Activity Log For SR Approver    ${ip_activity_ur}
    Run Keyword If    '${vp_activity_type}'=='ur_approver'    AlertNotification_Validation.Validate New User Request For User Admin    ${ip_activity_ur}
    Run Keyword If    '${vp_activity_type}'=='log_count'    AlertNotification_Validation.Validate Activity Log Count    ${ip_activity_ur}
    Run Keyword If    '${vp_activity_type}'=='h_light_count'    AlertNotification_Validation.Validate Activity highlight Count    ${ip_activity_ur}
    Run Keyword If    '${vp_activity_type}'=='update_profile'    AlertNotification_Validation.Validate Update Pofile Activity Log
    Run Keyword If    '${vp_activity_type}'=='update_password'    AlertNotification_Validation.Validate Update Password Activity Log   ${in_customer_email}   ${in_customer_password}
    Run Keyword If    '${vp_activity_type}'=='add_acc'    AlertNotification_Validation.Validate Added Account Activity Log   ${in_candidate_acc}
    Run Keyword If    '${vp_activity_type}'=='rm_acc'     AlertNotification_Validation.Validate Remove Account Activity Log   ${in_candidate_acc}

Call Validate Notification Description Link From Dashboard Page
    [Arguments]    ${vp_noti_desc_link}
    ${vp_noti_desc_link} =  Convert To Lowercase    ${vp_noti_desc_link}
    Run Keyword If    '${vp_noti_desc_link}'=='yes'  AlertNotification_Validation.Validate Notification Description Link From Dashboard Page  ${exp_part_url}   ${exp_brd_sec_title}

#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Set Template Test Data
    [Arguments]    ${tc_data}
    #********************************************************************************************************
    #****************************** Data Define within this template *****************************************
    #********************************************************************************************************

    # Password information for chagne password
    ${current_password} =  set variable  12341234
    ${new_password} =   set variable  Cintas1234
    ${confirm_password} =   set variable  Cintas1234
    ${in_candidate_acc} =  set variable  0010637132
    Set Test Variable  ${current_password}
    Set Test Variable  ${new_password}
    Set Test Variable  ${confirm_password}
    Set Test Variable  ${in_candidate_acc}

    # Set Customer Registration data
    ${key} =    get_datetime_stamp
    Set Test Variable    ${account_number}    0010637153
    Set Test Variable    ${zip_code}    98105    #4593 VINYARD ST - n/a - 92057-5126 - OCEANSIDE
    ${first_name}=    Catenate    First Name    ${key}
    Set Test Variable    ${first_name}
    ${last_name}    Catenate    Last Name    ${key}
    Set Test Variable    ${last_name}
    ${email}=    Catenate    SEPARATOR=    Dev    ${key}    @test.com
    Set Test Variable    ${email}
    Set Test Variable    ${phone_number}    514-123-4567
    Set Test Variable    ${reg_msg}    Thank you for your registration request. The request is being reviewed by your company’s myCintas account Admin.





    #********************************************************************************************************
    #****************************************   Data Read From Excel ****************************************
    #********************************************************************************************************

    ${testcase_name} =    Pop From Dictionary    ${tc_data}    testcase_name    default=${EMPTY}
    Set Test Variable    ${testcase_name}
    ${testcase_description} =    Pop From Dictionary    ${tc_data}    testcase_description    default=${EMPTY}
    Set Test Variable    ${testcase_description}
    #------------------------------- ImpEx User Update ------------------------------------------
    ${impx_ur_update} =    Pop From Dictionary    ${tc_data}    impx_ur_update    default=FALSE
    Set Test Variable    ${impx_ur_update}
    ${impx_ur_account_type} =    Pop From Dictionary    ${tc_data}    impx_ur_account_type    default=${EMPTY}
    Set Test Variable    ${impx_ur_account_type}
    #
    ${impx_password} =    Pop From Dictionary    ${tc_data}    impx_password    default=${EMPTY}
    Set Test Variable     ${impx_password}
    ${impx_soldTos} =    Pop From Dictionary    ${tc_data}    impx_soldTos    default=${EMPTY}
    Set Test Variable    ${impx_soldTos}
    ${impx_payer} =    Pop From Dictionary    ${tc_data}    impx_payer    default=${EMPTY}
    Set Test Variable    ${impx_payer}
    ${impx_firstname} =    Pop From Dictionary    ${tc_data}    impx_firstname    default=${EMPTY}
    Set Test Variable    ${impx_firstname}
    ${impx_lastname} =    Pop From Dictionary    ${tc_data}    impx_lastname    default=${EMPTY}
    Set Test Variable    ${impx_lastname}
    ${impx_firstlogin} =    Pop From Dictionary    ${tc_data}    impx_firstlogin    default=False
    Set Test Variable    ${impx_firstlogin}
    #---------------------------------------------------------------------------------------------
    ${in_customer_email} =    Pop From Dictionary    ${tc_data}    in_customer_email    default=${EMPTY}
    Set Test Variable    ${in_customer_email}
    ${in_customer_password} =    Pop From Dictionary    ${tc_data}    in_customer_password    default=${EMPTY}
    Set Test Variable    ${in_customer_password}
    #Navigate to My account Notificaiton accordion
    ${wf_nav_my_acc_noti} =    Pop From Dictionary    ${tc_data}    wf_nav_my_acc_noti    default=${EMPTY}
    Set Test Variable    ${wf_nav_my_acc_noti}
    # Check Notification Opt
    ${vp_noti_opt}=    Pop From Dictionary    ${tc_data}    vp_noti_opt    default=${EMPTY}
    Set Test Variable    ${vp_noti_opt}
    #Default Role
    ${wf_default_role}=    Pop From Dictionary    ${tc_data}    wf_default_role    default=${EMPTY}
    Set Test Variable    ${wf_default_role}
    # Unchecked All Option Checkbox
    ${wf_unchecked_all}=    Pop From Dictionary    ${tc_data}    wf_unchecked_all    default=${EMPTY}
    Set Test Variable    ${wf_unchecked_all}
    # verify notification in Dashboard
    ${vp_no_activity_db}    Pop From Dictionary    ${tc_data}    vp_no_activity_db    default=${EMPTY}
    Set Test Variable    ${vp_no_activity_db}
    # Create New SR and Logout
    ${wf_create_new_sr}=    Pop From Dictionary    ${tc_data}    wf_create_new_sr    default=${EMPTY}
    Set Test Variable    ${wf_create_new_sr}
    # Register New SR and Logout
    ${wf_new_ur_req}=    Pop From Dictionary    ${tc_data}    wf_new_ur_req    default=${EMPTY}
    Set Test Variable    ${wf_new_ur_req}

    # Set Customer Registration data
    ${key} =    get_datetime_stamp
    Set Test Variable    ${account_number}    0010637153
    Set Test Variable    ${zip_code}    98105    #4593 VINYARD ST - n/a - 92057-5126 - OCEANSIDE
    ${first_name}=    Catenate    First Name    ${key}
    Set Test Variable    ${first_name}
    ${last_name}    Catenate    Last Name    ${key}
    Set Test Variable    ${last_name}
    ${email}=    Catenate    SEPARATOR=    Dev    ${key}    @test.com
    Set Test Variable    ${email}
    Set Test Variable    ${phone_number}    514-123-4567
    Set Test Variable    ${reg_msg}    Thank you for your registration request. The request is being reviewed by your company’s myCintas account Admin.


    # Validate activity Log
    ${vp_activity_type}=    Pop From Dictionary    ${tc_data}    vp_activity_type    default=${EMPTY}
    Set Test Variable    ${vp_activity_type}
    ${ip_activity_ur}=    Pop From Dictionary    ${tc_data}    ip_activity_ur    default=${EMPTY}
    Set Test Variable    ${ip_activity_ur}
    # login
    ${wf_login}=    Pop From Dictionary    ${tc_data}    wf_login    default=${EMPTY}
    Set Test Variable    ${wf_login}
    # Account Name    ${ip_change_account}
    ${ip_change_account}=    Pop From Dictionary    ${tc_data}    ip_change_account    default=${EMPTY}
    Set Test Variable    ${ip_change_account}
    # Validate Notification coponents
    ${vp_db_noti_comp}=    Pop From Dictionary    ${tc_data}    vp_db_noti_comp    default=${EMPTY}
    Set Test Variable    ${vp_db_noti_comp}
    # validate add sr req button funtional
    ${vp_create_sr_dp}=    Pop From Dictionary    ${tc_data}    vp_create_sr_dp    default=${EMPTY}
    Set Test Variable    ${vp_create_sr_dp}
    # Update Profile
    ${wf_update_profile}=    Pop From Dictionary    ${tc_data}    wf_update_profile    default=${EMPTY}
    Set Test Variable    ${wf_update_profile}

    # Update Password
    ${wf_change_pwd}=    Pop From Dictionary    ${tc_data}    wf_change_pwd    default=${EMPTY}
    Set Test Variable    ${wf_change_pwd}

    # Add Account
    ${wf_add_acc}=    Pop From Dictionary    ${tc_data}    wf_add_acc   default=${EMPTY}
    Set Test Variable    ${wf_add_acc}

    # Remove Account
    ${wf_rmv_acc}=    Pop From Dictionary    ${tc_data}    wf_rmv_acc   default=${EMPTY}
    Set Test Variable    ${wf_rmv_acc}

    # Default Account Number
    ${in_default_acc}=    Pop From Dictionary    ${tc_data}    in_default_acc   default=${EMPTY}
    Set Test Variable    ${in_default_acc}

    # Account that need to be added or deleted
    ${in_candidate_acc}=    Pop From Dictionary    ${tc_data}    in_candidate_acc   default=${EMPTY}
    Set Test Variable    ${in_candidate_acc}


# Validate notification description link

    # Remove Account
    ${vp_noti_desc_link}=    Pop From Dictionary    ${tc_data}    vp_noti_desc_link   default=${EMPTY}
    Set Test Variable    ${vp_noti_desc_link}

    # Default Account Number
    ${exp_part_url}=    Pop From Dictionary    ${tc_data}    exp_part_url   default=${EMPTY}
    Set Test Variable    ${exp_part_url}

    # Account that need to be added or deleted
    ${exp_brd_sec_title}=    Pop From Dictionary    ${tc_data}    exp_brd_sec_title   default=${EMPTY}
    Set Test Variable    ${exp_brd_sec_title}