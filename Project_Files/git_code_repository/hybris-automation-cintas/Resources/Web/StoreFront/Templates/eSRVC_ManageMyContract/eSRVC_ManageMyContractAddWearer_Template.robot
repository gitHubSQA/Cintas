*** Settings ***
Library           Collections
Library           FakerLibrary
Library           String
Library           DateTime
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

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Manage My Contract Add Wearer Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_ManageMyContractAddWearer_Template.Set Template Test Data    ${tc_data}
    # change user1 role
    eSRVC_ManageMyContractAddWearer_Template.Call User1 Request Impex    ${impx_ur1_update}    ${in_ur1_email}    ${impx_ur1_acc_type}    ${impx_first_login}
    # change user2 role
    eSRVC_ManageMyContractAddWearer_Template.Call User2 Request Impex    ${impx_ur2_update}    ${in_ur2_email}    ${impx_ur2_acc_type}    ${impx_first_login}

    # Impex For Removing Activity Log Usig Principal
    run keyword and ignore error  Impex_Keywords.Import Impex For Removing Activity Log Usig Principal  ${in_acc_number}

    # Begin Test
    eSRVC_ManageMyContractAddWearer_Template.Begin Test

    # Login to Front End
    eSRVC_ManageMyContractAddWearer_Template.Login to Front End    ${in_ur1_email}    ${in_customer_password}

    # Valdiate Manage My Servie Page access right
    eSRVC_ManageMyContractAddWearer_Template.Call Validate My Contract page Access Right  ${vp_mng_contract_acc_rt}

    # Navigate to My Servie page
    eSRVC_ManageMyContractAddWearer_Template.Call Navigate to My Service Page  ${wf_goto_my_service}

    # Select account
    eSRVC_ManageMyContractAddWearer_Template.Call Select An Account By MST  ${wf_select_account}

    # Select Service type
    eSRVC_ManageMyContractAddWearer_Template.Call Select Servcie    ${wf_service_to_view}

     # Manage Garment page
     eSRVC_ManageMyContractAddWearer_Template.Call Validate Contract Garments Page Components Access Right   ${vp_mng_uni_pg_acc_rt}

#****************************************** Searching and sorting  **************************************************************
     # Search with keywords
     eSRVC_ManageMyContractAddWearer_Template.Call Search Wearer or Facility  ${wf_search}

     # Validate the search result
     eSRVC_ManageMyContractAddWearer_Template.Call Validate Wearer or Facility Search Result  ${vp_search_result}

     # Valdiate when no record are available for wearer or facility
     eSRVC_ManageMyContractAddWearer_Template.Call Validate No Record for Wearer or Facility   ${vp_no_search_rslt}

     # Valdiate Clear search Filter
     eSRVC_ManageMyContractAddWearer_Template.Call Validate Clear Search Filter Functionality   ${vp_clear_filter}

     # Validate Sort Result
     eSRVC_ManageMyContractAddWearer_Template.Call Validate Sort Asc And Dec For Wearer or Facility   ${vp_sort}

#************************************ My Services Add Wearer Page  *******************************
    # Click on Add Uniform wearer
     eSRVC_ManageMyContractAddWearer_Template.Call Click On Add Uniform Wearer Button   ${wf_add_wearer}

    #---- Enter mandatory First Name, Last Name and MST/CST.
    eSRVC_ManageMyContractAddWearer_Template.Call Enter Wearer Mandatory Information  ${wf_fill_wr_mandatory_data}

    # Validate mandatory field error msg
    eSRVC_ManageMyContractAddWearer_Template.Call Validate Add Wearer Mandatory Field Error Message  ${vp_mandatory_field}

    #---- Enter Wearer Optional Filed.
    eSRVC_ManageMyContractAddWearer_Template.Call Enter Wearer Optional Information  ${wf_fill_wr_optional_data}

    #--- Click on Continue button from add wearer page
    eSRVC_ManageMyContractAddWearer_Template.Call Click On Continue Button   ${wf_cnt_add_wr_pg}

