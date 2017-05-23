*** Settings ***
Resource          Common_Validation.robot
Resource          ../PageObjects/ServiceRequest_Page.robot
Resource          ../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../PageActions/ServiceRequest_Actions.robot
Resource          ../PageActions/ServiceRequestDetails_Actions.robot
Resource          ../PageValidations/GlobalMessage_Validations.robot
Resource          GlobalMessage_Validations.robot
Resource          ../PageObjects/Header_Page.robot
Library           ../../../../hybris-automation-shared/Libraries/DateUtils.py
Library           ../../../../hybris-automation-shared/Libraries/StringUtils.py
Library           Collections

*** Keywords ***
Validate Headers
    [Arguments]    ${requests_to_view}
    Run Keyword If    '${requests_to_view}' == 'OTHER'    ServiceRequest_Validations.Validate Headers Others Requests
    ...    ELSE    ServiceRequest_Validations.Validate Headers My Requests

Validate Headers My Requests
    ${last_name} =    ServiceRequest_Page.divLastName
    ${first_name} =    ServiceRequest_Page.divFirstName
    ${email} =    ServiceRequest_Page.divEmail
    ${request_id} =    ServiceRequest_Page.divServiceRequestId
    ${submitted} =    ServiceRequest_Page.divSubmitted
    ${description} =    ServiceRequest_Page.divSubject
    run keyword and continue on failure    page should not contain element    ${last_name}
    run keyword and continue on failure    page should not contain element    ${first_name}
    run keyword and continue on failure    page should not contain element    ${email}
    run keyword and continue on failure    page should contain element    ${request_id}
    run keyword and continue on failure    page should contain element    ${submitted}
    run keyword and continue on failure    page should contain element    ${description}

Validate Headers Others Requests
    ${request_id} =    ServiceRequest_Page.divServiceRequestId
    ${last_name} =    ServiceRequest_Page.divLastName
    ${first_name} =    ServiceRequest_Page.divFirstName
    ${email} =    ServiceRequest_Page.divEmail
    ${submitted} =    ServiceRequest_Page.divSubmitted
    ${description} =    ServiceRequest_Page.divSubject
    run keyword and continue on failure    page should not contain element    ${request_id}
    run keyword and continue on failure    page should contain element    ${last_name}
    run keyword and continue on failure    page should contain element    ${first_name}
    run keyword and continue on failure    page should contain element    ${email}
    run keyword and continue on failure    page should contain element    ${submitted}
    run keyword and continue on failure    page should contain element    ${description}

Validate Headers Others Requests Rejected
    ${request_id} =    ServiceRequest_Page.divServiceRequestId
    ${submitted} =    ServiceRequest_Page.divSubmitted
    ${description} =    ServiceRequest_Page.divSubject
    ${rejected} =    ServiceRequest_Page.divRejected
    ${last_name} =    ServiceRequest_Page.divLastName
    ${first_name} =    ServiceRequest_Page.divFirstName
    ${email} =    ServiceRequest_Page.divEmail
    run keyword and continue on failure    page should not contain element    ${request_id}
    run keyword and continue on failure    page should not contain element    ${submitted}
    run keyword and continue on failure    page should contain element    ${rejected}
    run keyword and continue on failure    page should contain element    ${last_name}
    run keyword and continue on failure    page should contain element    ${first_name}
    run keyword and continue on failure    page should contain element    ${email}
    run keyword and continue on failure    page should contain element    ${description}

Validate Service Request Filter
    [Arguments]    ${filter_type}    ${column_name}    ${start_date}    ${end_date}    ${status_text}    ${search_text}
    @{filter_list} =    ServiceRequest_Keywords.Get All Service Request Column Values    ${column_name}
    @{filter_list_lower} =    Run Keyword If    '${filter_type}' == 'TEXT'    convert_list_to_lowercase    ${filter_list}
    ${search_text_lower} =    Run Keyword If    '${filter_type}' == 'TEXT'    Convert To Lowercase    ${search_text}
    Run Keyword If    '${filter_type}' == 'TEXT'    ServiceRequest_Validations.Validate Service Request Filter By Text    ${filter_list_lower}    ${search_text_lower}
    Run Keyword If    '${filter_type}' == 'DATE'    ServiceRequest_Validations.Validate Service Request Filter By Date    ${filter_list}    ${start_date}    ${end_date}
    Run Keyword If    '${filter_type}' == 'STATUS'    ServiceRequest_Validations.Validate Service Request Filter By Status    ${filter_list}    ${status_text}

Validate Service Request Sort Asc And Dec
    [Arguments]    ${column_name}
    Run Keyword If    '${column_name}' == 'Submitted'    Validate Service Request Sort Asc And Dec Dates    ${column_name}
    Run Keyword If    '${column_name}' != 'Submitted'    Validate Service Request Sort Asc And Dec Others    ${column_name}

