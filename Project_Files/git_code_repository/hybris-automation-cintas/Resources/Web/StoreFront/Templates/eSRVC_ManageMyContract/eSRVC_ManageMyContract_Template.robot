*** Settings ***
Library           Collections
Library           FakerLibrary
Library           String
Resource          ../../FunctionalKeywords/Login_Keywords.robot
Resource          ../../FunctionalKeywords/ManageMyContract_Keywords.robot
Resource          ../../PageActions/Dashboard_Actions.robot
Resource          ../../PageActions/MyServiceContractGarments_Actions.robot
Resource          ../../PageActions/MyServicesContract_Actions.robot
Resource          ../../PageActions/PDP_Actions.robot
Resource          ../../PageActions/PLP_Actions.robot
Resource          ../../PageValidations/ServiceRequest_Validations.robot
Resource          ../../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../../../Common/Common_Keywords.robot
Resource          ../../../Common/Impex_Keywords.robot
Resource          ../../PageValidations/CreateNewRequest_Validations.robot
Resource          ../../PageValidations/ManageMyContract_Validation.robot
Resource          ../../PageValidations/AlertNotification_Validation.robot
*** Variables ***
#************************** Common Variables ******************************
${comment255char}   Start255 Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata End255.

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Manage My Contract Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_ManageMyContract_Template.Set Template Test Data    ${tc_data}
    # change user1 role
    eSRVC_ManageMyContract_Template.Call User1 Request Impex    ${impx_ur1_update}    ${in_ur1_email}    ${impx_ur1_acc_type}    ${impx_first_login}
    # change user2 role
    eSRVC_ManageMyContract_Template.Call User2 Request Impex    ${impx_ur2_update}    ${in_ur2_email}    ${impx_ur2_acc_type}    ${impx_first_login}
    #----Impex_Keywords.Import Impex Activity Log    ${impx_act_log_code}    ${impx_nf_creation_time}    ${in_acc_number}   ${in_ur1_email}  ${impx_url_Param}

    # Impex For Removing Activity Log Usig Principal
    run keyword and ignore error  Impex_Keywords.Import Impex For Removing Activity Log Usig Principal  ${in_acc_number}

    # Begin Test
    eSRVC_ManageMyContract_Template.Begin Test

    # Login to Front End
    eSRVC_ManageMyContract_Template.Login to Front End    ${in_ur1_email}    ${in_customer_password}

    # Valdiate Manage My Servie Page access right
    eSRVC_ManageMyContract_Template.Call Validate My Contract page Access Right  ${vp_mng_contract_acc_rt}

    # Navigate to My Servie page
    eSRVC_ManageMyContract_Template.Call Navigate to My Service Page  ${wf_goto_my_service}

    # Select account
    eSRVC_ManageMyContract_Template.Call Select An Account By MST  ${wf_select_account}

    # Select Service type
    eSRVC_ManageMyContract_Template.Call Select Servcie    ${wf_service_to_view}

    # Search and open Contract------------------
    eSRVC_ManageMyContract_Template.Call Search and Open Contract  ${wf_open_contract}

    # Valdiate button and other compoent based on roels in employee garments page
    eSRVC_ManageMyContract_Template.Call Validate Employee Garments Page Components Access Right  ${vp_con_grm_access_rt}

    # Remove Employee in Employee Garment Page.
    eSRVC_ManageMyContract_Template.Call Remove Unifrom Wearer  ${wf_emp_rem}

    # Remove Garment in Employee Garment page
    eSRVC_ManageMyContract_Template.Call Remove Product By Clicking X Button  ${wf_rem_garment}


#******************************************************************
    # Click on Add Product Button
    eSRVC_ManageMyContract_Template.Call Click On Add Uniform or Product Button  ${wf_clk_add_pd}

    # Add Uniform or Product Information
    eSRVC_ManageMyContract_Template.Call Add Uniform or Product  ${wf_add}

    # Click on Change Button of an item
    eSRVC_ManageMyContract_Template.Call Change Uniform or Product Atrributes  ${wf_change_uniform}

    # Click View Button of an item
    eSRVC_ManageMyContract_Template.Call View Uniform or Product Atrributes  ${wf_view_uniform}

    # Validate Change Account
    eSRVC_ManageMyContract_Template.Call Validate Change Account For Contract  ${vp_acc_change}

    # Update Uniform or Product Information
    eSRVC_ManageMyContract_Template.Call Update Uniform or Product  ${wf_update}

    # Remove Uniform or Product Information
    eSRVC_ManageMyContract_Template.Call Remove Uniform or Product  ${wf_rmv_prod}

