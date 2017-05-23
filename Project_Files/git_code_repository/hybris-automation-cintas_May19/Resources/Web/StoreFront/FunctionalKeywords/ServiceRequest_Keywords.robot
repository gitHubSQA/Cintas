*** Settings ***
Resource          ../PageActions/ServiceRequest_Actions.robot
Resource          ../PageActions/ServiceRequestDetails_Actions.robot
Resource          ../PageActions/CreateNewRequest_Actions.robot
Resource          ../PageActions/GlobalMessage_Actions.robot
Resource          ../PageActions/Common_Actions.robot
Resource          ../PageActions/SelectAnAccount_Actions.robot
Resource          ServiceRequest_Keywords.robot
Resource          ../PageObjects/CreateNewRequest_Page.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../PageActions/Header_Actions.robot
Library           ../../../../hybris-automation-shared/Libraries/MathUtils.py
Library           String
Library           Selenium2Library

*** Keywords ***
Create Service Request
    [Arguments]    ${subject}    ${details}
    ServiceRequest_Actions.Click Create New Request Button
    CreateNewRequest_Actions.Enter Subject    ${subject}
    CreateNewRequest_Actions.Enter Details    ${details}
    CreateNewRequest_Actions.Click Submit Message
    Common_Actions.Wait For Loading
    ${request_id} =    ServiceRequest_Keywords.Get New Service Request ID
    [Return]    ${request_id}

Get New Service Request ID
    ${message} =    GlobalMessage_Actions.Get Global Message
    ${request_id} =    Fetch From Right    ${message}    :
    ${request_id}=    Fetch From Left    ${request_id}    .
    log    ${request_id}
    [Return]    ${request_id}

Filter Service request
    [Arguments]    ${start_date}    ${end_date}    ${status_text}    ${search_text}
    Run Keyword If    '${start_date}' != '${EMPTY}' and '${end_date}' != '${EMPTY}'    ServiceRequest_Actions.Input Date Range    ${start_date}    ${end_date}
    Run Keyword If    '${status_text}' != '${EMPTY}'    ServiceRequest_Actions.Select Status    ${status_text}
    Run Keyword If    '${search_text}' != '${EMPTY}'    ServiceRequest_Actions.Enter Search Text    ${search_text}
    ServiceRequest_Actions.Click Search Button
    Common_Actions.Wait For Loading

Sort Service Request
    [Arguments]    ${sort_column}    ${sort_order}
    Run Keyword If    '${sort_column}' != 'Submitted'    Sort Service Request By Column    ${sort_column}

Sort Service Request Descending
    [Arguments]    ${sort_column}
    Sort Service Request By Column    ${sort_column}

Sort Service Request By Column
    [Arguments]    ${sort_column}
    Run Keyword If    '${sort_column}' == 'ID'    ServiceRequest_Actions.Click ID
    Run Keyword If    '${sort_column}' == 'Submitted'    ServiceRequest_Actions.Click Submitted
    Run Keyword If    '${sort_column}' == 'Description'    ServiceRequest_Actions.Click Description
    Run Keyword If    '${sort_column}' == 'Last Name'    ServiceRequest_Actions.Click Last Name
    Run Keyword If    '${sort_column}' == 'First Name'    ServiceRequest_Actions.Click First Name
    Run Keyword If    '${sort_column}' == 'Email'    ServiceRequest_Actions.Click Email

Get All Service Request Column Values
    [Arguments]    ${column_name}
    ${sr_total} =    ServiceRequest_Actions.Get Total View Entry
    ${sr_total} =    roundup    ${sr_total}
    ${sr_total} =    Evaluate    ${sr_total} / 10
    @{sr_values} =    Create List
    : FOR    ${INDEX}    IN RANGE    1    ${sr_total} + 1
    \    @{page_values} =    ServiceRequest_Actions.Get Service Request Table Column Values    ${INDEX}    ${column_name}
    \    ${sr_values} =    Combine Lists    ${sr_values}    ${page_values}
    [Return]    @{sr_values}

Select Requests To View
    [Arguments]    ${requests_to_view}
    Log    ${requests_to_view}
    Run Keyword If    '${requests_to_view}' == 'OTHER'    ServiceRequest_Actions.Click Manage Other User Request Button
    ...    ELSE    ServiceRequest_Actions.Click Manage My Request Button

Service Request Confirmation Cancel
    [Arguments]    ${sr_unique_cell_value}    ${message}    ${response}
    ServiceRequest Actions.Click Service Request Table Row    ${sr_unique_cell_value}
    # Add steps to select which sr to approve/reject
    Run Keyword If    '${message}' != '${EMPTY}'    ServiceRequestDetails_Actions.Enter Message    ${message}
    Run Keyword If    '${response}' == 'APPROVE'    ServiceRequestDetails_Actions.Click Approve Button
    ...    ELSE    ServiceRequestDetails_Actions.Click Reject Button
    ServiceRequestDetails_Actions.Click Confirmation Cancel Button
    Common_Actions.Wait For Loading