Validate Service Request Sort Asc And Dec Dates
    [Arguments]    ${column_name}
    # Validate Ascending Sort
    ServiceRequest_Keywords.Sort Service Request    ${column_name}    ASCENDING
    @{actual_list_asc} =    ServiceRequest_Keywords.Get All Service Request Column Values    ${column_name}
    @{sorted_sr_list_asc} =    Copy list    ${actual_list_asc}
    @{sorted_sr_list_asc} =    sort_date_list    ${sorted_sr_list_asc}    %m/%d/%Y
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_asc}    ${actual_list_asc}
    # Click Search to return to page 1
    ServiceRequest_Actions.Click Search Button
    ServiceRequest_Keywords.Sort Service Request Descending    ${column_name}
    @{actual_list_dec} =    ServiceRequest_Keywords.Get All Service Request Column Values    ${column_name}
    @{sorted_sr_list_dec} =    Copy list    ${actual_list_dec}
    @{sorted_sr_list_dec} =    sort_date_list    ${sorted_sr_list_dec}    %m/%d/%Y
    Reverse List    ${sorted_sr_list_dec}
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_dec}    ${actual_list_dec}

Validate Service Request Sort Asc And Dec Others
    [Arguments]    ${column_name}
    # Validate Ascending Sort
    ServiceRequest_Keywords.Sort Service Request    ${column_name}    ASCENDING
    @{actual_list_asc} =    ServiceRequest_Keywords.Get All Service Request Column Values    ${column_name}
    @{sorted_sr_list_asc} =    Copy list    ${actual_list_asc}
    Sort list    ${sorted_sr_list_asc}
    log    Sorted Ascending
    : FOR    ${item}    IN    @{actual_list_asc}
    \    log    ${item}
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_asc}    ${actual_list_asc}
    # Click Search to return to page 1
    ServiceRequest_Actions.Click Search Button
    ServiceRequest_Keywords.Sort Service Request Descending    ${column_name}
    @{actual_list_dec} =    ServiceRequest_Keywords.Get All Service Request Column Values    ${column_name}
    @{sorted_sr_list_dec} =    Copy list    ${actual_list_dec}
    Sort list    ${sorted_sr_list_dec}
    Reverse List    ${sorted_sr_list_dec}
    log    Sorted Descending
    : FOR    ${item}    IN    @{actual_list_dec}
    \    log    ${item}
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_dec}    ${actual_list_dec}

Validate Service Request Filter By Text
    [Arguments]    ${sr_list}    ${filter_text}
    : FOR    ${sr}    IN    @{sr_list}
    \    run keyword and continue on failure    should contain    ${sr}    ${filter_text}    msg=Error - '${sr}' - did not contain text '${filter_text}'

Validate Service Request Filter By Date
    [Arguments]    ${sr_list}    ${start_date}    ${end_date}
    : FOR    ${sr}    IN    @{sr_list}
    \    ${result} =    validate_date_in_range    ${sr}    ${start_date}    ${end_date}    %m/%d/%Y
    \    run keyword and continue on failure    should be true    '${result}' == 'True'    msg=Error - Date not in range. Date: ${sr} - Start Date: ${start_date} - End Date: ${end_date}

Validate Service Request Filter By Status
    # To Be Completed (Waiting on Details)

Validate Request Count
    [Arguments]    ${min_request_count}
    ${total_row} =    Get Service Request Row Count
    run keyword and continue on failure    should be true    ${total_row} >= ${min_request_count}

Validate Search field values
    [Arguments]    ${dateRange_value}    ${sr_status}    ${search_text}
    ${actual_dateRange_value}=    ServiceRequest_Actions.Get DateRangePicker Value
    run keyword and continue on failure    Should Be Equal    ${dateRange_value}    ${actual_dateRange_value}
    ${actual_status_value}=    ServiceRequest_Actions.Get Service Request Status Value
    run keyword and continue on failure    Should Be Equal    ${sr_status}    ${actual_status_value}
    ${actual_search_text}=    ServiceRequest_Actions.Get Service Request Search Text
    run keyword and continue on failure    Should Be Equal    ${search_text}    ${actual_search_text}

Validate Default Search Field values
    [Arguments]    ${requests_to_view}
    Run Keyword if    '${requests_to_view}' == 'MINE'    ServiceRequest_Validations.Validate Search field values    ${EMPTY}    In Progress    ${EMPTY}
    Run Keyword If    '${requests_to_view}' == 'OTHER'    ServiceRequest_Validations.Validate Search field values    ${EMPTY}    Pending Approval    ${EMPTY}

Validate Available Buttons
    [Arguments]    ${impx_ur_account_type}
    Run Keyword if    '${impx_ur_account_type}' == 'SR-APPROVER'    ServiceRequest_Validations.Validate Available Buttons Approver
    ...    ELSE    ServiceRequest_Validations.Validate Available Buttons Other

