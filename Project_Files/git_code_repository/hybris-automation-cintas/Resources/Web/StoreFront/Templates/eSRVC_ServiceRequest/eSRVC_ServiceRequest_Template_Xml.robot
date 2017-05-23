*** Settings ***
Library           Collections
Resource          ../../FunctionalKeywords/Login_Keywords.robot
Resource          ../../PageActions/Dashboard_Actions.robot
Resource          ../../PageValidations/ServiceRequest_Validations.robot
Resource          ../../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../../../Common/Common_Keywords.robot
Resource          ../../../Common/Impex_Keywords.robot

*** Keywords ***
Service Request Template Xml
    [Arguments]    ${tc_data}

    # Set test date for template
    eSRVC_ServiceRequest_Template_Xml.Set Template Test Data    ${tc_data}

    # Call User Request Impex If '${impx_ur_update}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Call User Request Impex    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}

    # Call Service Request Impex If '${impx_sr_update}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Call Service Request Impex    ${impx_sr_update}     ${testcase_name}    ${impx_sr_requester}    ${impx_sr_soldto}
    ...    ${impx_sr_creation_time}    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}

    # Begin Test
    eSRVC_ServiceRequest_Template_Xml.Begin Test

    # Login to Front End
    eSRVC_ServiceRequest_Template_Xml.Login to Front End    ${in_customer_email}    ${in_customer_password}

    # Validate Top Menu Approver Option
    eSRVC_ServiceRequest_Template_Xml.Validate Top Menu Approver Option    ${vp_sr_top_menu_approver}    ${impx_ur_account_type}

    # Go to Service Requests
    eSRVC_ServiceRequest_Template_Xml.Go to Service Requests

    # Validate Available Buttons based on '${impx_ur_account_type}'
    eSRVC_ServiceRequest_Template_Xml.Validate Available Buttons By Account Type    ${impx_ur_account_type}

    # Select MY or OTHER Service requests
    eSRVC_ServiceRequest_Template_Xml.Select Requests To View    ${wf_requests_to_view}

    # Validate create service request mandatory fields
    eSRVC_ServiceRequest_Template_Xml.Validate create service request mandatory fields    ${vp_sr_mandatory_field}    ${in_subject}    ${in_details}

    # Validate headers if '${wf_headers}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate headers    ${vp_sr_mandatory_field}    ${wf_requests_to_view}

    # Validate Default fields if '${wf_default_value}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate Default fields    ${vp_default_value}    ${wf_requests_to_view}

    # Validate Search Error Messages if '${vp_search_errors}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate Search Error Messages    ${vp_search_errors}

    # Validate the number of Service Requests Returned if '${wf_request_count}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate the number of Service Requests Returned    ${vp_request_count}   ${vp_min_request_count_exp}

    # Validate Default Order of Service Requests (Pending Old first - Rejected New first) if '${vp_default_srlist}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate Default Order of Service Requests    ${vp_default_srlist}

    # Filter Service Requests if '${wf_filter}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Filter Service Requests    ${wf_filter}    ${vp_filter_start_date}    ${vp_filter_end_date}    ${vp_filter_status}    ${vp_filter_text}

    # Validate headers2 if '${wf_headers2}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate headers2    ${vp_headers2}

    # Validate Filter if    '${vp_filter}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate Filter    ${vp_filter}    ${vp_filter_sort_type}    ${vp_sort_criteria}    ${vp_filter_start_date}    ${vp_filter_end_date}
    ...    ${vp_filter_status}    ${vp_filter_text}

    # Validate Sort if '${vp_sort}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate Sort    ${vp_sort}    ${vp_sort_criteria}

    # Select Service Request If '${wf_select_sr}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Select Service Request    ${wf_select_sr}

    # Validate Elements of SR Details If '${vp_srdtl_elements}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate Elements of SR Details    ${vp_srdtl_elements}    ${wf_requests_to_view}

    # Validate Values of SR Details If '${vp_srdtl_values}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate Values of SR Details    ${vp_srdtl_values}

    # Select Response for SR ApproveReject If '${wf_sr_response}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Select Response for SR ApproveReject    ${wf_sr_reply}    ${in_sr_message}    ${in_sr_response}

    # Validate SR Reject Message IF '${vp_sr_error}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Validate SR Reject Message    ${vp_sr_error}

    # Select Confirmation Message action APPROVE/CANCEL or REJECT/CANCEL iF '${wf_sr_resp_confim}' == 'True'
    eSRVC_ServiceRequest_Template_Xml.Select Confirmation Message action    ${wf_sr_resp_confim}    ${in_sr_resp_confim}

    # Validate Response Message (Global Message) if '${vp_sr_resp_msg}' == 'True'
    # Possible validations SR Accepted, SR Rejected, SR Accepted Cancel, SR Rejected Cancel
    eSRVC_ServiceRequest_Template_Xml.Validate SR Response Message    ${vp_sr_resp_msg}    ${in_sr_resp_confim}