Search Service request
    [Arguments]    ${search_text}
    Run Keyword If    '${search_text}' != '${EMPTY}'    ServiceRequest_Actions.Enter Search Text    ${search_text}
    ServiceRequest_Actions.Click Search Button
    Common_Actions.Wait For Loading

Service Request Reply Decision
    [Arguments]    ${message}    ${response}
    ServiceRequestDetails_Actions.Enter Message    ${message}
    Run Keyword If    '${response}' == 'APPROVE'    ServiceRequestDetails_Actions.Click Approve Button
    Run Keyword If    '${response}' == 'REJECT'    ServiceRequestDetails_Actions.Click Reject Button

Service Request Reply Confirmation
    [Arguments]    ${response}
    Run Keyword If    '${response}' == 'APPROVE'    ServiceRequestDetails_Actions.Click Confirmation Approve Button
    Run Keyword If    '${response}' == 'REJECT'    ServiceRequestDetails_Actions.Click Confirmation Reject Button
    Run Keyword If    '${response}' == 'APPROVECANCEL'    ServiceRequestDetails_Actions.Click Approve Confirmation Cancel Button
    Run Keyword If    '${response}' == 'REJECTCANCEL'    ServiceRequestDetails_Actions.Click Reject Confirmation Cancel Button

Select an Service Request
    [Arguments]    ${description}
    Filter Service request    ${EMPTY}    ${EMPTY}    Pending Approval    ${description}
    ServiceRequest_Actions.Click Service Request Table Row    ${description}

Upload SR Attachment File
    [Arguments]    ${file_name}
    ${file_path}=    Set Variable    ${INPUT_FILES}${UPLOAD_FILES_PATH}${file_name}
    CreateNewRequest_Actions.Click Upload File
    Run Keyword If    '${file_name}'!='${EMPTY}'    CreateNewRequest_Actions.Select Attachment File    ${file_path}
    CreateNewRequest_Actions.Click Submit File
#    Comment    CreateNewRequest_Actions.Wait Until File Upload Completion    # To Do: modified this keyword as per logic
    Common_Actions.Wait For Loading
    Sleep    5s

Remove SR Attachment File
    CreateNewRequest_Actions.Click Remove Attachment

Change SR Attachment File
    [Arguments]    ${file_path}
    CreateNewRequest_Actions.Click Remove Attachment
    ServiceRequest_Keywords.Upload SR Attachment File    ${file_path}
    ServiceRequestDetails_Actions.Click Update Message

Create Service Request in Generic Page
    [Arguments]    ${subject}    ${details}
    CreateNewRequest_Actions.Enter Subject    ${subject}
    CreateNewRequest_Actions.Enter Details    ${details}
    CreateNewRequest_Actions.Click Submit Message
    Common_Actions.Wait For Loading

Upload SR Attachment File in SR Details Page
    [Arguments]    ${sr_type}
    Run Keyword If    '${sr_type}'=='IN-PROGRESS'    ServiceRequest_Keywords.Upload SR Attachment File in SR Details Page for Inprogress SR    ${in_file_name}
    Run Keyword If    '${sr_type}'=='PENDING'    ServiceRequest_Keywords.Upload SR Attachment File in SR Details Page for Pending Approval    ${in_file_name}    ${unique_key}

Upload SR Attachment File in SR Details Page for Inprogress SR
    [Arguments]    ${file_name}
    ${request_id} =    ServiceRequest_Keywords.Get New Service Request ID
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Filter Service request    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${request_id}
    ServiceRequest_Actions.Click Service Request Table Row    ${request_id}
    ${file_path}=    Set Variable    ${INPUT_FILES}${UPLOAD_FILES_PATH}${file_name}
    CreateNewRequest_Actions.Click Upload File
    Run Keyword If    '${file_name}'!='${EMPTY}'    CreateNewRequest_Actions.Select Attachment File    ${file_path}
    CreateNewRequest_Actions.Click Submit File
    Common_Actions.Wait For Loading
    Sleep    5s

Upload SR Attachment File in SR Details Page for Pending Approval
    [Arguments]    ${file_name}    ${description}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Select an Service Request    ${description}
    ${file_path}=    Set Variable    ${INPUT_FILES}${UPLOAD_FILES_PATH}${file_name}
    CreateNewRequest_Actions.Click Upload File
    Run Keyword If    '${file_name}'!='${EMPTY}'    CreateNewRequest_Actions.Select Attachment File    ${file_path}
    CreateNewRequest_Actions.Click Submit File
    Comment    CreateNewRequest_Actions.Wait Until File Upload Completion
    Common_Actions.Wait For Loading
    Sleep    5s