Validate Available Buttons Approver
    ${my_requests} =    ServiceRequest_Page.btnManageMyRequest
    ${other_requests} =    ServiceRequest_Page.btnManageOtherUserRequest
    ${create_requests} =    ServiceRequest_Page.btnCreateNewRequest
    run keyword and continue on failure    page should contain element    ${my_requests}
    run keyword and continue on failure    page should contain element    ${other_requests}
    run keyword and continue on failure    page should contain element    ${create_requests}

Validate Available Buttons Other
    ${my_requests} =    ServiceRequest_Page.btnManageMyRequest
    ${other_requests} =    ServiceRequest_Page.btnManageOtherUserRequest
    ${create_requests} =    ServiceRequest_Page.btnCreateNewRequest
    run keyword and continue on failure    page should contain element    ${my_requests}
    run keyword and continue on failure    page should not contain element    ${other_requests}
    run keyword and continue on failure    page should contain element    ${create_requests}

Validate Rejection of Pending SR
    [Arguments]    ${sr_unique_cell_value}    ${message}    ${msg}
    ServiceRequest_Keywords.Service Request Reply    ${sr_unique_cell_value}    ${message}    REJECT
    Run Keyword If    '${message}'!='${EMPTY}' '    GlobalMessage_Validations.Validate Message Contains    ${msg}
    ...    ELSE    ServiceRequestDetails_Actions.Get Message Box Error Text    ${msg}

Validate SR Confirmation Cancel
    ${act_error_msg}=    ServiceRequestDetails_Actions.Get Message Box Error Text
    ${exp_error_message}=    Set Variable    This field is required for rejecting this service request.
    Run Keyword And Continue On Failure    Should Be Equal    ${act_error_msg}

Validate Approval Confirmation Cancel
    [Arguments]    ${sr_unique_cell_value}    ${message}
    # *** VALIDATION OF SAME ELEMENT???
    ServiceRequest_Keywords.Service Request Reply    ${sr_unique_cell_value}    ${message}    APPROVE
    ${el1} =    GlobalMessage_Page.divGlobalMessage
    run keyword and continue on failure    page should not contain element    ${el1}
    ${el2} =    ServiceRequestDetails_Page.divApproveServiceRequestModal
    run keyword and continue on failure    page should not contain element    ${el2}

Validate Rejection Confirmation Cancel
    [Arguments]    ${sr_unique_cell_value}    ${message}
    ServiceRequest_Keywords.Service Request Reply    ${sr_unique_cell_value}    ${message}    REJECT
    ${el1} =    GlobalMessage_Page.divGlobalMessage
    run keyword and continue on failure    page should not contain element    ${el1}
    ${el2} =    ServiceRequestDetails_Page.divRejectServiceRequestModal
    run keyword and continue on failure    page should not contain element    ${el2}

Validate SR Listing Page Buttons
    [Arguments]    ${requests_to_view}
    Run Keyword If    '${requests_to_view}' == 'OTHER'    ServiceRequest_Validations.Validate SR Listing Page Approver Buttons
    ...    ELSE    ServiceRequest_Validations.Validate SR Listing Page Non-Approver Buttons

Validate SR Listing Page Approver Buttons
    ${my_request} =    ServiceRequest_Page.btnManageMyRequest
    ${other_request} =    ServiceRequest_Page.btnManageOtherUserRequest
    ${new_request} =    ServiceRequest_Page.btnCreateNewRequest
    run keyword and continue on failure    Page Should Contain Element    ${my_request}
    run keyword and continue on failure    Page Should Contain Element    ${other_request}
    run keyword and continue on failure    Page Should Contain Element    ${new_request}

Validate SR Listing Page Non-Approver Buttons
    ${other_user} =    ServiceRequest_Page.btnManageOtherUserRequest
    ${new_request} =    ServiceRequest_Page.btnCreateNewRequest
    run keyword and continue on failure    Page Should Contain Element    ${other_user}
    run keyword and continue on failure    Page Should Contain Element    ${new_request}

Validate Visible Fields for SR Status
    [Arguments]    ${sr_status}
    Run Keyword If    '${sr_status}'=='Rejected'    Validate Visible Fields for Rejected Status
    Run Keyword If    '${sr_status}'=='Pending Approval'    Validate Visible Fields for Pending Approval Status

Validate Visible Fields for Rejected Status
    ${rejected} =    ServiceRequest_Page.divRejected
    ${last_name} =    ServiceRequest_Page.divLastName
    ${first_name} =    ServiceRequest_Page.divFirstName
    ${email} =    ServiceRequest_Page.divEmail
    ${description} =    ServiceRequest_Page.divDescription
    ServiceRequest_Actions.Select Status    Rejected
    run keyword and continue on failure    page should contain element    ${rejected}
    run keyword and continue on failure    page should contain element    ${last_name}
    run keyword and continue on failure    page should contain element    ${first_name}
    run keyword and continue on failure    page should contain element    ${email}
    run keyword and continue on failure    page should contain element    ${description}

