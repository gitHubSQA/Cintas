*** Settings ***
Library           Collections
Resource          ../../FunctionalKeywords/Login_Keywords.robot
Resource          ../../PageActions/Dashboard_Actions.robot
Resource          ../../PageValidations/ServiceRequest_Validations.robot
Resource          ../../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../../../Common/Common_Keywords.robot
Resource          ../../../Common/Impex_Keywords.robot
Resource          ../../PageValidations/CreateNewRequest_Validations.robot
Resource          ../../PageValidations/InvocieSummary_Validation.robot

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Chat Service Request Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_ChatServiceRequest_Template.Set Template Test Data    ${tc_data}
    # change user1 role
    eSRVC_ChatServiceRequest_Template.Call User1 Request Impex    ${impx_ur1_update}    ${in_ur1_email}    ${impx_ur1_acc_type}    ${impx_first_login}
    # change user2 role
    eSRVC_ChatServiceRequest_Template.Call User2 Request Impex    ${impx_ur2_update}    ${in_ur2_email}    ${impx_ur2_acc_type}    ${impx_first_login}
    # Begin Test
    eSRVC_ChatServiceRequest_Template.Begin Test
    # Validate REQUESTER closed sr chat option
    #    TODO
    # Validate approval closed sr chat option
    # Login to Front End
    eSRVC_ChatServiceRequest_Template.Login to Front End    ${in_ur1_email}    ${in_customer_password}
    # Billing Invocie
    Run Keyword If    '${vp_inv_content}'=='yes'    InvocieSummary_Validation.Validate Single User Billing Dashboard
    # validate inprogress and closed sr search filter
    Run Keyword If    '${vp_filter}'=='yes'    Validate SR Status SR Details Page    ${in_start_date}    ${in_end_date}    ${in_status}
    # Create new serive request
    Run Keyword If    '${wf_create_sr_dp}'=='yes'    ServiceRequest_Keywords.Create Service Request from Dashboard Page    Add a Product    Subject: Create SR ${unique_key}    Description: Create SR ${unique_key}
    Comment    Run Keyword If    '${vp_app_closed_chat_opt}'!='yes'    Create Service Request from Dashboard Page    ${wf_create_sr_dp}
    # Validate req pending chat option
    Run Keyword If    '${vp_req_cht_opt}'=='yes'    Validate Requester Pending SR Chat Option
    # Validate app pending chat option
    Run Keyword If    '${vp_app_cht_opt}'=='yes'    Validate Approver Pending SR Chat Option
    # Approve Pending SR
    Run Keyword If    '${wf_approve_sr}'=='yes'    Approve Pending Service Request
    # Reject Pending SR
    Run Keyword If    '${wf_reject_sr}'=='yes'    Reject Pending Service Request
    # Validate Requester SR Chat Option
    Run Keyword If    '${vp_req_reject_chat_opt}'=='yes'    Validate Requester Rejected SR Chat Option
    # Validate Approver SR Chat Option
    Run Keyword If    '${vp_app_reject_chat_opt}'=='yes'    Validate Approver Rejected SR Chat Option
    ## Approver send message
    Run Keyword If    '${wf_app_send_msg}'=='yes'    Send Approver Chat Message
    # Requester Valdiate app message
    Run Keyword If    '${vp_app_chat_by_req}'=='yes'    Validate Approver Message By Requester For Inprogress SR
    # Requester Send Message
    Run Keyword If    '${wf_req_send_msg}'=='yes'    Send Requester Chat Message
    # Approver Valdiate Req message
    Run Keyword If    '${vp_req_chat_by_app}'=='yes'    Validate Requester Message By Approver For Inprogress SR
    # validate closed SR chat options
    Run Keyword If    '${vp_app_closed_chat_opt}'=='yes'    Validate Approver Closed SR Chat Option

#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------

Call User1 Request Impex
    [Arguments]    ${impx_ur1_update}    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}
    ${impx_ur1_update}=    Convert To Lowercase    ${impx_ur1_update}
    Run Keyword If    '${impx_ur1_update}'=='yes'    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}

Call User2 Request Impex
    [Arguments]    ${impx_ur2_update}    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}
    ${impx_ur1_update}=    Convert To Lowercase    ${impx_ur1_update}
    Run Keyword If    '${impx_ur2_update}'=='yes'    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}

Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${in_customer_email}    ${in_customer_password}
    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