####*************************************************************************************
    # Validate Product selected valueS/ATTRIBUTES in PDP
    eSRVC_ManageMyContract_Template.Call Validate Product Attributes In PDP  ${vp_product_att}

    # Validate PDP componets for different roles
    eSRVC_ManageMyContract_Template.Call Validate PDP Components Access Right  ${vp_pdp_com_access_rt}

    # Validate the global message for garment/facility/wearer update/remove/adding
    eSRVC_ManageMyContract_Template.Call Validate Change Contract Global Message  ${vp_contract_global_msg}

    # Validate REQUESTER NOTIFICATION for garment/facility/wearer update/remove/adding
    eSRVC_ManageMyContract_Template.Call Validate Requester Manage My Contract Notification  ${vp_req_noti_bf_app}

    # Valdiate Cintas notification description link
    eSRVC_ManageMyContract_Template.Call Validate Notification Cintas Description Link From Dashboard Page  ${vp_cintas_noti_desc_link}

    # Validate Pending SR Details # TODO SR Details
    eSRVC_ManageMyContract_Template.Call Validate Pending Service Request Detail Values  ${vp_pending_sr_details}

    # Validate In-Progress SR Details # TODO SR Details
    eSRVC_ManageMyContract_Template.Call Validate In-progress Service Request Detail Values  ${vp_in_progress_sr_details}

    # Validate Approver NOTIFICATION for garment/facility/wearer update/remove/adding
    eSRVC_ManageMyContract_Template.Call Validate Approver Manage My Contract Notification  ${vp_app_noti_bf_app}

    # Valdiate Cintas notification description link
    eSRVC_ManageMyContract_Template.Call Validate Notification Approver Description Link From Dashboard Page   ${vp_app_noti_desc_link}

    # Approve or Reject SR Requested by Contract/Wearer Editor.
    eSRVC_ManageMyContract_Template.Call Service Request Reply For Manage My Contract  ${wf_sr_resp_confim}

    # Validate Requester Approved Notification--Should have 2 notification
    eSRVC_ManageMyContract_Template.Call Validate Requester Notification After Approved  ${vp_req_noti1_af_app}  ${vp_req_noti2_af_app}

#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Call User1 Request Impex
    [Arguments]    ${impx_ur1_update}    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}
    ${impx_ur1_update}=    Convert To Lowercase    ${impx_ur1_update}
    Run Keyword If    '${impx_ur1_update}' == 'yes'    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}

Call User2 Request Impex
    [Arguments]    ${impx_ur2_update}    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}
    ${impx_ur1_update}=    Convert To Lowercase    ${impx_ur1_update}
    Run Keyword If    '${impx_ur2_update}' == 'yes'    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}

Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${in_customer_email}    ${in_customer_password}
    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

Call Validate My Contract page Access Right
    [Arguments]      ${vp_mng_contract_acc_rt}
    Run Keyword If    '${vp_mng_contract_acc_rt}' == 'yes'    ManageMyContract_Validation.Validate My Contract Page Access Right   ${impx_ur1_acc_type}

Call Navigate to My Service Page
    [Arguments]      ${wf_goto_my_service}
    Run Keyword If    '${wf_goto_my_service}' == 'yes'    ManageMyContract_Keywords.Navigate to My Service


Call Select An Account By MST
    [Arguments]      ${wf_select_account}
    Run Keyword If    '${wf_select_account}' == 'yes'   ManageMyContract_Keywords.Select An Account By MST  ${in_acc_number}    ${EMPTY}    ${in_acc_number}

Call Select Servcie
    [Arguments]      ${wf_service_to_view}
    Run Keyword If  '${wf_service_to_view}' == 'yes'  ManageMyContract_Keywords.Select Services  ${in_service_tile}

Call Search and Open Contract
    [Arguments]      ${wf_open_contract}
    Run Keyword If    '${wf_open_contract}' == 'yes' and '${in_service_tile}' == 'UNIFORM'   ManageMyContract_Keywords.Search And Open Contract  ${in_filter_text}
    Run Keyword If    '${wf_open_contract}' == 'yes' and '${in_service_tile}' == 'FACILITY'   MyServicesContract_Actions.Click My Service Table Row By Index  ${in_filter_text}

Call Validate Employee Garments Page Components Access Right
    [Arguments]    ${vp_con_grm_access_rt}
    Run Keyword If    '${vp_con_grm_access_rt}' == 'yes'  ManageMyContract_Validation.Validate Employee Garments Page Components Access Right  ${impx_ur1_acc_type}

Call Remove Unifrom Wearer
    [Arguments]    ${wf_emp_rem}
    Run Keyword If    '${wf_emp_rem}' == 'yes'  ManageMyContract_Keywords.Remove Unifrom Wearer

Call Remove Product By Clicking X Button
    [Arguments]    ${wf_rem_garment}
    Run Keyword If    '${wf_rem_garment}' == 'yes'  ManageMyContract_Keywords.Remove Product By Clicking X Button  ${in_uni_index}