Set Template Test Data
    [Arguments]    ${tc_data}
    ${testcase_name} =    Pop From Dictionary	${tc_data}	testcase_name    default=${EMPTY}
    Set Test Variable    ${testcase_name}
    ${testcase_description} =    Pop From Dictionary	${tc_data}	testcase_description    default=${EMPTY}
    Set Test Variable    ${testcase_description}
    ${impx_ur_update} =    Pop From Dictionary	${tc_data}	impx_ur_update    default=FALSE
    Set Test Variable    ${impx_ur_update}
    ${impx_ur_account_type} =    Pop From Dictionary	${tc_data}	impx_ur_account_type    default=${EMPTY}
    Set Test Variable    ${impx_ur_account_type}
    ${impx_sr_update} =    Pop From Dictionary	${tc_data}	impx_sr_update    default=FALSE
    Set Test Variable    ${impx_sr_update}
    ${impx_sr_requester} =    Pop From Dictionary	${tc_data}	impx_sr_requester    default=${EMPTY}
    Set Test Variable    ${impx_sr_requester}
    ${impx_sr_soldto} =    Pop From Dictionary	${tc_data}	impx_sr_soldto    default=${EMPTY}
    Set Test Variable    ${impx_sr_soldto}
    ${impx_sr_creation_time} =    Pop From Dictionary	${tc_data}	impx_sr_creation_time    default=${EMPTY}
    Set Test Variable    ${impx_sr_creation_time}
    ${impx_sr_pending_status_count} =    Pop From Dictionary	${tc_data}	impx_sr_pending_status_count    default=${EMPTY}
    Set Test Variable    ${impx_sr_pending_status_count}
    ${impx_sr_rejected_status_count} =    Pop From Dictionary	${tc_data}	impx_sr_rejected_status_count    default=${EMPTY}
    Set Test Variable    ${impx_sr_rejected_status_count}
    ${in_customer_email} =    Pop From Dictionary	${tc_data}	in_customer_email    default=${EMPTY}
    Set Test Variable    ${in_customer_email}
    ${in_customer_password} =    Pop From Dictionary	${tc_data}	in_customer_password    default=${EMPTY}
    Set Test Variable    ${in_customer_password}
    ${vp_sr_top_menu_approver} =    Pop From Dictionary	${tc_data}	vp_sr_top_menu_approver    default=FALSE
    Set Test Variable    ${vp_sr_top_menu_approver}
    ${wf_requests_to_view} =    Pop From Dictionary	${tc_data}	wf_requests_to_view    default=${EMPTY}
    Set Test Variable    ${wf_requests_to_view}
    ${vp_sr_mandatory_field} =    Pop From Dictionary	${tc_data}	vp_sr_mandatory_field    default=FALSE
    Set Test Variable    ${vp_sr_mandatory_field}
    ${in_subject} =    Pop From Dictionary	${tc_data}	in_subject    default=${EMPTY}
    Set Test Variable    ${in_subject}
    ${in_details} =    Pop From Dictionary	${tc_data}	in_details    default=${EMPTY}
    Set Test Variable    ${in_details}
    ${vp_headers1} =    Pop From Dictionary	${tc_data}	vp_headers1    default=FALSE
    Set Test Variable    ${vp_headers1}
    ${vp_default_value} =    Pop From Dictionary	${tc_data}	vp_default_value    default=FALSE
    Set Test Variable    ${vp_default_value}
    ${vp_search_errors} =    Pop From Dictionary	${tc_data}	vp_search_errors    default=FALSE
    Set Test Variable    ${vp_search_errors}
    ${vp_request_count} =    Pop From Dictionary	${tc_data}	vp_request_count    default=FALSE
    Set Test Variable    ${vp_request_count}
    ${vp_min_request_count_exp} =    Pop From Dictionary	${tc_data}	vp_min_request_count_exp    default=${EMPTY}
    Set Test Variable    ${vp_min_request_count_exp}
    ${vp_default_srlist} =    Pop From Dictionary	${tc_data}	vp_default_srlist    default=FALSE
    Set Test Variable    ${vp_default_srlist}
    ${wf_filter} =    Pop From Dictionary	${tc_data}	wf_filter    default=FALSE
    Set Test Variable    ${wf_filter}
    ${vp_filter_start_date} =    Pop From Dictionary	${tc_data}	vp_filter_start_date    default=${EMPTY}
    Set Test Variable    ${vp_filter_start_date}
    ${vp_filter_end_date} =    Pop From Dictionary	${tc_data}	vp_filter_end_date    default=${EMPTY}
    Set Test Variable    ${vp_filter_end_date}
    ${vp_filter_status} =    Pop From Dictionary	${tc_data}	vp_filter_status    default=${EMPTY}
    Set Test Variable    ${vp_filter_status}
    ${vp_filter_text} =    Pop From Dictionary	${tc_data}	vp_filter_text    default=${EMPTY}
    Set Test Variable    ${vp_filter_text}
    ${vp_headers2} =    Pop From Dictionary	${tc_data}	vp_headers2    default=FALSE
    Set Test Variable    ${vp_headers2}
    ${vp_filter} =    Pop From Dictionary	${tc_data}	vp_filter    default=FALSE
    Set Test Variable    ${vp_filter}
    ${vp_sort} =    Pop From Dictionary	${tc_data}	vp_sort    default=${EMPTY}
    Set Test Variable    ${vp_sort}
    ${vp_sort_criteria} =    Pop From Dictionary	${tc_data}	vp_sort_criteria    default=${EMPTY}
    Set Test Variable    ${vp_sort_criteria}
    ${vp_filter_sort_type} =    Pop From Dictionary	${tc_data}	vp_filter_sort_type    default=${EMPTY}
    Set Test Variable    ${vp_filter_sort_type}
    ${wf_select_sr} =    Pop From Dictionary	${tc_data}	wf_select_sr    default=FALSE
    Set Test Variable    ${wf_select_sr}
    ${vp_srdtl_elements} =    Pop From Dictionary	${tc_data}	vp_srdtl_elements    default=FALSE
    Set Test Variable    ${vp_srdtl_elements}
    ${vp_srdtl_values} =    Pop From Dictionary	${tc_data}	vp_srdtl_values    default=FALSE
    Set Test Variable    ${vp_srdtl_values}
    ${wf_sr_reply} =    Pop From Dictionary	${tc_data}	wf_sr_reply    default=FALSE
    Set Test Variable    ${wf_sr_reply}
    ${in_sr_message} =    Pop From Dictionary	${tc_data}	in_sr_message    default=${EMPTY}
    Set Test Variable    ${in_sr_message}
    ${in_sr_response} =    Pop From Dictionary	${tc_data}	in_sr_response    default=${EMPTY}
    Set Test Variable    ${in_sr_response}
    ${vp_sr_error} =    Pop From Dictionary	${tc_data}	vp_sr_error    default=FALSE
    Set Test Variable    ${vp_sr_error}
    ${in_sr_response} =    Pop From Dictionary	${tc_data}	in_sr_response    default=${EMPTY}
    Set Test Variable    ${in_sr_response}
    ${wf_sr_resp_confim} =    Pop From Dictionary	${tc_data}	wf_sr_resp_confim    default=FALSE
    Set Test Variable    ${wf_sr_resp_confim}
    ${in_sr_resp_confim} =    Pop From Dictionary	${tc_data}	in_sr_resp_confim    default=${EMPTY}
    Set Test Variable    ${in_sr_resp_confim}
    ${vp_sr_resp_msg} =    Pop From Dictionary	${tc_data}	vp_sr_resp_msg    default=FALSE
    Set Test Variable    ${vp_sr_resp_msg}
    ${wf_create_sr} =    Pop From Dictionary	${tc_data}	wf_create_sr    default=FALSE
    Set Test Variable    ${wf_create_sr}
    ${in_sr_subject} =    Pop From Dictionary	${tc_data}	in_sr_subject    default=${EMPTY}
    Set Test Variable    ${in_sr_subject}
    ${in_sr_details} =    Pop From Dictionary	${tc_data}	in_sr_details    default=${EMPTY}
    Set Test Variable    ${in_sr_details}

Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${in_customer_email}    ${in_customer_password}
    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

