*** Settings ***
Library           Collections
Resource          ../../FunctionalKeywords/Login_Keywords.robot
Resource          ../../PageActions/Dashboard_Actions.robot
Resource          ../../PageValidations/ServiceRequest_Validations.robot
Resource          ../../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../../../Common/Common_Keywords.robot
Resource          ../../../Common/Impex_Keywords.robot
Resource          ../../PageValidations/CreateNewRequest_Validations.robot

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Create Service Request Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_CreateServiceRequest_Template.Set Template Test Data    ${tc_data}
    # Call User Request Impex If '${impx_ur_update}' == 'True'
    eSRVC_CreateServiceRequest_Template.Call User Request Impex    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}
    # Begin Test
    eSRVC_CreateServiceRequest_Template.Begin Test
    # Login to Front End
    eSRVC_CreateServiceRequest_Template.Login to Front End    ${in_customer_email}    ${in_customer_password}
    # Go to Service Requests
    eSRVC_CreateServiceRequest_Template.Go to Service Requests
    # Open Service Request Generic Page
    ServiceRequest_Actions.Click Create New Request Button
    # Attach file
    eSRVC_CreateServiceRequest_Template.Call Upload SR Attachment File    ${wf_upload}    ${in_file_name}
    # Validate Modal Error
    eSRVC_CreateServiceRequest_Template.Call Upload File Modal Error Msg    ${vp_modal_error}
    # Validate attached file Name
    eSRVC_CreateServiceRequest_Template.Call Validate SR File Attachment    ${vp_attch_file}    ${in_file_name}
    # Romove attachment
    eSRVC_CreateServiceRequest_Template.Call Remove SR Attachment File    ${wf_remove_attach}
    # Validate Remove attached file Name
    eSRVC_CreateServiceRequest_Template.Call Validate SR Remove Attachment    ${vp_attch_remove}
    # Create Service Request
    eSRVC_CreateServiceRequest_Template.Call Create Service Request in Generic Page    ${wf_create_sr}    ${in_subject}    ${in_details}
    # Validate attachment of Pending SR in Details Page
    eSRVC_CreateServiceRequest_Template.Call Validate Attachment of Pending SR in Details Page    ${vp_attach_srdp}    ${in_file_name}    ${unique_key}
    # Attach File in SR details page
    eSRVC_CreateServiceRequest_Template.Call Upload SR Attachment File in SR Details Page    ${wf_attach_srdp}
    # Validate Modal Error
    eSRVC_CreateServiceRequest_Template.Call Validate Upload File Modal Error Msg    ${vp_modal_error_srdp}
    # Validate attached file Name
    eSRVC_CreateServiceRequest_Template.Call Validate SR File Attachment in SR Details Page    ${vp_attch_file_srdp}    ${in_file_name}
    # Validate attachment of Pending SR in Approval Details Page
    eSRVC_CreateServiceRequest_Template.Call Validate Attachment of Pending SR in Approval Details Page    ${vp_approval_srdp}    ${in_file_name}    ${unique_key}    ${in_approver_email}


#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${in_customer_email}    ${in_customer_password}
    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

Call User Request Impex
    [Arguments]    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}
    Run Keyword If    '${impx_ur_update}' == 'TRUE' or '${impx_ur_update}' == '1'    Impex_Keywords.Import Impex User Role    ${in_customer_email}    ${impx_ur_account_type}

Go to Service Requests
    Dashboard_Actions.Click Service Request

Select Response for SR ApproveReject
    [Arguments]    ${wf_sr_reply}    ${in_sr_message}    ${in_sr_response}
    Run Keyword If    '${wf_sr_reply}' == 'TRUE' or '${wf_sr_reply}' == '1'    ServiceRequest_Keywords.Service Request Reply Decision    ${in_sr_message}    ${in_sr_response}

Call Upload SR Attachment File
    [Arguments]    ${wf_upload}    ${in_file_name}
    Run Keyword If    '${wf_upload}' == 'TRUE' or '${wf_upload}' == '1'    ServiceRequest_Keywords.Upload SR Attachment File    ${in_file_name}

Call Upload File Modal Error Msg
    [Arguments]    ${vp_modal_error}
    Run Keyword If    '${vp_modal_error}' == 'NO_FILE' or '${vp_modal_error}' == 'INVALID_EXT' or '${vp_modal_error}' == 'INVALID_SIZE'    CreateNewRequest_Validations.Validate Upload File Modal Error Msg    ${vp_modal_error}

Call Validate SR File Attachment
    [Arguments]    ${vp_attch_file}    ${in_file_name}
    Run Keyword If    '${vp_attch_file}' == 'TRUE' or '${vp_attch_file}' == '1'    CreateNewRequest_Validations.Validate SR File Attachment    ${in_file_name}

Call Remove SR Attachment File
    [Arguments]    ${wf_remove_attach}
    Run Keyword If    '${wf_remove_attach}' == 'TRUE' or '${wf_remove_attach}' == '1'    ServiceRequest_Keywords.Remove SR Attachment File

Call Validate SR Remove Attachment
    [Arguments]    ${vp_attch_remove}
    Run Keyword If    '${vp_attch_remove}' == 'TRUE' or '${vp_attch_remove}' == '1'    CreateNewRequest_Validations.Validate SR Remove Attachment

Call Create Service Request in Generic Page
    [Arguments]    ${wf_create_sr}    ${in_subject}    ${in_details}
    Run Keyword If    '${wf_create_sr}' == 'TRUE' or '${wf_create_sr}' == '1'    ServiceRequest_Keywords.Create Service Request in Generic Page    ${in_subject}    ${in_details}