Call Click On Add Uniform or Product Button
    [Arguments]      ${wf_clk_add_pd}
    Run Keyword If   '${wf_clk_add_pd}' == 'yes'   ManageMyContract_Keywords.Click On Add Uniform or Product Button  ${in_service_tile}


Call Change Uniform or Product Atrributes
    [Arguments]      ${wf_change_attributes}
    Run Keyword If   '${wf_change_attributes}' == 'yes'   ManageMyContract_Keywords.Change Uniform or Product Atrributes  ${in_uni_index}

Call View Uniform or Product Atrributes
    [Arguments]      ${wf_view_uniform}
    Run Keyword If   '${wf_view_uniform}' == 'yes'   ManageMyContract_Keywords.View Uniform or Product Atrributes  ${in_uni_index}


Call Validate Change Account For Contract
    [Arguments]      ${vp_acc_change}
    Run Keyword If   '${vp_acc_change}' == 'yes'   ManageMyContract_Validation.Validate Change Account For Contract  ${in_pg_location}   ${in_acc_info}


Call Add Uniform or Product
    [Arguments]      ${wf_add}
    Run Keyword If    '${wf_add}' == 'yes' and '${in_swatch_value}' == 'desc'  ManageMyContract_Keywords.Add Uniform Or Product By Attributes Description  ${service_to_view}  ${in_fs_cst}  ${in_product}  ${in_color}  ${in_fit}  ${in_size}  ${in_sleeve}  ${in_trim}  ${in_qty}  ${in_comment}
    Run Keyword If    '${wf_add}' == 'yes' and '${in_swatch_value}' == 'id'  ManageMyContract_Keywords.Add Uniform Or Product By Attributes ID  ${service_to_view}  ${in_fs_cst}  ${in_product}  ${in_color}  ${in_fit}  ${in_size}  ${in_sleeve}  ${in_trim}  ${in_qty}  ${in_comment}


Call Update Uniform or Product
    [Arguments]      ${wf_update}
    Run Keyword If    '${wf_update}' == 'yes' and '${in_swatch_value}' == 'desc'  ManageMyContract_Keywords.Update Uniform Or Product By Attributes Description  ${in_color}  ${in_fit}  ${in_size}  ${in_sleeve}  ${in_trim}  ${in_qty}  ${in_comment}
    Run Keyword If    '${wf_update}' == 'yes' and '${in_swatch_value}' == 'id'  ManageMyContract_Keywords.Update Uniform Or Product By Attributes ID  ${in_color}  ${in_fit}  ${in_size}  ${in_sleeve}  ${in_trim}  ${in_qty}  ${in_comment}

Call Remove Uniform or Product
    [Arguments]      ${wf_rmv_prod}
    Run Keyword If    '${wf_rmv_prod}' == 'yes'  ManageMyContract_Keywords.Remove Uniform or Product  ${in_comment}

#######****************************************************
Call Validate Product Attributes In PDP
    [Arguments]   ${vp_product_att}
    Run Keyword If    '${vp_product_att}' == 'yes'  ManageMyContract_Validation.Validate Product Attributes In PDP   ${product_name}  ${product_color}  ${product_fit}  ${product_size1}  ${product_size2}  ${product_qty}

Call Validate PDP Components Access Right
    [Arguments]   ${vp_pdp_com_access_rt}
    Run Keyword If    '${vp_pdp_com_access_rt}' == 'yes'  ManageMyContract_Validation.Validate PDP Components Access Right  ${impx_ur1_acc_type}  ${in_service_tile}  ${wf_add}


Call Validate Change Contract Global Message
    [Arguments]      ${vp_contract_global_msg}
    Run Keyword If    '${vp_contract_global_msg}' == 'yes'  GlobalMessage_Validations.Validate Message Contains  ${in_contract_global_msg}

Call Validate Requester Manage My Contract Notification
    [Arguments]      ${vp_req_noti_bf_app}
    ${row_number}=     Run Keyword If    '${vp_req_noti_bf_app}' == 'yes'   set variable  1
    Run Keyword If    '${vp_req_noti_bf_app}' == 'yes'  Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    Run Keyword If    '${vp_req_noti_bf_app}' == 'yes'  AlertNotification_Validation.Validate Manage My Contract Notification  ${row_number}  ${in_req_noti_desc_bf_app}

Call Validate Notification Cintas Description Link From Dashboard Page
    [Arguments]    ${vp_cintas_noti_desc_link}
    ${vp_cintas_noti_desc_link} =  Convert To Lowercase    ${vp_cintas_noti_desc_link}
    Run Keyword If    '${vp_cintas_noti_desc_link}'=='yes'  AlertNotification_Validation.Validate Notification Description Link From Dashboard Page  ${exp_cintas_part_url}   ${exp_cintas_brd_sec_title}