#******************************************************************
    # validate wearer mandatory session values session
    eSRVC_ManageMyContractAddWearer_Template.Call Validate Wearer Mandatory Field Values Session  ${vp_madatory_sess}

    # validate wearer Name in details page
    eSRVC_ManageMyContractAddWearer_Template.Call Validate Wearer Name In Detail Page   ${vp_wr_name_dtl}

    # Add Uniform or Product Information
    eSRVC_ManageMyContractAddWearer_Template.Call Add Uniform or Product  ${wf_add}

    # Copy Wearer
    eSRVC_ManageMyContractAddWearer_Template.Call Copy From Existing Wearer  ${wf_copy_wearer}

    # Remove Garment in Employee Garment page
    eSRVC_ManageMyContractAddWearer_Template.Call Remove Product By Clicking X Button  ${wf_rem_garment}

    # Click on Change Button of an item
    eSRVC_ManageMyContractAddWearer_Template.Call Change Uniform or Product Atrributes  ${wf_change_uniform}


    # Update Uniform or Product Information
    eSRVC_ManageMyContractAddWearer_Template.Call Update Uniform or Product  ${wf_update}

    # Remove Uniform or Product Information
    eSRVC_ManageMyContractAddWearer_Template.Call Remove Uniform or Product  ${wf_rmv_prod}

    # Valdiate Product in Wearer List Page
    eSRVC_ManageMyContractAddWearer_Template.Call Validate Number Of Wearer Garments List Item   ${vp_pd_in_wr_lst}

    # Valdiate Modification of account during add wearer
     eSRVC_ManageMyContractAddWearer_Template.Call Validate Wearer Modify Account Functionality  ${vp_change_acc_sess}

#*********************************************************************************************
    #--- Click on Continue button from add wearer detail page
    eSRVC_ManageMyContractAddWearer_Template.Call Click On Continue Button from Add Wearer Detail Page   ${wf_cnt_add_wr_dtl_pg}

    # Valdiate wearer name in conformation page
    eSRVC_ManageMyContractAddWearer_Template.Call Validate Wearer Info In Confirmation Page   ${vp_wr_name_cnf}

    #--- Click on submit button  from add wearer confirmation page
    eSRVC_ManageMyContractAddWearer_Template.Call Click On Submit Request Button In Confirmation Page   ${wf_cnt_add_wr_dtl_pg}

####************************************************************************************
    # Validate the global message for garment/facility/wearer update/remove/adding
    eSRVC_ManageMyContractAddWearer_Template.Call Validate Change Contract Global Message  ${vp_contract_global_msg}

    # Validate Pending SR Details # TODO SR Details
    eSRVC_ManageMyContractAddWearer_Template.Call Validate Pending Service Request Detail Values  ${vp_pending_sr_details}

    # Validate In-Progress SR Details # TODO SR Details
    eSRVC_ManageMyContractAddWearer_Template.Call Validate In-progress Service Request Detail Values  ${vp_in_progress_sr_details}


#******************************************************************

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

Call Validate Contract Garments Page Components Access Right
    [Arguments]      ${vp_mng_uni_pg_acc_rt}
    Run Keyword If  '${vp_mng_uni_pg_acc_rt}' == 'yes'  ManageMyContract_Validation.Validate Contract Garments Page Components Access Right   ${impx_ur1_acc_type}

Call Click On Add Uniform Wearer Button
    [Arguments]      ${wf_add_wearer}
    Run Keyword If    '${wf_add_wearer}' == 'yes'  MyServicesContract_Actions.Click On Add Uniform Wearer Button

#****************************************** Searching and sorting  **************************************************************
Call Search Wearer or Facility
    [Arguments]      ${wf_search}
    Run Keyword If    '${wf_search}' == 'yes'  ManageMyContract_Keywords.Search Wearer or Facility    ${in_search_text}

Call Validate Wearer or Facility Search Result
    [Arguments]      ${vp_search_result}
    Run Keyword If    '${vp_search_result}' == 'yes'  ManageMyContract_Validation.Validate Wearer or Facility Search Result  ${in_col_name}   ${in_search_text}   ${in_data_type}


Call Validate No Record for Wearer or Facility
    [Arguments]      ${vp_no_search_rslt}
    Run Keyword If    '${vp_no_search_rslt}' == 'yes'  ManageMyContract_Validation.Validate No Record for Wearer or Facility   ${in_service_tile}


Call Validate Clear Search Filter Functionality
    [Arguments]      ${vp_clear_filter}
        Run Keyword If    '${vp_clear_filter}' == 'yes'  ManageMyContract_Validation.Validate Clear Search Filter Functionality   ${in_search_text}