Validate SR Status SR Details Page
    [Arguments]    ${start_date}    ${end_date}    ${status}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    # vslidate date range
    ServiceRequest_Keywords.Filter Service request    ${start_date}    ${end_date}    ${status}    ${EMPTY}
    @{filter_list} =    ServiceRequest_Keywords.Get All Service Request Column Values    Submitted
    ServiceRequest_Validations.Validate Service Request Filter By Date    ${filter_list}    ${start_date}    ${end_date}
    @{request_id_list} =    ServiceRequest_Keywords.Get All Service Request Column Values    Request ID
    : FOR    ${req_id}    IN    @{request_id_list}
    \    Common_Actions.Open Page    cintasrentalsstorefront/service-request/detail/${req_id}
    \    Validate SR Status Values From SR Page    ${status}

Create Service Request from Dashboard Page
    [Arguments]    ${wf_create_sr_dp}
    ${wf_create_sr_dp}=    Convert To Lowercase    ${wf_create_sr_dp}
    Run Keyword If    '${wf_create_sr_dp}'=='yes'    ServiceRequest_Keywords.Create Service Request from Dashboard Page    Add a Product    Subject: Create SR ${unique_key}    Description: Create SR ${unique_key}

Select Response for SR ApproveReject
    [Arguments]    ${wf_sr_reply}    ${in_sr_message}    ${in_sr_response}
    Run Keyword If    '${wf_sr_reply}' == 'TRUE' or '${wf_sr_reply}' == '1'    ServiceRequest_Keywords.Service Request Reply Decision    ${in_sr_message}    ${in_sr_response}

Validate Requester Pending SR Chat Option
    # Goto Service request Page
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Pending Service Request    ${unique_key}
    ServiceRequest_Validations.Validate Chat Message Components    Pending Approval

Validate Approver Pending SR Chat Option
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select Pending Service Request    ${unique_key}
    ServiceRequest_Validations.Validate Chat Message Components    Pending Approval

Approve Pending Service Request
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select an Service Request    ${unique_key}
    ServiceRequestDetails_Actions.Click Approve Button
    ServiceRequestDetails_Actions.Click Confirmation Approve Button
    ${request_id} =    ServiceRequest_Keywords.Get New Service Request ID
    Set Test Variable    ${request_id}
    [Return]    ${request_id}

Reject Pending Service Request
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select an Service Request    ${unique_key}
    # watiing for bug Fix
    Comment    ServiceRequestDetails_Actions.Enter Message    Sorry, SR is rejected
    Comment    ServiceRequestDetails_Actions.Click Reject Button
    Comment    ServiceRequestDetails_Actions.Click Confirmation Reject Button
    # reject by java scripts
    Execute Javascript    $('.btn.btn-primary').get(2).click()

Send Approver Chat Message
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    ${app_time_stamp}=    get_datetime_stamp
    Set Test Variable    ${app_time_stamp}
    Send Chat Message    SR Approved ${app_time_stamp}

Validate Approver Message By Requester For Inprogress SR
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur1_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    Validate Chat Message    1    Approver    SR Approved ${app_time_stamp}    ${todate}

Send Requester Chat Message
    ${req_time_stamp}=    get_datetime_stamp
    Set Test Variable    ${req_time_stamp}
    Send Chat Message    Thank You ${req_time_stamp}
    # Validation of req and app chat message
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    Validate Chat Message    2    Approver    SR Approved ${app_time_stamp}    ${todate}
    Validate Chat Message    1    Customer    Thank You ${req_time_stamp}    ${todate}

Validate Requester Message By Approver For Inprogress SR
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    Validate Chat Message    2    Approver    SR Approved ${app_time_stamp}    ${todate}
    Validate Chat Message    1    Customer    Thank You ${req_time_stamp}    ${todate}

Validate Approver Closed SR Chat Option
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select Closed Service Request    7000025047
    ServiceRequest_Validations.Validate Chat Message Components    Closed
    ServiceRequest_Validations.Validate Chat Message    1    Cintas    You're welcome. Thanks for your business!    Feb 23, 2017
    ServiceRequest_Validations.Validate Chat Message    2    Customer    Thank you for your response. Have a great day.    Feb 23, 2017
    ServiceRequest_Validations.Validate Chat Message    3    Cintas    Replying to a myCintas SR to test formatting. Thanks.    Feb 23, 2017

Validate Approver Rejected SR Chat Option
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select Rejected Service Request    ${unique_key}
    ServiceRequest_Validations.Validate Chat Message Components    Rejected

Validate Requester Rejected SR Chat Option
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select Rejected Service Request    ${unique_key}
    ServiceRequest_Validations.Validate Chat Message Components    Rejected