Call Validate In-progress Service Request Detail Values
    [Arguments]      ${vp_in_progress_sr_details}
    ${row_number}=     Run Keyword If    '${vp_in_progress_sr_details}' == 'yes'  set variable  1
    Run Keyword If    '${vp_in_progress_sr_details}' == 'yes'  ServiceRequest_Keywords.Select And Open Inprogress SR
    Run Keyword If    '${vp_in_progress_sr_details}' == 'yes'  ServiceRequest_Validations.Validate Common Service Request Detail Values   ${in_last_name}  ${in_first_name}  ${in_Email}  ${in_status}  ${in_msg_ctg}  ${in_details}

Call Validate Pending Service Request Detail Values
    [Arguments]      ${vp_pending_sr_details}
    ${row_number}=     Run Keyword If    '${vp_pending_sr_details}' == 'yes'   set variable  1
    Run Keyword If    '${vp_pending_sr_details}' == 'yes'  Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    Run Keyword If    '${vp_pending_sr_details}' == 'yes'  Dashboard_Actions.Click High Lighted Notificatiaon Table Row By Index  ${row_number}
    Run Keyword If    '${vp_pending_sr_details}' == 'yes'  ServiceRequest_Validations.Validate Common Service Request Detail Values   ${in_last_name}  ${in_first_name}  ${in_Email}  ${in_status}  ${in_msg_ctg}  ${in_details}

Call Validate Approver Manage My Contract Notification
    [Arguments]      ${vp_app_noti_bf_app}
    ${row_number}=  Run Keyword If    '${vp_app_noti_bf_app}' == 'yes'  set variable  1
    Run Keyword If    '${vp_app_noti_bf_app}' == 'yes'  Common_Actions.Customer Sign Out
    Run Keyword If    '${vp_app_noti_bf_app}' == 'yes'  Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Run Keyword If    '${vp_app_noti_bf_app}' == 'yes'  AlertNotification_Validation.Validate Manage My Contract Notification  ${row_number}  ${in_app_noti_desc_bf_app}


Call Validate Notification Approver Description Link From Dashboard Page
    [Arguments]    ${vp_app_noti_desc_link}
    ${vp_app_noti_desc_link} =  Convert To Lowercase    ${vp_app_noti_desc_link}
    Run Keyword If    '${vp_app_noti_desc_link}'=='yes'  AlertNotification_Validation.Validate Notification Description Link From Dashboard Page  ${exp_app_part_url}   ${exp_app_brd_sec_title}


Call Service Request Reply For Manage My Contract
    [Arguments]      ${wf_sr_resp_confim}
    ${row_number}=     Run Keyword If    '${wf_sr_resp_confim}' == 'yes'   set variable  1
    Run Keyword If    '${wf_sr_resp_confim}' == 'yes'  Dashboard_Actions.Click High Lighted Notificatiaon Table Row By Index  ${row_number}
    Run Keyword If    '${wf_sr_resp_confim}' == 'yes'  ServiceRequest_Keywords.Service Request Reply For Manage My Contract  ${in_sr_resp_confim}
    Run Keyword If    '${wf_sr_resp_confim}' == 'yes'  GlobalMessage_Validations.Validate Message Contains  ${in_app_conf_msg}

Call Validate Requester Notification After Approved
    [Arguments]      ${vp_req_noti1_af_app}  ${vp_req_noti2_af_app}
#    ${row_number1}=  Run Keyword If    '${vp_req_noti1_af_app}' == 'yes' or '${vp_req_noti2_af_app}' == 'yes'  set variable  1
    ${row_number2}=  Run Keyword If    '${vp_req_noti1_af_app}' == 'yes' or '${vp_req_noti2_af_app}' == 'yes'  set variable  2
    ${row_number3}=  Run Keyword If    '${vp_req_noti1_af_app}' == 'yes' or '${vp_req_noti2_af_app}' == 'yes'  set variable  3
    Run Keyword If    '${vp_req_noti1_af_app}' == 'yes' or '${vp_req_noti2_af_app}' == 'yes'  Common_Actions.Customer Sign Out
    Run Keyword If    '${vp_req_noti1_af_app}' == 'yes' or '${vp_req_noti2_af_app}' == 'yes'  Login_Keywords.Login Customer    ${in_ur1_email}    ${in_customer_password}
    Run Keyword If    '${vp_req_noti1_af_app}' == 'yes'  AlertNotification_Validation.Validate Manage My Contract Notification  ${row_number2}  ${in_req_noti1_desc_af_app}
    Run Keyword If    '${vp_req_noti2_af_app}' == 'yes' and '${in_sr_resp_confim}' == 'APPROVE'  AlertNotification_Validation.Validate Manage My Contract Notification  ${row_number3}  ${in_req_noti2_desc_af_app}
    Run Keyword If    '${vp_req_noti2_af_app}' == 'yes' and '${in_sr_resp_confim}' == 'REJECT'  AlertNotification_Validation.Validate Manage My Contract Notification  ${row_number2}  ${in_req_noti2_desc_af_app}