Call Validate Sort Asc And Dec For Wearer or Facility
    [Arguments]      ${vp_sort}
    Run Keyword If    '${vp_sort}' == 'yes'  ManageMyContract_Validation.Validate Sort Asc And Dec For Wearer or Facility  ${in_col_name}


#************************************ My Services Add Wearer Page  *******************************
Call Enter Wearer Mandatory Information
    [Arguments]      ${wf_fill_wr_mandatory_data}
    Run Keyword If    '${wf_fill_wr_mandatory_data}' == 'yes'   ManageMyContract_Keywords.Enter Wearer Mandatory Information  ${new_wearer_first_name}  ${new_wearer_last_name}   ${in_acc_number}

Call Validate Add Wearer Mandatory Field Error Message
   [Arguments]      ${vp_mandatory_field}
    Run Keyword If    '${vp_mandatory_field}' == 'yes'   ManageMyContract_Validation.Validate Add Wearer Mandatory Field Error Message  ${mf_first_name}  ${mf_last_name}  ${mf_account}


Call Enter Wearer Optional Information
    [Arguments]      ${wf_fill_wr_optional_data}
    Run Keyword If    '${wf_fill_wr_optional_data}' == 'yes'   ManageMyContract_Keywords.Enter Wearer Optional Information   ${account_number}  ${email}  ${phone_number}  ${emp_id}  ${comment}

Call Click On Continue Button
    [Arguments]      ${wf_cnt_add_wr_pg}
    Run Keyword If    '${wf_cnt_add_wr_pg}' == 'yes'   MyServicesAddWearer_Actions.Click On Continue Button


#******************************************************************************

Call Remove Unifrom Wearer
    [Arguments]    ${wf_emp_rem}
    Run Keyword If    '${wf_emp_rem}' == 'yes'  ManageMyContract_Keywords.Remove Unifrom Wearer

Call Remove Product By Clicking X Button
    [Arguments]    ${wf_rem_garment}
    Run Keyword If    '${wf_rem_garment}' == 'yes'  ManageMyContract_Keywords.Remove Product By Clicking X Button  ${in_uni_index}

Call Change Uniform or Product Atrributes
    [Arguments]      ${wf_change_attributes}
    Run Keyword If   '${wf_change_attributes}' == 'yes'   ManageMyContract_Keywords.Change Uniform or Product Atrributes  ${in_uni_index}

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

Call Validate Number Of Wearer Garments List Item
    [Arguments]       ${vp_pd_in_wr_lst}
    Run Keyword If    '${vp_pd_in_wr_lst}' == 'yes'  ManageMyContract_Validation.Validate Number Of Wearer Garments List Item   ${in_no_pd_item}

Call Validate Wearer Modify Account Functionality
    [Arguments]       ${vp_change_acc_sess}
    Run Keyword If    '${vp_change_acc_sess}' == 'yes'  ManageMyContract_Validation.Validate Wearer Modify Account Functionality   ${in_change_acc_no}

#*********************** Wearer Detail Page --------------------------------------------------------------------------
#--- Validate wearer Name
Call Validate Wearer Mandatory Field Values Session
    [Arguments]      ${vp_madatory_sess}
    Run Keyword If    '${vp_madatory_sess}' == 'yes'  ManageMyContract_Validation.Validate Wearer Mandatory Field Values Session   ${new_wearer_first_name}   ${new_wearer_last_name}  ${account_number}  ${EMPTY}


#--- Validate wearer Name
Call Validate Wearer Name In Detail Page
    [Arguments]      ${vp_wr_name_dtl}
    Run Keyword If    '${vp_wr_name_dtl}' == 'yes'  ManageMyContract_Validation.Validate Wearer Name In Detail Page    ${new_wearer_first_name}   ${new_wearer_last_name}


#--- Click on Continue button from add wearer detail page
Call Click On Continue Button from Add Wearer Detail Page
    [Arguments]      ${wf_cnt_add_wr_dtl_pg}
    Run Keyword If    '${wf_cnt_add_wr_dtl_pg}' == 'yes'  MyServicesAddWearerDetails_Actions.Click On Continue Button
    Run Keyword If    '${wf_cnt_add_wr_dtl_pg}' == 'yes' and '${wf_copy_wearer}' == 'yes'  MyServicesAddWearerDetails_Actions.Click Copy Wearer Confirmation Yes Button