Validate Visible Fields for Pending Approval Status
    ${submitted} =    ServiceRequest_Page.divSubmitted
    ${last_name} =    ServiceRequest_Page.divLastName
    ${first_name} =    ServiceRequest_Page.divFirstName
    ${email} =    ServiceRequest_Page.divEmail
    ${description} =    ServiceRequest_Page.divDescription
    ServiceRequest_Actions.Select Status    Pending Approval
    run keyword and continue on failure    page should contain element    ${submitted}
    run keyword and continue on failure    page should contain element    ${last_name}
    run keyword and continue on failure    page should contain element    ${first_name}
    run keyword and continue on failure    page should contain element    ${email}
    run keyword and continue on failure    page should contain element    ${description}

Validate Service Request Search Result
    [Arguments]    ${column_name}    ${search_text}
    Search Service request    ${search_text}
    @{filter_list} =    ServiceRequest_Keywords.Get All Service Request Column Values    ${column_name}
    Run Keyword If    '${search_text}' == '${EMPTY}'    ServiceRequest_Validations.Validate Service Request Filter By Text    ${filter_list}    ${search_text}

Validate SR Reject Error Message
    ${act_error_msg}=    ServiceRequestDetails_Actions.Get Message Box Error Text
    ${exp_error_message}=    Set Variable    This field is required for rejecting this service request.
    Run Keyword And Continue On Failure    Should Be Equal    ${act_error_msg}    ${exp_error_message}

Validate Approval of Pending SR
    [Arguments]    ${response}
    ${el1} =    GlobalMessage_Page.divGlobalMessage
    Run Keyword If    '${response}' == 'APPROVE'    GlobalMessage_Validations.Validate Message Contains    Your request has been submitted to Cintas, request ID
    Run Keyword If    '${response}' == 'REJECT'    GlobalMessage_Validations.Validate Message Contains    You have rejected the requested service reques
    Run Keyword If    '${response}' == 'APPROVECANCEL'    run keyword and continue on failure    page should not contain element    ${el1}
    Run Keyword If    '${response}' == 'REJECTCANCEL'    run keyword and continue on failure    page should not contain element    ${el1}

Validate SR Detail Page Elements
    [Arguments]    ${requests_to_view}
    Run Keyword If    '${requests_to_view}' == 'OTHER'    ServiceRequest_Validations.Validate SR Detail Page Approver Elements
    Run Keyword If    '${requests_to_view}' == 'MINE'    ServiceRequest_Validations.Validate SR Detail Page Non-Approver Elements

Validate SR Detail Page Approver Elements
    ${btn_back} =    ServiceRequestDetails_Page.btnBack
    ${btn_approve} =    ServiceRequestDetails_Page.btnApprove
    ${btn_reject} =    ServiceRequestDetails_Page.btnReject
    ${txt_message} =    ServiceRequestDetails_Page.txtMessage
    run keyword and continue on failure    Page Should Contain Element    ${btn_back}
    run keyword and continue on failure    Page Should Contain Element    ${btn_approve}
    run keyword and continue on failure    Page Should Contain Element    ${btn_reject}
    run keyword and continue on failure    Page Should Contain Element    ${txt_message}

Validate SR Detail Page Non-Approver Elements
    ${btn_back} =    ServiceRequestDetails_Page.btnBack
    ${btn_approve} =    ServiceRequestDetails_Page.btnApprove
    ${btn_reject} =    ServiceRequestDetails_Page.btnReject
    ${txt_message} =    ServiceRequestDetails_Page.txtMessage
    run keyword and continue on failure    Page Should Contain Element    ${btn_back}
    run keyword and continue on failure    Page Should not Contain Element    ${btn_approve}
    run keyword and continue on failure    Page Should not Contain Element    ${btn_reject}
    run keyword and continue on failure    Page Should not Contain Element    ${txt_message}