Call User Request Impex
    [Arguments]    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}
    Run Keyword If    '${impx_ur_update}' == 'TRUE'    Impex_Keywords.Import Impex User Role    ${in_customer_email}    ${impx_ur_account_type}

Call Service Request Impex
    [Arguments]    ${impx_sr_update}    ${testcase_name}    ${impx_sr_requester}    ${impx_sr_soldto}
    ...    ${impx_sr_creation_time}    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}
    @{sr_list} =    Run Keyword If    '${impx_sr_update}' == 'TRUE'    Impex_Keywords.Import Impex Service Request    ${testcase_name}    ${impx_sr_requester}    ${impx_sr_soldto}
    ...    ${impx_sr_creation_time}    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}
    set test variable    @{sr_list}

Validate Top Menu Approver Option
    [Arguments]    ${vp_sr_top_menu_approver}    ${impx_ur_account_type}
    Run Keyword If    '${vp_sr_top_menu_approver}' == 'TRUE'    ServiceRequest_Validations.Validate Top Menu Approval Option    ${impx_ur_account_type}

Go to Service Requests
    Dashboard_Actions.Click Service Request

Validate Available Buttons By Account Type
    [Arguments]    ${impx_ur_account_type}
    ServiceRequest_Validations.Validate Available Buttons    ${impx_ur_account_type}