#-- Copy wearer
Call Copy From Existing Wearer
    [Arguments]      ${wf_copy_wearer}
    Run Keyword If    '${wf_copy_wearer}' == 'yes'  ManageMyContract_Keywords.Copy From Existing Wearer  ${in_wr_name}

#*********************** Wearer Request Review/Confirmation page  ------------------------------------------------------
#--- Valdiate wearer name in Conformation page

Call Validate Wearer Info In Confirmation Page
    [Arguments]      ${vp_wr_name_cnf}
    Run Keyword If    '${vp_wr_name_cnf}' == 'yes' and '${wf_fill_wr_optional_data}' == 'yes'  ManageMyContract_Validation.Validate Wearer Optinal Info In Confirmation Page   ${email}  ${phone_number}  ${emp_id}  ${comment}
    Run Keyword If    '${vp_wr_name_cnf}' == 'yes'  ManageMyContract_Validation.Validate Wearer Name In Confirmation Page    ${new_wearer_first_name}   ${new_wearer_last_name}

#--- Click on Submit Requests button on Conformation page
Call Click On Submit Request Button In Confirmation Page
    [Arguments]      ${wf_cnt_add_wr_dtl_pg}
    Run Keyword If    '${wf_cnt_add_wr_dtl_pg}' == 'yes'  MyServicesAddWearerConfirm_Actions.Click On Submit Request Button


#######****************************************************
Call Validate Product Attributes In PDP
    [Arguments]   ${vp_product_att}
    Run Keyword If    '${vp_product_att}' == 'yes'  ManageMyContract_Validation.Validate Product Attributes In PDP   ${product_name}  ${product_color}  ${product_fit}  ${product_size1}  ${product_size2}

Call Validate PDP Components Access Right
    [Arguments]   ${vp_pdp_com_access_rt}
    Run Keyword If    '${vp_pdp_com_access_rt}' == 'yes'  ManageMyContract_Validation.Validate PDP Components Access Right  ${impx_ur1_acc_type}  ${in_service_tile}  ${wf_add}


Call Validate Change Contract Global Message
    [Arguments]      ${vp_contract_global_msg}
    Run Keyword If    '${vp_contract_global_msg}' == 'yes'  GlobalMessage_Validations.Validate Message Contains  ${in_contract_global_msg}

Call Validate Requester Manage My Contract Notification
    [Arguments]      ${vp_req_noti_bf_app}
    ${row_number}=    Run Keyword If    '${vp_req_noti_bf_app}' == 'yes'  set variable  1
    Run Keyword If    '${vp_req_noti_bf_app}' == 'yes'  Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    Run Keyword If    '${vp_req_noti_bf_app}' == 'yes'  AlertNotification_Validation.Validate Manage My Contract Notification  ${row_number}  ${in_req_noti_desc_bf_app}


Call Validate In-progress Service Request Detail Values
    [Arguments]      ${vp_in_progress_sr_details}
    ${row_number}=   Run Keyword If    '${vp_in_progress_sr_details}' == 'yes'  set variable  1
    Run Keyword If    '${vp_in_progress_sr_details}' == 'yes'  ServiceRequest_Keywords.Select And Open Inprogress SR
    Run Keyword If    '${vp_in_progress_sr_details}' == 'yes'  ServiceRequest_Validations.Validate Common Service Request Detail Values   ${in_last_name}  ${in_first_name}  ${in_Email}  ${in_status}  ${in_msg_ctg}  ${in_details}

Call Validate Pending Service Request Detail Values
    [Arguments]      ${vp_pending_sr_details}
    ${row_number} =    Run Keyword If    '${vp_pending_sr_details}' == 'yes'   set variable   1
    ${start_date} =    Run Keyword If    '${vp_pending_sr_details}' == 'yes'   set variable    ${to_date}
    ${end_date} =      Run Keyword If    '${vp_pending_sr_details}' == 'yes'   set variable    ${to_date}
    Run Keyword If     '${vp_pending_sr_details}' == 'yes'  ServiceRequest_Keywords.Select And Open Pending Approver SR   ${start_date}    ${end_date}   ${row_number}
    Run Keyword If     '${vp_pending_sr_details}' == 'yes'  ServiceRequest_Validations.Validate Common Service Request Detail Values   ${in_last_name}  ${in_first_name}  ${in_Email}  ${in_status}  ${in_msg_ctg}  ${in_details}