Create Service Request and Logout
    [Arguments]    ${category}    ${subject}    ${details}
    Dashboard_Actions.Click Service Request
    ServiceRequest_Actions.Click Create New Request Button
    ServiceRequestDetails_Actions.Select Message Category    ${category}
    CreateNewRequest_Actions.Enter Subject    ${subject}
    CreateNewRequest_Actions.Enter Details    ${details}
    CreateNewRequest_Actions.Click Submit Message
    Common_Actions.Wait For Loading
    ${request_id} =    ServiceRequest_Keywords.Get New Service Request ID
    Common_Actions.Customer Sign Out
    [Return]    ${request_id}

Create Service Request from Dashboard Page
    [Arguments]    ${category}    ${subject}    ${details}
    # Remove this button as change management
    Comment    Dashboard_Actions.Click Add Request New Button
    # new change
    Dashboard_Actions.Click Message Center
    ServiceRequestDetails_Actions.Select Message Category    ${category}
    CreateNewRequest_Actions.Enter Subject    ${subject}
    CreateNewRequest_Actions.Enter Details    ${details}
    CreateNewRequest_Actions.Click Submit Message
    Common_Actions.Wait For Loading
    ${request_id} =    ServiceRequest_Keywords.Get New Service Request ID
    [Return]    ${request_id}

Create Service Request By Selecting Message Category
    [Arguments]    ${category}    ${subject}    ${details}
    ServiceRequestDetails_Actions.Select Message Category    ${category}
    CreateNewRequest_Actions.Enter Subject    ${subject}
    CreateNewRequest_Actions.Enter Details    ${details}
    CreateNewRequest_Actions.Click Submit Message
    Common_Actions.Wait For Loading

Send Chat Message
    [Arguments]    ${msg}
    ServiceRequestDetails_Actions.Enter Chat Message    ${msg}
    ServiceRequestDetails_Actions.Click Chat Send Button

Select Pending Service Request
    [Arguments]    ${description}
    Filter Service request    ${EMPTY}    ${EMPTY}    Pending Approval    ${description}
    ServiceRequest_Actions.Click Service Request Table Row    ${description}

Search Pending Service Request
    [Arguments]    ${description}
    Filter Service request    ${EMPTY}    ${EMPTY}    Pending Approval    ${description}


Select In-progress Service Request
    [Arguments]    ${description}
    Filter Service request    ${EMPTY}    ${EMPTY}    In Progress    ${description}
    ServiceRequest_Actions.Click Service Request Table Row    ${description}

Search In-progress Service Request
    [Arguments]    ${description}
    Filter Service request    ${EMPTY}    ${EMPTY}    In Progress    ${description}


Select Closed Service Request
    [Arguments]    ${description}
    Filter Service request    ${EMPTY}    ${EMPTY}    Closed    ${description}
    ServiceRequest_Actions.Click Service Request Table Row    ${description}

Select Rejected Service Request
    [Arguments]    ${description}
    Filter Service request    ${EMPTY}    ${EMPTY}    Rejected    ${description}
    ServiceRequest_Actions.Click Service Request Table Row    ${description}

# Manage My Contract SR Approval or Rejection
Service Request Reply For Manage My Contract
    [Arguments]      ${response}
    ${message_app} =  Set Variable  Approved your request.
    ${message_rej} =  Set Variable  Sorry, Rejected.
    Run Keyword If    '${response}' == 'APPROVE'   ServiceRequestDetails_Actions.Enter Message    ${message_app}
    Run Keyword If    '${response}' == 'REJECT'    ServiceRequestDetails_Actions.Enter Message    ${message_rej}
    Run Keyword If    '${response}' == 'APPROVE'    ServiceRequestDetails_Actions.Click Approve Button
    Run Keyword If    '${response}' == 'REJECT'    ServiceRequestDetails_Actions.Click Reject Button
    Run Keyword If    '${response}' == 'APPROVE'    ServiceRequestDetails_Actions.Click Confirmation Approve Button
    Run Keyword If    '${response}' == 'REJECT'    ServiceRequestDetails_Actions.Click Confirmation Reject Button

Select And Open Inprogress SR
    ${request_id} =    ServiceRequest_Keywords.Get New Service Request ID
    ${index}=  set variable  1
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ServiceRequest_Keywords.Filter Service request    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${request_id}
    ServiceRequest_Actions.Click Service Request Table Row By Index    ${index}

Select And Open Pending Approver SR
    [Arguments]    ${start_date}    ${end_date}  ${index}
    Common_Actions.Open Page    cintasrentalsstorefront/service-request
    ${status} =   set variable  Pending Approval
    ${sort_column} =   set variable   Submitted
    # vslidate date range
    ServiceRequest_Keywords.Filter Service request    ${start_date}    ${end_date}    ${status}    ${EMPTY}
    ServiceRequest_Keywords.Sort Service Request By Column    ${sort_column}
    ServiceRequest_Actions.Click Service Request Table Row By Index   ${index}