Select Requests To View
    [Arguments]    ${wf_requests_to_view}
    ServiceRequest_Keywords.Select Requests To View    ${wf_requests_to_view}

Validate create service request mandatory fields
    [Arguments]    ${vp_sr_mandatory_field}    ${in_subject}    ${in_details}
    Run Keyword If    '${vp_sr_mandatory_field}' == 'TRUE'    ServiceRequest_Validations.Validate Create SR Mandatory Fields    ${in_subject}    ${in_details}

Validate headers
    [Arguments]    ${vp_headers1}    ${wf_requests_to_view}
    Run Keyword If    '${vp_headers1}' == 'TRUE'    ServiceRequest_Validations.Validate Headers    ${wf_requests_to_view}

Validate Default fields
    [Arguments]    ${vp_default_value}    ${wf_requests_to_view}
    Run Keyword If    '${vp_default_value}' == 'TRUE'    ServiceRequest_Validations.Validate Default Search Field values    ${wf_requests_to_view}

Validate Search Error Messages
    [Arguments]    ${vp_search_errors}
    Run Keyword If    '${vp_search_errors}' == 'TRUE'    ServiceRequest_Validations.Validate Search Error Messages

Validate the number of Service Requests Returned
    [Arguments]    ${vp_request_count}   ${vp_min_request_count_exp}
    Run Keyword If    '${vp_request_count}' == 'TRUE'    ServiceRequest_Validations.Validate Request Count    ${vp_min_request_count_exp}