#******************************************************************

#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Set Template Test Data
    [Arguments]    ${tc_data}
    #********************************************************************************************************
    #****************************** Data Define within this template *****************************************
    #********************************************************************************************************
    ${unique_key} =    get_datetime_stamp
    ${to_day} =    Get Current Date    result_format=%d
    Set Test Variable  ${to_day}
    ${to_date} =    Get Current Date    result_format=%m/%d/%Y
    Set Test Variable  ${to_date}
    # New wearer First Name and Last Name
    ${new_wearer_first_name} =  set variable  FirstName${to_day}
    Set Test Variable   ${new_wearer_first_name}
    ${new_wearer_last_name} =  set variable  LastName${to_day}
    Set Test Variable   ${new_wearer_last_name}
    # Wearer Options value
    ${account_number} =  set variable  0010637143
    ${email} =   set variable  ${new_wearer_first_name}@demo.com
    ${phone_number} =   set variable  514-555-1234
    ${emp_id} =    set variable   0014
    ${comment} =   set variable   Thank you
    Set Test Variable  ${account_number}
    Set Test Variable  ${email}
    Set Test Variable  ${phone_number}
    Set Test Variable  ${emp_id}
    Set Test Variable  ${comment}

    #********************************************************************************************************
    #****************************************   Data Read From Excel ****************************************
    #********************************************************************************************************

    # Reading Test Case Name and Description.
    ${testcase_name} =    Pop From Dictionary    ${tc_data}    testcase_name    default=${EMPTY}
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

    # validate garment page access right
    ${vp_mng_uni_pg_acc_rt}=    Pop From Dictionary    ${tc_data}    vp_mng_uni_pg_acc_rt    default=${EMPTY}
    ${vp_mng_uni_pg_acc_rt}=    Convert To Lowercase    ${vp_mng_uni_pg_acc_rt}
    Set Test Variable    ${vp_mng_uni_pg_acc_rt}

    # Add wearer Button Click
    ${wf_add_wearer}=    Pop From Dictionary    ${tc_data}    wf_add_wearer    default=${EMPTY}
    ${wf_add_wearer}=    Convert To Lowercase    ${wf_add_wearer}
    Set Test Variable    ${wf_add_wearer}
#****************************************** Searching and sorting  **************************************************************
   # Search wearer or facility
    ${wf_search} =    Pop From Dictionary    ${tc_data}    wf_search    default=${EMPTY}
    ${wf_search} =    Convert To Lowercase    ${wf_search}
    Set Test Variable    ${wf_search}

    # Search Text
    ${in_search_text} =    Pop From Dictionary    ${tc_data}    in_search_text    default=${EMPTY}
    Set Test Variable    ${in_search_text}

    # Search data type
    ${in_data_type} =    Pop From Dictionary    ${tc_data}    in_data_type    default=${EMPTY}
    ${in_data_type} =    convert to uppercase  ${in_data_type}
    Set Test Variable    ${in_data_type}

   # Validate search result
    ${vp_search_result} =    Pop From Dictionary    ${tc_data}    vp_search_result    default=${EMPTY}
    ${vp_search_result} =    Convert To Lowercase    ${vp_search_result}
    Set Test Variable    ${vp_search_result}

   # Validate No search result
    ${vp_no_search_rslt} =    Pop From Dictionary    ${tc_data}    vp_no_search_rslt    default=${EMPTY}
    ${vp_no_search_rslt} =    Convert To Lowercase    ${vp_no_search_rslt}
    Set Test Variable    ${vp_no_search_rslt}

   # Validate Clear Filter
    ${vp_clear_filter} =    Pop From Dictionary    ${tc_data}    vp_clear_filter    default=${EMPTY}
    ${vp_clear_filter} =    Convert To Lowercase    ${vp_clear_filter}
    Set Test Variable    ${vp_clear_filter}


    # Validate sort result
    ${vp_sort} =    Pop From Dictionary    ${tc_data}    vp_sort    default=${EMPTY}
    ${vp_sort} =    Convert To Lowercase    ${vp_sort}
    Set Test Variable    ${vp_sort}

    # Column Name
    ${in_col_name} =    Pop From Dictionary    ${tc_data}    in_col_name    default=${EMPTY}
    Set Test Variable    ${in_col_name}

    # Sort type (ASC/DSC)
    ${in_sort_type} =    Pop From Dictionary    ${tc_data}    in_sort_type    default=${EMPTY}
    Set Test Variable    ${in_sort_type}