Chat Service Request Template1
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_ChatServiceRequest_Template.Set Template Test Data    ${tc_data}
    # change user1 role
    eSRVC_ChatServiceRequest_Template.Call User1 Request Impex    ${impx_ur1_update}    ${in_ur1_email}    ${impx_ur1_acc_type}    ${impx_first_login}
    # change user2 role
    eSRVC_ChatServiceRequest_Template.Call User2 Request Impex    ${impx_ur2_update}    ${in_ur2_email}    ${impx_ur2_acc_type}    ${impx_first_login}
    # Begin Test
    eSRVC_ChatServiceRequest_Template.Begin Test
    # Login to Front End
    eSRVC_ChatServiceRequest_Template.Login to Front End    ${in_ur1_email}    ${in_customer_password}
    # Create new serive request
    Create Service Request from Dashboard Page    ${wf_create_sr_dp}
    # Validate req pending chat option
    Run Keyword If    '${vp_req_cht_opt}'=='yes'    Validate Requester Pending SR Chat Option
    # Validate app pending chat option
    Run Keyword If    '${vp_app_cht_opt}'=='yes'    Validate Approver Pending SR Chat Option
    # Approve Pending SR
    Run Keyword If    '${wf_approve_sr}'=='yes'    Approve Pending Service Request
    # Reject Pending SR
    Run Keyword If    '${wf_reject_sr}'=='yes'    Reject Pending Service Request
    ## Approver send message
    Run Keyword If    '${wf_send_msg}'=='yes'    Send Approver Chat Message
    Comment    ## Requester
    Comment    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    Comment    ServiceRequest_Keywords.Select Requests To View    OTHER
    Comment    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    Comment    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    Comment    Validate Chat Message    1    Approver    SR Approved ${app_time_stamp}    ${todate}
    Comment    ##
    # Requester
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur1_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    Validate Chat Message    1    Approver    SR Approved ${app_time_stamp}    ${todate}
    #
    ${req_time_stamp}=    get_datetime_stamp
    Send Chat Message    Thank You ${app_time_stamp}
    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    Validate Chat Message    2    Approver    SR Approved ${app_time_stamp}    ${todate}
    Validate Chat Message    1    FN 50003441    Thank You ${req_time_stamp}    ${todate}
    ##
    # Approver Login
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_ur2_email}    ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Requests To View    OTHER
    ServiceRequest_Keywords.Select In-progress Service Request    ${request_id}
    ServiceRequest_Validations.Validate Chat Message Components    in-progress
    Validate Chat Message    2    Approver    SR Approved ${app_time_stamp}    ${todate}
    Validate Chat Message    1    FN 50003441    Thank You ${req_time_stamp}    ${todate}