#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Set Template Test Data
    [Arguments]    ${tc_data}

    # Reading Test Case Name and Description.
    ${testcase_name} =    Pop From Dictionary    ${tc_data}    testcase_name    default=${EMPTY}
    should be string   ${testcase_name}
    ${testcase_name} =   Strip String  ${testcase_name}
    Set Test Variable    ${testcase_name}
    ${testcase_description} =    Pop From Dictionary    ${tc_data}    testcase_description    default=${EMPTY}
    Set Test Variable    ${testcase_description}

    # User1
    ${impx_ur1_update}=    Pop From Dictionary    ${tc_data}    impx_ur1_update    default=FALSE
    Set Test Variable    ${impx_ur1_update}
    ${impx_ur1_acc_type}=    Pop From Dictionary    ${tc_data}    impx_ur1_acc_type    default=${EMPTY}
    Set Test Variable    ${impx_ur1_acc_type}
    # user1 E-mail ID
    ${in_ur1_email}=    Pop From Dictionary    ${tc_data}    in_ur1_email    default=${EMPTY}
    Set Test Variable    ${in_ur1_email}

    # user2
    ${impx_ur2_update}=    Pop From Dictionary    ${tc_data}    impx_ur2_update    default=FALSE
    Set Test Variable    ${impx_ur2_update}
    ${impx_ur2_acc_type}=    Pop From Dictionary    ${tc_data}    impx_ur2_acc_type    default=${EMPTY}
    Set Test Variable    ${impx_ur2_acc_type}
    ${in_ur2_email}=    Pop From Dictionary    ${tc_data}    in_ur2_email    default=${EMPTY}
    Set Test Variable    ${in_ur2_email}

    # Password for user1 and user2
    ${in_customer_password} =    Pop From Dictionary    ${tc_data}    in_customer_password    default=${EMPTY}
    Set Test Variable    ${in_customer_password}

    # Valdiate Manage My Servie Page access right
    ${vp_mng_contract_acc_rt}=    Pop From Dictionary    ${tc_data}    vp_mng_contract_acc_rt   default=${EMPTY}
    ${vp_mng_contract_acc_rt}=    Convert To Lowercase    ${vp_mng_contract_acc_rt}
    Set Test Variable    ${vp_mng_contract_acc_rt}

    # Set user login status
    ${impx_first_login}=    Set Variable    ${False}
    Set Test Variable    ${impx_first_login}

    # Goto My Service Page
    ${wf_goto_my_service}=    Pop From Dictionary    ${tc_data}    wf_goto_my_service   default=${EMPTY}
    ${wf_goto_my_service}=    Convert To Lowercase    ${wf_goto_my_service}
    Set Test Variable    ${wf_goto_my_service}

    # Select MST or Account
    ${wf_select_account}=    Pop From Dictionary    ${tc_data}    wf_select_account    default=${EMPTY}
    ${wf_select_account}=    Convert To Lowercase    ${wf_select_account}
    Set Test Variable    ${wf_select_account}
    # Accoutn number
    ${in_acc_number}=    Pop From Dictionary    ${tc_data}    in_acc_number    default=${EMPTY}
    Set Test Variable    ${in_acc_number}

    # Accoutn number
    ${in_access_role}=    Pop From Dictionary    ${tc_data}    in_access_role    default=${EMPTY}
    ${in_access_role} =   Convert To Uppercase   ${in_access_role}
    Set Test Variable    ${in_access_role}

    # Service Type
    ${wf_service_to_view}=    Pop From Dictionary    ${tc_data}    wf_service_to_view   default=${EMPTY}
    ${wf_service_to_view}=  Convert To Lowercase  ${wf_service_to_view}
    Set Test Variable    ${wf_service_to_view}
    # Tiles Type
    ${in_service_tile}=    Pop From Dictionary    ${tc_data}    in_service_tile   default=${EMPTY}
    ${in_service_tile}=  convert to uppercase  ${in_service_tile}
    ${service_to_view}=  set variable  ${in_service_tile}
    Set Test Variable    ${in_service_tile}
    Set Test Variable    ${service_to_view}

    # Open Contract
    ${wf_open_contract}=    Pop From Dictionary    ${tc_data}    wf_open_contract    default=${EMPTY}
    ${wf_open_contract}=    Convert To Lowercase    ${wf_open_contract}
    Set Test Variable    ${wf_open_contract}
    # Search or Filter Text
    ${in_filter_text}=    Pop From Dictionary    ${tc_data}    in_filter_text   default=${EMPTY}
    Set Test Variable    ${in_filter_text}

    # Employee Garment Contract Page--Componet vladiation
    ${vp_con_grm_access_rt}=    Pop From Dictionary    ${tc_data}    vp_con_grm_access_rt    default=${EMPTY}
    ${vp_con_grm_access_rt}=    Convert To Lowercase    ${vp_con_grm_access_rt}
    Set Test Variable    ${vp_con_grm_access_rt}

    # Remove Employee in Employee Garment page should contain
    ${wf_emp_rem}=    Pop From Dictionary    ${tc_data}    wf_emp_rem    default=${EMPTY}
    ${wf_emp_rem}=    Convert To Lowercase    ${wf_emp_rem}
    Set Test Variable    ${wf_emp_rem}


    # Remove Garment from Employee Garment page
    ${wf_rem_garment}=    Pop From Dictionary    ${tc_data}    wf_rem_garment    default=${EMPTY}
    ${wf_rem_garment}=    Convert To Lowercase    ${wf_rem_garment}
    Set Test Variable    ${wf_rem_garment}