Validate Default Order of Service Requests
    [Arguments]    ${vp_default_srlist}
    Run Keyword If    '${vp_default_srlist}' == 'TRUE'    ServiceRequest_Validations.Validate Default Sorting

Filter Service Requests
    [Arguments]    ${wf_filter}    ${vp_filter_start_date}    ${vp_filter_end_date}    ${vp_filter_status}    ${vp_filter_text}
    Run Keyword If    '${wf_filter}' == 'TRUE'    ServiceRequest_Keywords.Filter Service request    ${vp_filter_start_date}    ${vp_filter_end_date}    ${vp_filter_status}    ${vp_filter_text}

Validate headers2
    [Arguments]    ${vp_headers2}
    Run Keyword If    '${vp_headers2}' == 'TRUE'    ServiceRequest_Validations.Validate Headers Others Requests Rejected

Validate Filter
    [Arguments]    ${vp_filter}    ${vp_filter_sort_type}    ${vp_sort_criteria}    ${vp_filter_start_date}    ${vp_filter_end_date}
    ...    ${vp_filter_status}    ${vp_filter_text}
    Run Keyword If    '${vp_filter}' == 'TRUE'    ServiceRequest_Validations.Validate Service Request Filter    ${vp_filter_sort_type}    ${vp_sort_criteria}    ${vp_filter_start_date}    ${vp_filter_end_date}
    ...    ${vp_filter_status}    ${vp_filter_text}

Validate Sort
    [Arguments]    ${vp_sort}    ${vp_sort_criteria}
    Run Keyword If    '${vp_sort}' == 'TRUE'    ServiceRequest_Validations.Validate Service Request Sort Asc And Dec    ${vp_sort_criteria}

Select Service Request
    [Arguments]    ${wf_select_sr}
    Run Keyword If    '${wf_select_sr}' == 'TRUE'    ServiceRequest_Keywords.Select An Service Request    @{sr_list}[0]

Validate Elements of SR Details
    [Arguments]    ${vp_srdtl_elements}    ${wf_requests_to_view}
    Run Keyword If    '${vp_srdtl_elements}' == 'TRUE'    ServiceRequest_Validations.Validate SR Detail Page Elements    ${wf_requests_to_view}

Validate Values of SR Details
    [Arguments]    ${vp_srdtl_values}
    Run Keyword If    '${vp_srdtl_values}' == 'TRUE'    ServiceRequest_Validations.Validate SR Detail Values

Select Response for SR ApproveReject
    [Arguments]    ${wf_sr_reply}    ${in_sr_message}    ${in_sr_response}
    Run Keyword If    '${wf_sr_reply}' == 'TRUE'    ServiceRequest_Keywords.Service Request Reply Decision    ${in_sr_message}    ${in_sr_response}

Validate SR Reject Message
    [Arguments]    ${vp_sr_error}
    Run Keyword If    '${vp_sr_error}' == 'TRUE'    ServiceRequest_Validations.Validate SR Reject Error Message

Select Confirmation Message action
    [Arguments]    ${wf_sr_resp_confim}    ${in_sr_resp_confim}
    Run Keyword If    '${wf_sr_resp_confim}' == 'TRUE'    ServiceRequest_Keywords.Service Request Reply Confirmation    ${in_sr_resp_confim}

Validate SR Response Message
    [Arguments]    ${vp_sr_resp_msg}    ${in_sr_resp_confim}
    Run Keyword If    '${vp_sr_resp_msg}' == 'TRUE'    ServiceRequest_Validations.Validate Approval of Pending SR    ${in_sr_resp_confim}