Validate SR Detail Values
    [Arguments]    ${last_name}    ${first_name}
    @{date_time}=    Split String    ${impx_sr_creation_time}
    @{Date}=    Split String    @{date_time}[0]    -
    ${submitted_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    ${last_name}=    Set Variable    ${last_name}    #LN 50003459
    ${first_name}=    Set Variable    ${first_name}    #FN 50003459
    ${email}=    Set Variable    ${impx_sr_requester}
    ${subject}=    Catenate    SEPARATOR=${SPACE}    ${testcase_name}    Subject    @{sr_list}[0]
    ${description}=    Catenate    SEPARATOR=${SPACE}    ${testcase_name}    Description    @{sr_list}[0]
    ${actual_submitted_date} =    ServiceRequestDetails_Actions.Get Date Submitted Text
    ${actual_last_name} =    ServiceRequestDetails_Actions.Get Last Name
    ${actual_first_name} =    ServiceRequestDetails_Actions.Get First Name
    ${actual_email} =    ServiceRequestDetails_Actions.Get Email
    ${actual_subject} =    ServiceRequestDetails_Actions.Get Subject
    ${actual_description} =    ServiceRequestDetails_Actions.Get Description
    run keyword and continue on failure    Should Be Equal    ${submitted_date}    ${actual_submitted_date}
    run keyword and continue on failure    Should Be Equal    ${last_name}    ${actual_last_name}
    run keyword and continue on failure    Should Be Equal    ${first_name}    ${actual_first_name}
    run keyword and continue on failure    Should Be Equal    ${email}    ${actual_email}
    run keyword and continue on failure    Should Contain    ${actual_subject}    ${subject}
    run keyword and continue on failure    Should Contain    ${actual_description}    ${description}

Validate Default Sorting
    run keyword and continue on failure    ServiceRequest_Validations.Validate Pending Approval Default Sorting
    run keyword and continue on failure    ServiceRequest_Validations.Validate Rejected Default Sorting

Validate Rejected Default Sorting
    ServiceRequest_Actions.Filter By Status    Rejected
    @{actual_list_dec} =    ServiceRequest_Keywords.Get All Service Request Column Values    Rejected
    @{sorted_sr_list_dec} =    Copy list    ${actual_list_dec}
    ${sorted_sr_list_dec} =    sort_date_list    ${sorted_sr_list_dec}    %m/%d/%Y
    Reverse List    ${sorted_sr_list_dec}
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_dec}    ${actual_list_dec}

Validate Pending Approval Default Sorting
    ServiceRequest_Actions.Filter By Status    Pending Approval
    @{actual_list_asc} =    ServiceRequest_Keywords.Get All Service Request Column Values    Submitted
    @{sorted_sr_list_asc} =    Copy list    ${actual_list_asc}
    ${sorted_sr_list_asc} =    sort_date_list    ${sorted_sr_list_asc}    %m/%d/%Y
    run keyword and continue on failure    Lists should be equal    ${sorted_sr_list_asc}    ${actual_list_asc}

Validate Search Error Messages
    ServiceRequest_Keywords.Search Service request    C
    GlobalMessage_Validations.Validate Message Contains    Please enter at least 3 characters to search.
    ServiceRequest_Keywords.Search Service request    CN
    GlobalMessage_Validations.Validate Message Contains    Please enter at least 3 characters to search.
    ServiceRequest_Keywords.Search Service request    CNTR
    ${global_message_element} =    GlobalMessage_Page.divGlobalMessage
    run keyword and continue on failure    page should not contain element    ${global_message_element}

Validate Create SR Mandatory Fields
    [Arguments]    ${subject}    ${details}
    ServiceRequest_Actions.Click Create New Request Button
    ServiceRequest_Keywords.Create Service Request By Selecting Message Category    ${in_msg_category}    ${in_subject}    ${in_details}
    Run Keyword If    '${subject}'!='${EMPTY}'    CreateNewRequest_Actions.Enter Subject    ${subject}
    Run Keyword If    '${details}'!='${EMPTY}'    CreateNewRequest_Actions.Enter Details    ${details}
    CreateNewRequest_Actions.Click Submit Message
    Common_Actions.Wait For Loading
    Run Keyword If    '${subject}'!='${EMPTY}' and '${details}'!='${EMPTY}'    GlobalMessage_Validations.Validate Message Contains    Your request have been submitted for approval
    ...    ELSE    GlobalMessage_Validations.Validate Message Contains    Please fill all mandatory fields before submit request.

Validate Top Menu Approval Option
    [Arguments]    ${impx_ur_account_type}
    Run Keyword If    '${impx_ur_account_type}' == 'SR-APPROVER'    ServiceRequest_Validations.Validate Approver Top Menu
    Run Keyword If    '${impx_ur_account_type}' == 'WEARER-EDITOR'    ServiceRequest_Validations.Validate Non-Approver Top Menu

Validate Approver Top Menu
    ${el1}=    Header_Page.lnkOpenApprovals
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    ${el2}=    Header_Page.divOpenApprovalsCount
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    ${el3}=    Header_Page.lnkOpenApprovals
    Mouse Over    ${el3}
    ${el4}=    Header_Page.lnkApprovalsServiceRequests
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}

Validate Non-Approver Top Menu
    ${locator}=    Header_Page.divOpenApprovalsCount
    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${locator}
    ${el1}=    Header_Page.lnkApprovalsServiceRequests
    Run Keyword And Continue On Failure    Page Should not Contain Element    ${el1}