#*****************************************************************************
     # Click on Add Product Button
    ${wf_clk_add_pd}=    Pop From Dictionary    ${tc_data}    wf_clk_add_pd   default=${EMPTY}
    ${wf_clk_add_pd}=    Convert To Lowercase    ${wf_clk_add_pd}
    Set Test Variable    ${wf_clk_add_pd}


   # Update Uniform by clicking change button
    ${wf_change_uniform}=    Pop From Dictionary    ${tc_data}    wf_change_uniform    default=${EMPTY}
    ${wf_change_uniform}=    Convert To Lowercase    ${wf_change_uniform}
    Set Test Variable    ${wf_change_uniform}

    # Update Uniform by clicking change button
    ${wf_view_uniform}=    Pop From Dictionary    ${tc_data}    wf_view_uniform   default=${EMPTY}
    ${wf_view_uniform}=    Convert To Lowercase    ${wf_view_uniform}
    Set Test Variable    ${wf_view_uniform}

    # uniform position
    ${in_uni_index}=    Pop From Dictionary    ${tc_data}    in_uni_index   default=${EMPTY}
    Set Test Variable    ${in_uni_index}

    # Valdiate change account options
    ${vp_acc_change}=    Pop From Dictionary    ${tc_data}    vp_acc_change   default=${EMPTY}
    ${vp_acc_change}=    Convert To Lowercase    ${vp_acc_change}
    Set Test Variable    ${vp_acc_change}

    # Valdiate change account options page location
    ${in_pg_location}=    Pop From Dictionary    ${tc_data}    in_pg_location  default=${EMPTY}
    ${in_pg_location}=    convert to uppercase    ${in_pg_location}
    Set Test Variable    ${in_pg_location}

    # Valdiate change account options page location
    ${in_change_acc}=    Pop From Dictionary    ${tc_data}    in_change_acc  default=${EMPTY}
    Set Test Variable    ${in_change_acc}


    # Valdiate change account options page location
    ${in_acc_info}=    Pop From Dictionary    ${tc_data}    in_acc_info  default=${EMPTY}
    Set Test Variable    ${in_acc_info}

    # Add Uniform/Product Information
    ${in_product}=    Pop From Dictionary    ${tc_data}    in_product   default=${EMPTY}
    Set Test Variable    ${in_product}
    # Product Name
    ${wf_add}=    Pop From Dictionary    ${tc_data}    wf_add   default=${EMPTY}
    ${wf_add}=    Convert To Lowercase    ${wf_add}
    Set Test Variable    ${wf_add}
    # Select CST For Facility and Deep
    ${in_fs_cst}=    Pop From Dictionary    ${tc_data}    in_fs_cst   default=${EMPTY}
    Set Test Variable    ${in_fs_cst}

    # Update Uniform/Product Information
    ${wf_update}=    Pop From Dictionary    ${tc_data}    wf_update    default=${EMPTY}
    ${wf_update}=    Convert To Lowercase    ${wf_update}
    Set Test Variable    ${wf_update}
    # Type of Swatch Values
    ${in_swatch_value}=    Pop From Dictionary    ${tc_data}    in_swatch_value    default=${EMPTY}
    ${in_swatch_value}=    Convert To Lowercase    ${in_swatch_value}
    Set Test Variable    ${in_swatch_value}
    # Input for update
    # Color
    ${in_color}=    Pop From Dictionary    ${tc_data}    in_color   default=${EMPTY}
    Set Test Variable   ${in_color}
    # Fit
    ${in_fit}=    Pop From Dictionary    ${tc_data}    in_fit   default=${EMPTY}
    Set Test Variable   ${in_fit}
    # Size
    ${in_size}=    Pop From Dictionary    ${tc_data}    in_size   default=${EMPTY}
    Set Test Variable   ${in_size}
    # Sleeve
    ${in_sleeve}=    Pop From Dictionary    ${tc_data}    in_sleeve   default=${EMPTY}
    Set Test Variable   ${in_sleeve}
    # Trim
    ${in_trim}=    Pop From Dictionary    ${tc_data}    in_trim   default=${EMPTY}
    Set Test Variable   ${in_trim}
    # Quantity
    ${in_qty}=    Pop From Dictionary    ${tc_data}    in_qty   default=${EMPTY}
    Set Test Variable   ${in_qty}

    # Comment for PDP Page
    ${in_comment}=    Pop From Dictionary    ${tc_data}    in_comment  default=${EMPTY}
    ${in_comment}=    Set Variable If  '${in_comment}' == 'comment2500char'  ${comment255char}  ${in_comment}
    Set Test Variable   ${in_comment}

    # Validate Product selected valueS/ATTRIBUTES in PDP
    ${vp_product_att}=    Pop From Dictionary    ${tc_data}    vp_product_att  default=${EMPTY}
    ${vp_product_att}=    Convert To Lowercase    ${vp_product_att}
    Set Test Variable   ${vp_product_att}

    # Validate PDP componets for different roles
    ${vp_pdp_com_access_rt}=    Pop From Dictionary    ${tc_data}    vp_pdp_com_access_rt  default=${EMPTY}
    ${vp_pdp_com_access_rt}=    Convert To Lowercase    ${vp_pdp_com_access_rt}
    Set Test Variable   ${vp_pdp_com_access_rt}