#****************************************** Add Wearer page **************************************************************
    # Enter wearer Mandatory Values
    ${wf_fill_wr_mandatory_data} =    Pop From Dictionary    ${tc_data}    wf_fill_wr_mandatory_data    default=${EMPTY}
    ${wf_fill_wr_mandatory_data} =    Convert To Lowercase    ${wf_fill_wr_mandatory_data}
    Set Test Variable    ${wf_fill_wr_mandatory_data}

    # Validate wearer Mandatory fields Values
    ${vp_mandatory_field} =    Pop From Dictionary    ${tc_data}    vp_mandatory_field    default=${EMPTY}
    ${vp_mandatory_field} =    Convert To Lowercase    ${vp_mandatory_field}
    Set Test Variable    ${vp_mandatory_field}

    # Split wearer Mandatory field Values
    ${in_field_values} =    Pop From Dictionary    ${tc_data}    in_field_values   default=${EMPTY}
    ${cell_value} =  set variable   ${in_field_values}

    # Input should be "FirstName;LastName;Account"
    @{in_field_values} =    Split String   ${in_field_values}  ;
    ${mf_first_name} =  set variable if  '${cell_value}'!='${EMPTY}'  @{in_field_values}[0]
    ${mf_last_name} =   set variable if  '${cell_value}'!='${EMPTY}'  @{in_field_values}[1]
    ${mf_account} =  set variable if  '${cell_value}'!='${EMPTY}'  @{in_field_values}[2]
    Set Test Variable    ${mf_first_name}
    Set Test Variable    ${mf_last_name}
    Set Test Variable    ${mf_account}

    # Enter wearer optional valeus
    ${wf_fill_wr_optional_data} =    Pop From Dictionary    ${tc_data}    wf_fill_wr_optional_data    default=${EMPTY}
    ${wf_fill_wr_optional_data} =    Convert To Lowercase    ${wf_fill_wr_optional_data}
    Set Test Variable    ${wf_fill_wr_optional_data}

    # Enter wearer optional valeus
    ${wf_cnt_add_wr_pg} =    Pop From Dictionary    ${tc_data}    wf_cnt_add_wr_pg    default=${EMPTY}
    ${wf_cnt_add_wr_pg} =    Convert To Lowercase    ${wf_cnt_add_wr_pg}
    Set Test Variable    ${wf_cnt_add_wr_pg}

#***********************************************************************************************************************
    # Remove Garment from Employee Garment page
    ${wf_rem_garment}=    Pop From Dictionary    ${tc_data}    wf_rem_garment    default=${EMPTY}
    ${wf_rem_garment}=    Convert To Lowercase    ${wf_rem_garment}
    Set Test Variable    ${wf_rem_garment}

#*****************************************************************************
   # Update Uniform by clicking change button
    ${wf_change_uniform}=    Pop From Dictionary    ${tc_data}    wf_change_uniform    default=${EMPTY}
    ${wf_change_uniform}=    Convert To Lowercase    ${wf_change_uniform}
    Set Test Variable    ${wf_change_uniform}

    # View Uniform by clicking change button
    ${wf_view_uniform}=    Pop From Dictionary    ${tc_data}    wf_view_uniform   default=${EMPTY}
    ${wf_view_uniform}=    Convert To Lowercase    ${wf_view_uniform}
    Set Test Variable    ${wf_view_uniform}

    # uniform position
    ${in_uni_index}=    Pop From Dictionary    ${tc_data}    in_uni_index   default=${EMPTY}
    Set Test Variable    ${in_uni_index}

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

    # Remove Uniform or Product
    ${wf_rmv_prod}=    Pop From Dictionary    ${tc_data}    wf_rmv_prod    default=${EMPTY}
    ${wf_rmv_prod}=    Convert To Lowercase    ${wf_rmv_prod}
    Set Test Variable    ${wf_rmv_prod}

    # Wearer Product list
    ${vp_pd_in_wr_lst}=    Pop From Dictionary    ${tc_data}    vp_pd_in_wr_lst    default=${EMPTY}
    ${vp_pd_in_wr_lst}=    Convert To Lowercase    ${vp_pd_in_wr_lst}
    Set Test Variable    ${vp_pd_in_wr_lst}

    # No of Expected product number
    ${in_no_pd_item}=    Pop From Dictionary    ${tc_data}    in_no_pd_item    default=${EMPTY}
    Set Test Variable    ${in_no_pd_item}

    # Validate Modified Product
    ${vp_change_acc_sess}=    Pop From Dictionary    ${tc_data}    vp_change_acc_sess    default=${EMPTY}
    ${vp_change_acc_sess}=    Convert To Lowercase    ${vp_change_acc_sess}
    Set Test Variable    ${vp_change_acc_sess}

    # No of Expected product number
    ${in_change_acc_no}=    Pop From Dictionary    ${tc_data}    in_change_acc_no    default=${EMPTY}
    Set Test Variable    ${in_change_acc_no}



