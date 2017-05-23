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
Alert Notification Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_AlertNotification_Template.Set Template Test Data    ${tc_data}
    # Call User Request Impex If '${impx_ur_update}' == 'True'
    eSRVC_AlertNotification_Template.Call User Request Impex    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}
    # Begin Test
    eSRVC_AlertNotification_Template.Begin Test
    eSRVC_AlertNotification_Template.Login to Front End    ${in_customer_email}    ${in_customer_password}
    # Validate Opt-in/Opt-out
    eSRVC_AlertNotification_Template.Call Validate User Notificaiton Options    ${vp_noti_opt}
    # Unchecked all opt-in
    eSRVC_AlertNotification_Template.Call Unchecked User All Notificaiton Options    ${wf_unchecked_all}
    # Validate no activity in dashboard
    eSRVC_AlertNotification_Template.Call Validate No Activity Message in Dashboard    ${vp_no_activity_db}
    Comment    # Change to User Dafault Mode
    Comment    eSRVC_AlertNotification_Template.Call checked User All Notificaiton Options    ${wf_unchecked_all}
    # Set User Default Roles
    eSRVC_AlertNotification_Template.Call Import Impex User Default Role    ${in_customer_email}    ${wf_default_role}

Set Template Test Data
    [Arguments]    ${tc_data}
    ${testcase_name} =    Pop From Dictionary    ${tc_data}    testcase_name    default=${EMPTY}
    Set Test Variable    ${testcase_name}
    ${testcase_description} =    Pop From Dictionary    ${tc_data}    testcase_description    default=${EMPTY}
    Set Test Variable    ${testcase_description}
    ${impx_ur_update} =    Pop From Dictionary    ${tc_data}    impx_ur_update    default=FALSE
    Set Test Variable    ${impx_ur_update}
    ${impx_ur_account_type} =    Pop From Dictionary    ${tc_data}    impx_ur_account_type    default=${EMPTY}
    Set Test Variable    ${impx_ur_account_type}
    ${impx_sr_update} =    Pop From Dictionary    ${tc_data}    impx_sr_update    default=FALSE
    Set Test Variable    ${impx_sr_update}
    ${impx_sr_requester} =    Pop From Dictionary    ${tc_data}    impx_sr_requester    default=${EMPTY}
    Set Test Variable    ${impx_sr_requester}
    ${impx_sr_soldto} =    Pop From Dictionary    ${tc_data}    impx_sr_soldto    default=${EMPTY}
    Set Test Variable    ${impx_sr_soldto}
    ${impx_sr_creation_time} =    Pop From Dictionary    ${tc_data}    impx_sr_creation_time    default=${EMPTY}
    Set Test Variable    ${impx_sr_creation_time}
    ${impx_sr_pending_status_count} =    Pop From Dictionary    ${tc_data}    impx_sr_pending_status_count    default=${EMPTY}
    Set Test Variable    ${impx_sr_pending_status_count}
    ${impx_sr_rejected_status_count} =    Pop From Dictionary    ${tc_data}    impx_sr_rejected_status_count    default=${EMPTY}
    Set Test Variable    ${impx_sr_rejected_status_count}
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
    Set Test Variable    ${account_number}    0011032731
    Set Test Variable    ${zip_code}    32312-3825    #32312-3818
    ${first_name}=    Catenate    First Name    ${key}
    Set Test Variable    ${first_name}
    ${last_name}    Catenate    Last Name    ${key}
    Set Test Variable    ${last_name}
    ${email}=    Catenate    SEPARATOR=    Dev    ${key}    @test.com
    Set Test Variable    ${email}
    Set Test Variable    ${phone_number}    514-123-4567
    Set Test Variable    ${reg_msg}    Your self-registration request has been submitted. An administrator will review your registration soon
    # Validate activity Log
    ${vp_activity_type}=    Pop From Dictionary    ${tc_data}    vp_activity_type    default=${EMPTY}
    Set Test Variable    ${vp_activity_type}
    ${ip_activity_ur}=    Pop From Dictionary    ${tc_data}    ip_activity_ur    default=${EMPTY}
    Set Test Variable    ${ip_activity_ur}

Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${in_customer_email}    ${in_customer_password}
    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

Call User Request Impex
    [Arguments]    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}
    Run Keyword If    '${impx_ur_update}' == 'TRUE' or '${impx_ur_update}' == '1'    Impex_Keywords.Import Impex User Role for Notification    ${in_customer_email}    ${impx_ur_account_type}

Call Navigate to Notification Preferances
    [Arguments]    ${wf_nav_my_acc_noti}
    ${wf_nav_my_acc_noti}=    Convert To Lowercase    ${wf_nav_my_acc_noti}
    Run Keyword If    '${wf_nav_my_acc_noti}'=='yes'    MyAccount_Keywords.Navigate to Notification Preferances

Call Validate User Notificaiton Options
    [Arguments]    ${vp_noti_opt}
    MyAccount_Keywords.Navigate to Notification Preferances
    ${vp_noti_opt}=    Convert To Lowercase    ${vp_noti_opt}
    Run Keyword If    '${vp_noti_opt}'=='yes'    AlertNotification_Validation.Validate User Notificaiton Options    ${impx_ur_account_type}

Call Unchecked User All Notificaiton Options
    [Arguments]    ${wf_unchecked_all}
    ${wf_unchecked_all}=    Convert To Lowercase    ${wf_unchecked_all}
    Run Keyword If    '${wf_unchecked_all}'=='yes'    MyAccount_Keywords.Navigate to Notification Preferances
    Run Keyword If    '${wf_unchecked_all}'=='yes'    MyAccount_Keywords.Unchecked User All Notificaiton Options    ${impx_ur_account_type}

Call Import Impex User Default Role
    [Arguments]    ${in_customer_email}    ${wf_default_role}
    ${wf_default_role}=    Convert To Lowercase    ${wf_default_role}
    Run Keyword If    '${wf_default_role}'!='${EMPTY}' or '${wf_default_role}'=='no'    Impex_Keywords.Import Impex User Default Role    ${in_customer_email}    ${wf_default_role}

Call Validate No Activity Message in Dashboard
    [Arguments]    ${vp_no_activity_db}
    ${vp_no_activity_db}=    Convert To Lowercase    ${vp_no_activity_db}
    Run Keyword And Continue On Failure    Run Keyword If    '${vp_no_activity_db}'=='yes'    AlertNotification_Validation.Validate No Activity Message in Dashboard or Register
    Run Keyword If    '${vp_no_activity_db}'=='yes'    MyAccount_Keywords.Navigate to Notification Preferances
    Run Keyword If    '${vp_no_activity_db}'=='yes'    MyAccount_Keywords.Checked User All Notificaiton Options    ${impx_ur_account_type}

Call Checked User All Notificaiton Options
    [Arguments]    ${wf_unchecked_all}
    ${wf_unchecked_all}=    Convert To Lowercase    ${wf_unchecked_all}
    Run Keyword If    '${wf_unchecked_all}'=='yes'    MyAccount_Keywords.Navigate to Notification Preferances
    Run Keyword If    '${wf_unchecked_all}'=='yes'    MyAccount_Keywords.Checked User All Notificaiton Options    ${impx_ur_account_type}