Validate Approver Chat Message
    [Arguments]    ${title}    ${msg_text}    ${time_stamp}
    ${act_title}=    ServiceRequestDetails_Actions.Get Msg Author Title    ${msg_number}
    Run Keyword And Continue On Failure    Should Contain    ${act_title}    ${title}
    ${act_msg_text}=    ServiceRequestDetails_Actions.Get Msg Text    ${msg_number}
    Run Keyword And Continue On Failure    Should Contain    ${act_msg_text}    ${msg_text}
    ${act_time_stamp}=    ServiceRequestDetails_Actions.Get Msg Time Stamp    ${msg_number}
    Run Keyword And Continue On Failure    Should Contain    ${act_time_stamp}    ${time_stamp}

Validate Chat Message
    [Arguments]    ${msg_number}    ${title}    ${msg_text}    ${time_stamp}
    ${act_title}=    ServiceRequestDetails_Actions.Get Msg Author Title    ${msg_number}
    Run Keyword And Continue On Failure    Should Contain    ${act_title}    ${title}
    ${act_msg_text}=    ServiceRequestDetails_Actions.Get Msg Text    ${msg_number}
    Run Keyword And Continue On Failure    Should Contain    ${act_msg_text}    ${msg_text}
    Comment    ${act_time_stamp}=    ServiceRequestDetails_Actions.Get Msg Time Stamp    ${msg_number}
    Comment    Run Keyword And Continue On Failure    Should Contain    ${act_time_stamp}    ${time_stamp}

Validate Chat Message Components
    [Arguments]    ${sr_status}
    ${sr_status}    Convert To Lowercase    ${sr_status}
    # Reply Label
    ${el1}=    ServiceRequestDetails_Page.lblReply
    Run Keyword If    '${sr_status}'=='in-progress'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword If    '${sr_status}'!='in-progress'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el1}
    # Message Box
    ${el2}=    ServiceRequestDetails_Page.txtRequestChat
    Run Keyword If    '${sr_status}'=='in-progress'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword If    '${sr_status}'!='in-progress'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el2}
    # Send Button
    ${el2}=    ServiceRequestDetails_Page.btnSubmitChat
    Run Keyword If    '${sr_status}'=='in-progress'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword If    '${sr_status}'!='in-progress'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el2}

Validate SR Status Values From SR Page
    [Arguments]    ${exp_status}
    ${actual_status} =    ServiceRequestDetails_Actions.Get SR Status
    run keyword and continue on failure    Should Be Equal    ${actual_status}    ${exp_status}

Validate Subject Header Text
    [Documentation]    This keyword is applicable only for approval.
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    Click Manage My Request Button
    ${el_sub_title}=    ServiceRequest_Page.divSubjectTitle
    ${sub_title}=    Get Text    ${el_sub_title}
    run keyword and continue on failure    page should not contain element    ${sub_title}    Subject
    Click Manage Other User Request Button
    ${el_sub_title}=    ServiceRequest_Page.divSubjectTitle
    ${sub_title}=    Get Text    ${el_sub_title}
    run keyword and continue on failure    page should not contain element    ${sub_title}    Subject

Validate SR Message Category
    [Arguments]    ${user_role}
    [Documentation]    This keyword is applicable only for approval.
    ServiceRequestDetails_Actions.Select Message Category    ${category}
    ${locator} =    ServiceRequestDetails_Page.buttonMessageCategory
    Wait Until Page Contains Element    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
    # Group-1
    ${el1} =    ServiceRequestDetails_Page.spnMessageCategoryText    Billing Question
    ${el2} =    ServiceRequestDetails_Page.spnMessageCategoryText    Product or Service Issue
    ${el3} =    ServiceRequestDetails_Page.spnMessageCategoryText    General Inquiry
    # Group-2
    ${el4} =    ServiceRequestDetails_Page.spnMessageCategoryText    Add a Product
    ${el5} =    ServiceRequestDetails_Page.spnMessageCategoryText    Change Current Product or Service
    # Validation
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    # only contact or wearer editor should have these
    Run Keyword If    '${user_role}'=='contract-editor' or '${user_role}'=='wearer-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    Run Keyword If    '${user_role}'=='contract-editor' or '${user_role}'=='wearer-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el5}
    # Other contact should not have this
    Run Keyword If    '${user_role}'!='contract-editor' or '${user_role}'!='wearer-editor'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el4}
    Run Keyword If    '${user_role}'!='contract-editor' or '${user_role}'!='wearer-editor'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el5}