#*************************************** add wearer detail page ********************************************************

    #--- Click on Continue button from add wearer detail page
    ${wf_cnt_add_wr_dtl_pg} =    Pop From Dictionary    ${tc_data}    wf_cnt_add_wr_dtl_pg    default=${EMPTY}
    ${wf_cnt_add_wr_dtl_pg} =    Convert To Lowercase    ${wf_cnt_add_wr_dtl_pg}
    Set Test Variable    ${wf_cnt_add_wr_dtl_pg}

    #--- Click on Continue button from add wearer detail page
    ${vp_madatory_sess} =    Pop From Dictionary    ${tc_data}    vp_madatory_sess   default=${EMPTY}
    ${vp_madatory_sess} =    Convert To Lowercase    ${vp_madatory_sess}
    Set Test Variable    ${vp_madatory_sess}


    #--- Click on Continue button from add wearer detail page
    ${vp_wr_name_dtl} =    Pop From Dictionary    ${tc_data}    vp_wr_name_dtl    default=${EMPTY}
    ${vp_wr_name_dtl} =    Convert To Lowercase    ${vp_wr_name_dtl}
    Set Test Variable    ${vp_wr_name_dtl}

    #--- Copy wearer
    ${wf_copy_wearer} =    Pop From Dictionary    ${tc_data}    wf_copy_wearer    default=${EMPTY}
    ${wf_copy_wearer} =    Convert To Lowercase    ${wf_copy_wearer}
    Set Test Variable    ${wf_copy_wearer}

    #--- Copy wearer: wearer name
    ${in_wr_name} =    Pop From Dictionary    ${tc_data}    in_wr_name    default=${EMPTY}
    ${in_wr_name} =    Convert To Lowercase    ${in_wr_name}
    Set Test Variable    ${in_wr_name}
#**************************************** add wearer confirmation **********************************************************

    #--- Click on Submit Request button from add wearer confiramtion page
    ${wf_submit_req} =    Pop From Dictionary    ${tc_data}    wf_submit_req    default=${EMPTY}
    ${wf_submit_req} =    Convert To Lowercase    ${wf_submit_req}
    Set Test Variable    ${wf_submit_req}

    #--- Validate wearer Name
    ${vp_wr_name_cnf} =    Pop From Dictionary    ${tc_data}    vp_wr_name_cnf    default=${EMPTY}
    ${vp_wr_name_cnf} =    Convert To Lowercase    ${vp_wr_name_cnf}
    Set Test Variable    ${vp_wr_name_cnf}
#*******************************************************************************************************

    # Check global message
    ${vp_contract_global_msg}=    Pop From Dictionary    ${tc_data}    vp_contract_global_msg   default=${EMPTY}
    ${vp_contract_global_msg}=    Convert To Lowercase    ${vp_contract_global_msg}
    Set Test Variable    ${vp_contract_global_msg}
    # text of global message
    ${in_contract_global_msg}=    Pop From Dictionary    ${tc_data}    in_contract_global_msg   default=${EMPTY}
    ${in_contract_global_msg}=    Convert To Lowercase    ${in_contract_global_msg}
    Set Test Variable    ${in_contract_global_msg}

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
    # SR Details Page
    ${in_details}=    Pop From Dictionary    ${tc_data}    in_details   default=${EMPTY}
    ${in_details}=    Set Variable If  '${in_details}' == 'comment2500char'  ${comment255char}  ${in_details}
    Set Test Variable   ${in_details}