#********************************************************************************************************
    # Remove Uniform or Product
    ${wf_rmv_prod}=    Pop From Dictionary    ${tc_data}    wf_rmv_prod    default=${EMPTY}
    ${wf_rmv_prod}=    Convert To Lowercase    ${wf_rmv_prod}
    Set Test Variable    ${wf_rmv_prod}

    # Check global message
    ${vp_contract_global_msg}=    Pop From Dictionary    ${tc_data}    vp_contract_global_msg   default=${EMPTY}
    ${vp_contract_global_msg}=    Convert To Lowercase    ${vp_contract_global_msg}
    Set Test Variable    ${vp_contract_global_msg}
    # text of global message
    ${in_contract_global_msg}=    Pop From Dictionary    ${tc_data}    in_contract_global_msg   default=${EMPTY}
    ${in_contract_global_msg}=    Convert To Lowercase    ${in_contract_global_msg}
    Set Test Variable    ${in_contract_global_msg}

    # Verify Requester Notification for garment/uniform/deep clean
    ${vp_req_noti_bf_app}=    Pop From Dictionary    ${tc_data}    vp_req_noti_bf_app   default=${EMPTY}
    ${vp_req_noti_bf_app}=  Convert To Lowercase  ${vp_req_noti_bf_app}
    Set Test Variable    ${vp_req_noti_bf_app}


    # Requester Notification message
    ${in_req_noti_desc_bf_app}=    Pop From Dictionary    ${tc_data}    in_req_noti_desc_bf_app   default=${EMPTY}
    Set Test Variable    ${in_req_noti_desc_bf_app}