Validate Message Category Global Message
    [Arguments]    ${msg_group}
    [Documentation]    This keyword is applicable only for approval.
    #Group1
    Create Service Request By Selecting Message Category
    GlobalMessage_Validations.Validate Message Contains    Your request has been submitted to Cintas, request ID
    Select Pending Service Request
    #Group2
    Create Service Request By Selecting Message Category
    GlobalMessage_Validations.Validate Message Contains    Your request has been submitted to Cintas, request ID
    Select Pending Service Request

Validate Message Category Appended in Subject Text
    [Arguments]    ${msg_group}
    [Documentation]    This keyword is applicable only for approval.
    #Group1
    Create Service Request By Selecting Message Category    Add a Product    Subject: ${unique_key}    Description: ${unique_key}
    GlobalMessage_Validations.Validate Message Contains    Your request has been submitted to Cintas, request ID
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select Pending Service Request    ${unique_key}
    #Group2
    Create Service Request By Selecting Message Category
    GlobalMessage_Validations.Validate Message Contains    Your request has been submitted to Cintas, request ID
    Select Pending Service Request

Validate Message Category Appended in Subject Text1
    [Arguments]    ${msg_group}  ${in_subject}
    [Documentation]    This keyword is applicable only for approval.
    #Group1
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    Run Keyword If    '${msg_group}' == 'group2'    ServiceRequest_Keywords.Search Pending Service Request    ${unique_key}
    Run Keyword If    '${msg_group}' == 'group12'     ServiceRequest_Keywords.Search In-progress Service Request    ${request_id}
    ${subject_text} =    ServiceRequest_Actions.Get Service Request Table Cell Value  Subject  1
    run keyword and continue on failure  should contain  ${subject_text}  ${in_subject}

# Validate All field values for all SR types
Validate Detail Values for All Types of SR
    [Arguments]    ${request_id}  ${submitted_date}  ${last_name}  ${first_name}  ${email}  ${subject}   ${description}  ${selected_account}   ${additional_accounts_linked}  ${requester_comment}   ${approver_details}  ${approver_comment}
    ${actual_request_id} =   Run Keyword If  '${request_id}'!='${EMPTY}'  ServiceRequestDetails_Actions.Get Request ID
    ${actual_submitted_date} =    ServiceRequestDetails_Actions.Get Date Submitted Text
    ${actual_last_name} =    ServiceRequestDetails_Actions.Get Last Name
    ${actual_first_name} =    ServiceRequestDetails_Actions.Get First Name
    ${actual_email} =    ServiceRequestDetails_Actions.Get Email
    ${actual_subject} =    ServiceRequestDetails_Actions.Get Subject
    ${actual_description} =    ServiceRequestDetails_Actions.Get Description
    ${actual_selected_account} =  Run Keyword If  '${selected_account}'!='${EMPTY}'  ServiceRequestDetails_Actions.Get System Selected Account
    ${actual_additional_accounts_linked} =  Run Keyword If  '${additional_accounts_linked}'!='${EMPTY}'  ServiceRequestDetails_Actions.Get Additional Accounts Linked To Use
    ${actual_requester_comment} =   Run Keyword If  '${requester_comment}'!='${EMPTY}'  ServiceRequestDetails_Actions.Get Comments From Requester
    ${actual_approver_details} =   Run Keyword If  '${approver_details}'!='${EMPTY}'  ServiceRequestDetails_Actions.Get Service Request Approver Details
    ${actual_approver_comment} =   Run Keyword If  '${approver_comment}'!='${EMPTY}'  ServiceRequestDetails_Actions.Get Comments From Approver
    # verification
    Run Keyword If  '${request_id}'!='${EMPTY}'  run keyword and continue on failure    Should Be Equal    ${request id}    ${actual_request_id}
    run keyword and continue on failure    Should Be Equal    ${submitted_date}    ${actual_submitted_date}
    run keyword and continue on failure    Should Be Equal    ${last_name}    ${actual_last_name}
    run keyword and continue on failure    Should Be Equal    ${first_name}    ${actual_first_name}
    run keyword and continue on failure    Should Be Equal    ${email}    ${actual_email}
    run keyword and continue on failure    Should Contain     ${actual_subject}    ${subject}
    run keyword and continue on failure    Should Contain     ${actual_description}    ${description}
    Run Keyword If  '${selected_account}'!='${EMPTY}'  run keyword and continue on failure    Should Be Equal    ${actual_selected_account}  ${selected_account}
    Run Keyword If  '${additional_accounts_linked}'!='${EMPTY}'  run keyword and continue on failure    Should Be Equal    ${actual_additional_accounts_linked}  ${additional_accounts_linked}
    Run Keyword If  '${requester_comment}'!='${EMPTY}'  run keyword and continue on failure    Should Contain     ${actual_requester_comment}  ${requester_comment}
    Run Keyword If  '${approver_details}'!='${EMPTY}'  run keyword and continue on failure    Should Contain     ${actual_approver_details}   ${approver_details}
    Run Keyword If  '${approver_comment}'!='${EMPTY}'  run keyword and continue on failure    Should Be Equal    ${actual_approver_comment}  ${approver_comment}

