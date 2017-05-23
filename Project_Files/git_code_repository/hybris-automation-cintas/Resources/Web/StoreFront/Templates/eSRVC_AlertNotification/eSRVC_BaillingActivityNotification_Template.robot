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
Resource          ../../PageValidations/TermsConditions_Validation.robot
Resource          ../../PageValidations/TermsConditions_Validation.robot

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Bailling Activity Notification Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_BaillingActivityNotification_Template.Set Template Test Data    ${tc_data}
    # Call User Request Impex If '${impx_ur_update}' == 'True'
    eSRVC_BaillingActivityNotification_Template.Call Import Impex User multiple Roles and Login Status    ${impx_ur_update}    ${ip_change_account}    ${impx_ur_account_type}    ${impx_first_login}
    # Create Notification through Impex
    Run Keyword If    '${impx_first_login}'=='${False}'    Import Impex Activity Log    ${impx_act_log_code}    ${impx_nf_creation_time}    ${impx_dsc_param}    ${impx_Principal}
    ...    ${impx_url_Param}
    # Begin Test
    eSRVC_BaillingActivityNotification_Template.Begin Test
    # Login to Site
    eSRVC_BaillingActivityNotification_Template.Login to Front End    ${wf_login}    ${in_customer_email}    ${in_customer_password}
    # Validate first time login
    eSRVC_BaillingActivityNotification_Template.Call Validate User First Time Login Term and Conditions    ${vp_first_login}
    # Verify Activity log Message
    eSRVC_BaillingActivityNotification_Template.Call Validate Activity Log    ${vp_activity_type}
    # Delete Notificaiton through Impex
    Run Keyword If    '${impx_first_login}'=='${False}'    Import Impex Remove Activity Log
    [Teardown]    #Import Impex Remove Activity Log


#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Call Import Impex User multiple Roles and Login Status
    [Arguments]    ${impx_ur_update}    ${ip_change_account}    ${impx_ur_account_type}    ${impx_first_login}
    Run Keyword If    '${impx_ur_update}' == 'TRUE' or '${impx_ur_update}' == '1'    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${ip_change_account}    ${impx_ur_account_type}    ${impx_first_login}

Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${wf_login}    ${in_customer_email}    ${in_customer_password}
    ${wf_login}=    Convert To Lowercase    ${wf_login}
    Run Keyword If    '${wf_login}'=='yes'    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

Call Import Impex User Default Role
    [Arguments]    ${wf_default_role}    ${ip_change_account}
    ${wf_default_role}=    Convert To Lowercase    ${wf_default_role}
    Run Keyword If    '${wf_default_role}'!='${EMPTY}' or '${wf_default_role}'=='no'    Impex_Keywords.Import Impex User multiple Roles    ${ip_change_account}    ${wf_default_role}

Call Validate Activity Log
    [Arguments]    ${vp_activity_type}
    # Invoice Submit
    Run Keyword If    '${vp_activity_type}'=='inv_submit'    AlertNotification_Validation.Validate Payment Submission
    # Automatic payment setup
    Run Keyword If    '${vp_activity_type}'=='auto_setup'    AlertNotification_Validation.Validate Automatic Payment Setup
    # Automatic Max Setup
    Run Keyword If    '${vp_activity_type}'=='auto_max'    AlertNotification_Validation.Validate Automatic Max Amount
    # Automatic Processed
    Run Keyword If    '${vp_activity_type}'=='auto_proc'    AlertNotification_Validation.Validate Automatic Payment Processed
    # Pending SR
    Run Keyword If    '${vp_activity_type}'=='pending_sr'    AlertNotification_Validation.Validate Pending SR Activity Log For SR Approver
    # Pending user req
    Run Keyword If    '${vp_activity_type}'=='pending_ur'    AlertNotification_Validation.Validate Pending User Request For User Admin
    ## Activity
    # Invoice Submit
    Run Keyword If    '${vp_activity_type}'=='cnts_garments'    AlertNotification_Validation.Validate Garment Change Having No Approver
    # Automatic payment setup
    Run Keyword If    '${vp_activity_type}'=='appv_garments'    AlertNotification_Validation.Validate Garment Change Having Approver
    # Automatic Max Setup
    Run Keyword If    '${vp_activity_type}'=='cnts_service'    AlertNotification_Validation.Validate Service Change Having No Approver
    # Automatic Processed
    Run Keyword If    '${vp_activity_type}'=='appv_service'    AlertNotification_Validation.Validate Service Change Having Approver

Call Validate User First Time Login Term and Conditions
    [Arguments]    ${vp_first_login}
    ${vp_first_login}=    Convert To Lowercase    ${vp_first_login}
    Run Keyword If    '${vp_first_login}'=='yes'    TermsConditions_Validation.Validate User First Time Login Term and Conditions
#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Set Template Test Data
    [Arguments]    ${tc_data}
    ${testcase_name} =    Pop From Dictionary    ${tc_data}    testcase_name    default=${EMPTY}
    Set Test Variable    ${testcase_name}
    ${testcase_description} =    Pop From Dictionary    ${tc_data}    testcase_description    default=${EMPTY}
    Set Test Variable    ${testcase_description}
    # impex for user update
    ${impx_ur_update} =    Pop From Dictionary    ${tc_data}    impx_ur_update    default=FALSE
    Set Test Variable    ${impx_ur_update}
    ${impx_ur_account_type} =    Pop From Dictionary    ${tc_data}    impx_ur_account_type    default=${EMPTY}
    Set Test Variable    ${impx_ur_account_type}
    ${impx_first_login}=    Pop From Dictionary    ${tc_data}    impx_first_login    #default=${False}
    ${impx_first_login}=    Convert To Lowercase    ${impx_first_login}
    ${impx_first_login}=    Set Variable If    '${impx_first_login}'=='yes'    ${True}    ${False}
    Set Test Variable    ${impx_first_login}
    # Create new Notification
    ${impx_create_nf}=    Pop From Dictionary    ${tc_data}    impx_create_nf
    Set Test Variable    ${impx_create_nf}
    ${impx_act_log_code}=    Pop From Dictionary    ${tc_data}    impx_act_log_code    default=FALSE
    Set Test Variable    ${impx_act_log_code}
    ${impx_nf_creation_time} =    Pop From Dictionary    ${tc_data}    impx_nf_creation_time    default=${EMPTY}
    Set Test Variable    ${impx_nf_creation_time}

    ${impx_dsc_param}=    Pop From Dictionary    ${tc_data}    impx_dsc_param    default=${EMPTY}
    Set Test Variable    ${impx_dsc_param}
    ${impx_Principal}=    Pop From Dictionary    ${tc_data}    impx_Principal    default=${EMPTY}
    Set Test Variable    ${impx_Principal}
    ${impx_url_Param}=    Pop From Dictionary    ${tc_data}    impx_url_Param    default=${EMPTY}
    Set Test Variable    ${impx_url_Param}
    #
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
    # First Login
    ${vp_first_login}=    Pop From Dictionary    ${tc_data}    vp_first_login    default=${EMPTY}
    Set Test Variable    ${vp_first_login}
    # Validation Result
    ${row_number}=    Set Variable    ${1}
    Set Test Variable    ${row_number}