#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Set Template Test Data
    [Arguments]    ${tc_data}
    ${testcase_name} =    Pop From Dictionary    ${tc_data}    testcase_name    default=${EMPTY}
    Set Test Variable    ${testcase_name}
    ${testcase_description} =    Pop From Dictionary    ${tc_data}    testcase_description    default=${EMPTY}
    Set Test Variable    ${testcase_description}
    # user1
    ${impx_ur1_update}=    Pop From Dictionary    ${tc_data}    impx_ur1_update    default=FALSE
    Set Test Variable    ${impx_ur1_update}
    ${impx_ur1_acc_type}=    Pop From Dictionary    ${tc_data}    impx_ur1_acc_type    default=${EMPTY}
    Set Test Variable    ${impx_ur1_acc_type}
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
    # Set user login status
    ${impx_first_login}=    Set Variable    ${False}
    Set Test Variable    ${impx_first_login}
    # Create SR from dash board
    ${wf_create_sr_dp}=    Pop From Dictionary    ${tc_data}    wf_create_sr_dp    default=${EMPTY}
    ${wf_create_sr_dp}=    Convert To Lowercase    ${wf_create_sr_dp}
    Set Test Variable    ${wf_create_sr_dp}
    # create unique key using timestamp
    ${unique_key} =    get_datetime_stamp
    Set Test Variable    ${unique_key}
    # Todate
    Comment    ${day_year}=    Get Current Date    result_format=%d,%Y
    Comment    ${today}=    Catenate    Nov    ${day_year}
    Comment    ${yy}    ${mm}    ${dd}    Get Time    year,month,day
    # Month need to be convert to word
    ${todate}=    Get Current Date    result_format=%b %d, %Y
    Comment    ${todate}=    Catenate    Nov    ${dd},    ${yy}
    Set Test Variable    ${todate}
    # Validate req pending chat option
    ${vp_req_cht_opt}=    Pop From Dictionary    ${tc_data}    vp_req_cht_opt    default=${EMPTY}
    ${vp_req_cht_opt}=    Convert To Lowercase    ${vp_req_cht_opt}
    Set Test Variable    ${vp_req_cht_opt}
    # Validate app pending chat option
    ${vp_app_cht_opt}=    Pop From Dictionary    ${tc_data}    vp_app_cht_opt    default=${EMPTY}
    ${vp_app_cht_opt}=    Convert To Lowercase    ${vp_app_cht_opt}
    Set Test Variable    ${vp_app_cht_opt}
    # Approve Pending SR
    ${wf_approve_sr}=    Pop From Dictionary    ${tc_data}    wf_approve_sr    default=${EMPTY}
    ${wf_approve_sr}=    Convert To Lowercase    ${wf_approve_sr}
    Set Test Variable    ${wf_approve_sr}
    # Reject Pending SR
    ${wf_reject_sr}=    Pop From Dictionary    ${tc_data}    wf_reject_sr    default=${EMPTY}
    ${wf_reject_sr}=    Convert To Lowercase    ${wf_reject_sr}
    Set Test Variable    ${wf_reject_sr}
    # Approver Send Message
    ${wf_app_send_msg}=    Pop From Dictionary    ${tc_data}    wf_app_send_msg    default=${EMPTY}
    ${wf_app_send_msg}=    Convert To Lowercase    ${wf_app_send_msg}
    Set Test Variable    ${wf_app_send_msg}
    # Requester validate app message
    ${vp_app_chat_by_req}=    Pop From Dictionary    ${tc_data}    vp_app_chat_by_req    default=${EMPTY}
    ${vp_app_chat_by_req}=    Convert To Lowercase    ${vp_app_chat_by_req}
    Set Test Variable    ${vp_app_chat_by_req}
    # Requester send message
    ${wf_req_send_msg}=    Pop From Dictionary    ${tc_data}    wf_req_send_msg    default=${EMPTY}
    ${wf_req_send_msg}=    Convert To Lowercase    ${wf_req_send_msg}
    Set Test Variable    ${wf_req_send_msg}
    # App validate req message
    ${vp_req_chat_by_app}=    Pop From Dictionary    ${tc_data}    vp_req_chat_by_app    default=${EMPTY}
    ${vp_req_chat_by_app}=    Convert To Lowercase    ${vp_req_chat_by_app}
    Set Test Variable    ${vp_req_chat_by_app}
    # REQ closed chat opt
    ${vp_req_closed_chat_opt}=    Pop From Dictionary    ${tc_data}    vp_req_closed_chat_opt    default=${EMPTY}
    ${vp_req_closed_chat_opt}=    Convert To Lowercase    ${vp_req_closed_chat_opt}
    Set Test Variable    ${vp_req_closed_chat_opt}
    # App closed chat opt
    ${vp_app_closed_chat_opt}=    Pop From Dictionary    ${tc_data}    vp_app_closed_chat_opt    default=${EMPTY}
    ${vp_app_closed_chat_opt}=    Convert To Lowercase    ${vp_app_closed_chat_opt}
    Set Test Variable    ${vp_app_closed_chat_opt}
    # Validate Approver SR Chat Option
    ${vp_app_reject_chat_opt}=    Pop From Dictionary    ${tc_data}    vp_app_reject_chat_opt    default=${EMPTY}
    ${vp_app_reject_chat_opt}=    Convert To Lowercase    ${vp_app_reject_chat_opt}
    Set Test Variable    ${vp_app_reject_chat_opt}
    # Validate Req SR Chat Option
    ${vp_req_reject_chat_opt}=    Pop From Dictionary    ${tc_data}    vp_app_reject_chat_opt    default=${EMPTY}
    ${vp_req_reject_chat_opt}=    Convert To Lowercase    ${vp_req_reject_chat_opt}
    Set Test Variable    ${vp_req_reject_chat_opt}
    # Billing Invoice
    ${vp_inv_content}=    Pop From Dictionary    ${tc_data}    vp_inv_content    default=${EMPTY}
    ${vp_inv_content}=    Convert To Lowercase    ${vp_inv_content}
    Set Test Variable    ${vp_inv_content}
    # Search Filter-vp filter
    ${vp_filter}=    Pop From Dictionary    ${tc_data}    vp_filter    default=${EMPTY}
    ${vp_filter}=    Convert To Lowercase    ${vp_filter}
    Set Test Variable    ${vp_filter}
    # Search Filter-start date
    ${in_start_date}=    Pop From Dictionary    ${tc_data}    in_start_date    default=${EMPTY}
    ${in_start_date}=    Convert To Lowercase    ${in_start_date}
    Set Test Variable    ${in_start_date}
    # Search Filter-End date
    ${in_end_date}=    Pop From Dictionary    ${tc_data}    in_end_date    default=${EMPTY}
    Set Test Variable    ${in_end_date}
    # Search Filter-End date
    ${in_status}    Pop From Dictionary    ${tc_data}    in_status    default=${EMPTY}
    Set Test Variable    ${in_status}