Validate Common Service Request Detail Values
    [Arguments]  ${last_name}  ${first_name}  ${email}  ${status}  ${message_category}  ${description}
    ${submitted_date}=    Get Current Date    result_format=%m/%d/%Y
    ${actual_submitted_date} =    ServiceRequestDetails_Actions.Get Date Submitted Text
    ${actual_last_name} =    ServiceRequestDetails_Actions.Get Last Name
    ${actual_first_name} =    ServiceRequestDetails_Actions.Get First Name
    ${actual_email} =    ServiceRequestDetails_Actions.Get Email
    ${actual_status} =    ServiceRequestDetails_Actions.Get SR Status
    ${actual_message_category}=  ServiceRequestDetails_Actions.Get SR Message Category
    ${actual_description} =    ServiceRequestDetails_Actions.Get Description
    Log  ${description}
    #${actual_description1} =   evaluate  ${actual_description.replace('\n','')}
    # verification
    run keyword and continue on failure    Should Be Equal    ${submitted_date}    ${actual_submitted_date}
    run keyword and continue on failure    Should Be Equal    ${last_name}    ${actual_last_name}
    run keyword and continue on failure    Should Be Equal    ${first_name}    ${actual_first_name}
    run keyword and continue on failure    Should Be Equal    ${email}    ${actual_email}
    run keyword and continue on failure    Should Be Equal    ${status}    ${actual_status}
    run keyword and continue on failure    Should Be Equal    ${message_category}    ${actual_message_category}
    run keyword and continue on failure    Should Contain     ${actual_description}    ${description}

Validate Comment Request Detail Values
    [Arguments]  ${last_name}  ${first_name}  ${email}  ${status}  ${message_category}  ${description}
    ${submitted_date}=    Get Current Date    result_format=%m/%d/%Y
    ${actual_submitted_date} =    ServiceRequestDetails_Actions.Get Date Submitted Text
    ${actual_last_name} =    ServiceRequestDetails_Actions.Get Last Name
    ${actual_first_name} =    ServiceRequestDetails_Actions.Get First Name
    ${actual_email} =    ServiceRequestDetails_Actions.Get Email
    ${actual_status} =    ServiceRequestDetails_Actions.Get SR Status
    ${actual_message_category}=  ServiceRequestDetails_Actions.Get SR Message Category
    ${actual_description} =    ServiceRequestDetails_Actions.Get Description
    # verification
    run keyword and continue on failure    Should Be Equal    ${submitted_date}    ${actual_submitted_date}
    run keyword and continue on failure    Should Be Equal    ${last_name}    ${actual_last_name}
    run keyword and continue on failure    Should Be Equal    ${first_name}    ${actual_first_name}
    run keyword and continue on failure    Should Be Equal    ${email}    ${actual_email}
    run keyword and continue on failure    Should Be Equal    ${status}    ${actual_status}
    run keyword and continue on failure    Should Be Equal    ${message_category}    ${actual_message_category}
    run keyword and continue on failure    Should Contain     ${actual_description}    ${description}

Validate Send Message Service Request Detail Values
    [Arguments]  ${last_name}  ${first_name}  ${email}  ${status}  ${message_category}  ${subject}  ${description}
    ${submitted_date}=    Get Current Date    result_format=%m/%d/%Y
    ${actual_submitted_date} =    ServiceRequestDetails_Actions.Get Date Submitted Text
    ${actual_last_name} =    ServiceRequestDetails_Actions.Get Last Name
    ${actual_first_name} =    ServiceRequestDetails_Actions.Get First Name
    ${actual_email} =    ServiceRequestDetails_Actions.Get Email
    ${actual_status} =    ServiceRequestDetails_Actions.Get SR Status
    ${actual_message_category}=  ServiceRequestDetails_Actions.Get SR Message Category
    ${actual_subject} =  ServiceRequestDetails_Actions.Get Subject
    ${actual_description} =    ServiceRequestDetails_Actions.Get Description
    # verification
    run keyword and continue on failure    Should Be Equal    ${submitted_date}    ${actual_submitted_date}
    run keyword and continue on failure    Should Be Equal    ${last_name}    ${actual_last_name}
    run keyword and continue on failure    Should Be Equal    ${first_name}    ${actual_first_name}
    run keyword and continue on failure    Should Be Equal    ${email}    ${actual_email}
    run keyword and continue on failure    Should Be Equal    ${status}    ${actual_status}
    run keyword and continue on failure    Should Be Equal    ${message_category}    ${actual_message_category}
    run keyword and continue on failure    Should Contain     ${actual_subject}    ${subject}
    run keyword and continue on failure    Should Contain     ${actual_description}    ${description}