#---------------------------------------------------------------------------------------------------------------------

    # Remove Account
    ${vp_cintas_noti_desc_link}=    Pop From Dictionary    ${tc_data}    vp_cintas_noti_desc_link   default=${EMPTY}
    ${vp_cintas_noti_desc_link}=    Convert To Lowercase    ${vp_cintas_noti_desc_link}
    Set Test Variable    ${vp_cintas_noti_desc_link}

    # Default Account Number
    ${exp_cintas_part_url}=    Pop From Dictionary    ${tc_data}    exp_cintas_part_url   default=${EMPTY}
    Set Test Variable    ${exp_cintas_part_url}

    # Account that need to be added or deleted
    ${exp_cintas_brd_sec_title}=    Pop From Dictionary    ${tc_data}    exp_cintas_brd_sec_title   default=${EMPTY}
    Set Test Variable    ${exp_cintas_brd_sec_title}


    #********************** SR Details Validation **************
    # Validate Pending Service Request Details
    ${vp_pending_sr_details}=    Pop From Dictionary    ${tc_data}    vp_pending_sr_details   default=${EMPTY}
    ${vp_pending_sr_details}=    Convert To Lowercase    ${vp_pending_sr_details}
    Set Test Variable    ${vp_pending_sr_details}

    # Validate In-progress Service Request Details
    ${vp_in_progress_sr_details}=    Pop From Dictionary    ${tc_data}    vp_in_progress_sr_details   default=${EMPTY}
    ${vp_in_progress_sr_details}=    Convert To Lowercase    ${vp_in_progress_sr_details}
    Set Test Variable    ${vp_in_progress_sr_details}

    # Last Name
    ${in_last_name}=    Pop From Dictionary    ${tc_data}    in_last_name   default=${EMPTY}
    Set Test Variable    ${in_last_name}
    # First Name
    ${in_first_name}=    Pop From Dictionary    ${tc_data}    in_first_name   default=${EMPTY}
    Set Test Variable    ${in_first_name}
    # Email
    ${in_Email}=    Pop From Dictionary    ${tc_data}    in_Email   default=${EMPTY}
    Set Test Variable    ${in_Email}
    # Status
    ${in_status}=    Pop From Dictionary    ${tc_data}    in_status   default=${EMPTY}
    Set Test Variable    ${in_status}

    # Message Category
    ${in_msg_ctg}=    Pop From Dictionary    ${tc_data}    in_msg_ctg   default=${EMPTY}
    Set Test Variable    ${in_msg_ctg}

    # SR Details
    ${in_details}=    Pop From Dictionary    ${tc_data}    in_details   default=${EMPTY}
    ${in_details}=    Set Variable If  '${in_details}' == 'comment2500char'  ${comment255char}  ${in_details}
    @{in_details} =    Split String    ${in_details}  ;
    ${in_details} =    Catenate   SEPARATOR=\n  @{in_details}
    Set Test Variable   ${in_details}

    #---------------------------------------------------
    # Verify Approver Notification for garment/uniform/deep clean
    ${vp_app_noti_bf_app}=   Pop From Dictionary    ${tc_data}    vp_app_noti_bf_app   default=${EMPTY}
    ${vp_app_noti_bf_app}=  Convert To Lowercase  ${vp_app_noti_bf_app}
    Set Test Variable    ${vp_app_noti_bf_app}
    # Approver Notification Message
    ${in_app_noti_desc_bf_app}=    Pop From Dictionary    ${tc_data}    in_app_noti_desc_bf_app   default=${EMPTY}
    Set Test Variable    ${in_app_noti_desc_bf_app}

    # Approved/Reject SR
    ${wf_sr_resp_confim}=   Pop From Dictionary    ${tc_data}    wf_sr_resp_confim   default=${EMPTY}
    ${wf_sr_resp_confim}=  Convert To Lowercase  ${wf_sr_resp_confim}
    Set Test Variable    ${wf_sr_resp_confim}
    # Decision Approved/Reject
    ${in_sr_resp_confim}=    Pop From Dictionary    ${tc_data}    in_sr_resp_confim   default=${EMPTY}
    ${in_sr_resp_confim}=    Convert To Uppercase   ${in_sr_resp_confim}
    Set Test Variable    ${in_sr_resp_confim}
    # Confirmation Message
    ${in_app_conf_msg}=    Pop From Dictionary    ${tc_data}    in_app_conf_msg   default=${EMPTY}
    Set Test Variable    ${in_app_conf_msg}

    # Requester appproved Notification
    # Manage my contract
    ${vp_req_noti1_af_app}=   Pop From Dictionary    ${tc_data}    vp_req_noti1_af_app   default=${EMPTY}
    ${vp_req_noti1_af_app}=  Convert To Lowercase  ${vp_req_noti1_af_app}
    Set Test Variable    ${vp_req_noti1_af_app}
    # Notification-1
    ${in_req_noti1_desc_af_app}=    Pop From Dictionary    ${tc_data}    in_req_noti1_desc_af_app   default=${EMPTY}
    Set Test Variable    ${in_req_noti1_desc_af_app}

    # SR approved
    ${vp_req_noti2_af_app}=   Pop From Dictionary    ${tc_data}    vp_req_noti2_af_app   default=${EMPTY}
    ${vp_req_noti2_af_app}=  Convert To Lowercase  ${vp_req_noti2_af_app}
    Set Test Variable    ${vp_req_noti2_af_app}
    # Notification-2
    ${in_req_noti2_desc_af_app}=    Pop From Dictionary    ${tc_data}    in_req_noti2_desc_af_app   default=${EMPTY}
    Set Test Variable    ${in_req_noti2_desc_af_app}

#===============================================================================================


    # Remove Account
    ${vp_app_noti_desc_link}=    Pop From Dictionary    ${tc_data}    vp_app_noti_desc_link   default=${EMPTY}
    ${vp_app_noti_desc_link}=  Convert To Lowercase  ${vp_app_noti_desc_link}
    Set Test Variable    ${vp_app_noti_desc_link}

    # Default Account Number
    ${exp_app_part_url}=    Pop From Dictionary    ${tc_data}    exp_app_part_url   default=${EMPTY}
    Set Test Variable    ${exp_app_part_url}

    # Account that need to be added or deleted
    ${exp_app_brd_sec_title}=    Pop From Dictionary    ${tc_data}    exp_app_brd_sec_title   default=${EMPTY}
    Set Test Variable    ${exp_app_brd_sec_title}