Call Validate Attachment of Pending SR in Details Page
    [Arguments]    ${vp_attach_srdp}    ${in_file_name}    ${unique_key}
    Run Keyword If    '${vp_attach_srdp}' == 'TRUE' or '${wf_create_sr}' == '1'    CreateNewRequest_Validations.Validate Attachment of Pending SR in Details Page    ${in_file_name}    ${unique_key}

Call Upload SR Attachment File in SR Details Page
    [Arguments]    ${wf_attach_srdp}
    Run Keyword If    '${wf_attach_srdp}' == 'PENDING' or '${wf_attach_srdp}' == 'IN-PROGRESS'    ServiceRequest_Keywords.Upload SR Attachment File in SR Details Page    ${wf_attach_srdp}

Call Validate Upload File Modal Error Msg
    [Arguments]    ${vp_modal_error_srdp}
    Run Keyword If    '${vp_modal_error_srdp}' == 'NO_FILE' or '${vp_modal_error_srdp}' == 'INVALID_EXT' or '${vp_modal_error_srdp}' == 'INVALID_SIZE'    CreateNewRequest_Validations.Validate Upload File Modal Error Msg    ${vp_modal_error_srdp}

Call Validate Attachment of Pending SR in Approval Details Page
    [Arguments]    ${vp_approval_srdp}    ${in_file_name}    ${unique_key}    ${in_approver_email}
    Run Keyword If    '${vp_approval_srdp}' == 'TRUE' or '${vp_approval_srdp}' == '1'    CreateNewRequest_Validations.Validate Attachment of Pending SR in Approval Details Page    ${in_file_name}    ${unique_key}    ${in_approver_email}

Call Validate SR File Attachment in SR Details Page
    [Arguments]    ${vp_attch_file_srdp}    ${in_file_name}
    Run Keyword If    '${vp_attch_file_srdp}' == 'TRUE' or '${vp_attch_file_srdp}' == '1'    CreateNewRequest_Validations.Validate SR File Attachment    ${in_file_name}

#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
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
    #
    ${in_customer_email} =    Pop From Dictionary    ${tc_data}    in_customer_email    default=${EMPTY}
    Set Test Variable    ${in_customer_email}
    ${in_customer_password} =    Pop From Dictionary    ${tc_data}    in_customer_password    default=${EMPTY}
    Set Test Variable    ${in_customer_password}
    #---------------------------------------    My Data    -----------------------------------------
    ${wf_upload}=    Pop From Dictionary    ${tc_data}    wf_upload    default=${EMPTY}
    Set Test Variable    ${wf_upload}
    #-------------------------------------------
    ${in_file_name}=    Pop From Dictionary    ${tc_data}    in_file_name    default=${EMPTY}
    Set Test Variable    ${in_file_name}
    #-------------------------------------------
    ${vp_modal_error}=    Pop From Dictionary    ${tc_data}    vp_modal_error    default=${EMPTY}
    Set Test Variable    ${vp_modal_error}
    #-----------
    ${vp_attch_file}=    Pop From Dictionary    ${tc_data}    vp_attch_file    default=${EMPTY}
    Set Test Variable    ${vp_attch_file}
    #-----------
    ${wf_remove_attach}=    Pop From Dictionary    ${tc_data}    wf_remove_attach    default=${EMPTY}
    Set Test Variable    ${wf_remove_attach}
    ${vp_attch_remove} =    Pop From Dictionary    ${tc_data}    vp_attch_remove    default=${EMPTY}
    Set Test Variable    ${vp_attch_remove}
    #-----------    Create SR Subject and description    --------------------------------------
    ${wf_create_sr}=    Pop From Dictionary    ${tc_data}    wf_create_sr    default=${EMPTY}
    Set Test Variable    ${wf_create_sr}
    ${unique_key} =    get_datetime_stamp
    Set Test Variable    ${unique_key}
    ${in_subject} =    Pop From Dictionary    ${tc_data}    in_subject    default=${EMPTY}
    ${in_details} =    Pop From Dictionary    ${tc_data}    in_details    default=${EMPTY}
    ${in_subject}=    Catenate    SEPARATOR=${SPACE}    ${in_subject}    ${unique_key}
    Set Test Variable    ${in_subject}
    ${in_details}=    Catenate    SEPARATOR=${SPACE}    ${testcase_name}    ${in_details}    ${unique_key}
    Set Test Variable    ${in_details}
    #-------------------------------------------------    pending sr attachment in SR details page
    ${vp_attach_srdp} =    Pop From Dictionary    ${tc_data}    vp_attach_srdp    default=${EMPTY}
    Set Test Variable    ${vp_attach_srdp}
    #-------------------------------------------------    upload attachment in SR details page
    ${wf_attach_srdp} =    Pop From Dictionary    ${tc_data}    wf_attach_srdp    default=${EMPTY}
    Set Test Variable    ${wf_attach_srdp}
    #-----------------------------------------------    attachment error in sr details page
    ${vp_modal_error_srdp} =    Pop From Dictionary    ${tc_data}    vp_modal_error_srdp    default=${EMPTY}
    Set Test Variable    ${vp_modal_error_srdp}
    #-----------------------------------------------    attachment File validation in sr details page
    ${vp_attch_file_srdp} =    Pop From Dictionary    ${tc_data}    vp_attch_file_srdp    default=${EMPTY}
    Set Test Variable    ${vp_attch_file_srdp}
    #-----------------------------------------------    attachment File validation in sr details page
    ${vp_approval_srdp} =    Pop From Dictionary    ${tc_data}    vp_approval_srdp    default=${EMPTY}
    Set Test Variable    ${vp_approval_srdp}
    #-----------------------------------------------    attachment File validation in sr details page
    ${in_approver_email} =    Pop From Dictionary    ${tc_data}    in_approver_email    default=${EMPTY}
    Set Test Variable    ${in_approver_email}


