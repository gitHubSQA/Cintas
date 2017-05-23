*** Settings ***
Library           Selenium2Library
Library           Collections
Library           DateTime
Library           String
Library           Dialogs
Library           ../../../hybris-automation-shared/Libraries/DateUtils.py
Variables         ../../../Configurations/GlobalVariables.py
Variables         ../../../Configurations/TestEnvironments.py
Resource          ../../../hybris-automation-shared/Resources/API/Hac_API.robot

*** Keywords ***
Import Impex Service Request
    [Arguments]    ${tc_name}    ${impx_sr_requester}    ${impx_sr_soldto}    ${impx_sr_creation_time}    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    INSERT_UPDATE ServiceRequest;code[unique=true];requester(B2BCustomer.uid);subject;description;status(code);soldTo(B2BUnit.uid);creationtime[forceWrite=false,dateformat=dd-MM-yyyy hh:mm:ss]${\n}
    @{sr_list} =    Create List
    ${unique_key} =    get_datetime_stamp
    ${final_impex} =    Set Variable    ${headers}
    ${service_request} =    Set Variable    ${EMPTY}
    ${subject} =    Set Variable    This is a subject for
    ${description} =    Set Variable    This is a description for
    ${pending_count} =    Convert To Integer    ${impx_sr_pending_status_count}
    ${rejected_count} =    Convert To Integer    ${impx_sr_rejected_status_count}
    : FOR    ${INDEX}    IN RANGE    1    ${pending_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    1    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    PENDING
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    : FOR    ${INDEX}    IN RANGE    1    ${rejected_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    2    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    REJECTED
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    #Import Import Remove Service Request
    # To be completed
    #    REMOVE ServiceRequest;code[unique=true];requester(B2BCustomer.uid)
    #    ;16100615510711;dev50003459@test.com
    [Return]    ${sr_list}

Import Impex Service Request With Category and Review Date
    [Arguments]    ${tc_name}    ${impx_sr_requester}    ${impx_sr_soldto}    ${impx_sr_category}  ${impx_category_code}  ${impx_sr_creation_time}    ${impx_sr_review_time}
    ...    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    INSERT_UPDATE ServiceRequest;category;categoryCode;code[unique=true];requester(B2BCustomer.uid);subject;description;status(code);soldTo(B2BUnit.uid);creationtime[forceWrite=false,dateformat=dd-MM-yyyy hh:mm:ss];reviewDate[dateformat=dd-MM-yyyy hh:mm:ss]${\n}
    @{sr_list} =    Create List
    ${unique_key} =    get_datetime_stamp
#    set test variable  ${unique_key}
    ${final_impex} =    Set Variable    ${headers}
    ${service_request} =    Set Variable    ${EMPTY}
    ${category} =    Set Variable    ${impx_sr_category}
    ${category_code} =    Set Variable    ${impx_category_code}
    ${subject} =    Set Variable    Subject
    ${description} =    Set Variable    Description
    ${pending_count} =    Convert To Integer    ${impx_sr_pending_status_count}
    ${rejected_count} =    Convert To Integer    ${impx_sr_rejected_status_count}
    : FOR    ${INDEX}    IN RANGE    1    ${pending_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    1    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    PENDING
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${category}    ${category_code}  ${new_unique_key}
    \    ...    ${impx_sr_requester}    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}
    \    ...    ${new_creation_time}    ${EMPTY}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    : FOR    ${INDEX}    IN RANGE    1    ${rejected_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    2    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    REJECTED
    \    ${temp_riview_time} =    increment_date_by_days    ${impx_sr_review_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_riview_time} =    Set Variable If    ${INDEX} > 1    ${temp_riview_time}    ${impx_sr_review_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${category}    ${category_code}  ${new_unique_key}
    \    ...    ${impx_sr_requester}    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}
    \    ...    ${new_creation_time}    ${new_riview_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    [Return]    ${sr_list}

Import Impex Delete Service Request
    [Arguments]    ${impx_sr_requester}    @{sr_list_to_delete}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers1} =    Set Variable    REMOVE ServiceRequest;code[unique=true];requester(B2BCustomer.uid)${\n}
    ${final_impex_code_line_data}    Set Variable    ${EMPTY}
    : FOR    ${sr_item}    IN    @{sr_list_to_delete}
    \    ${impex_code_line_data} =    Catenate    SEPARATOR=;    ${EMPTY}    ${sr_item}    ${impx_sr_requester}${\n}
    \    ${final_impex_code_line_data} =    Catenate    SEPARATOR=    ${final_impex_code_line_data}    ${impex_code_line_data}
    ${final_impex} =    Catenate    SEPARATOR=    ${headers1}    ${final_impex_code_line_data}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex User Role
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    @{valid_account_types} =    Create List    olbp-viewer    wearer-editor    contract-viewer    contract-editor    sr-approver
    ...    olbp-payer    user-admin    wearer-viewer
    List Should Contain Value    ${valid_account_types}    ${account_type}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    ${impx_first_login}    Set Variable    ${False}
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append];firstTimeLogin${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    ...    ${impx_first_login}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

HAC Import Impex From File
    [Arguments]    ${file_path}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    Hac_API.HAC Import Impex From File    ${SITE_URL}    ${file_path}    ${HAC_USERNAME}    ${HAC_PASSWORD}

HAC Execute Script
    [Arguments]    ${script}    ${language}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    Hac_API.HAC Execute Scripting Language    ${SITE_URL}    ${script}    ${language}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex Service Request_main
    [Arguments]    ${tc_name}    ${impx_sr_requester}    ${impx_sr_soldto}    ${impx_sr_creation_time}    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    INSERT_UPDATE ServiceRequest;code[unique=true];requester(B2BCustomer.uid);subject;description;status(code);soldTo(B2BUnit.uid);creationtime[forceWrite=false,dateformat=dd-MM-yyyy hh:mm:ss]${\n}
    @{sr_list} =    Create List
    ${unique_key} =    get_datetime_stamp
    ${final_impex} =    Set Variable    ${headers}
    ${service_request} =    Set Variable    ${EMPTY}
    ${subject} =    Set Variable    This is a subject for
    ${description} =    Set Variable    This is a description for
    ${pending_count} =    Convert To Integer    ${impx_sr_pending_status_count}
    ${rejected_count} =    Convert To Integer    ${impx_sr_rejected_status_count}
    : FOR    ${INDEX}    IN RANGE    1    ${pending_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    1    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    PENDING
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    : FOR    ${INDEX}    IN RANGE    1    ${rejected_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    2    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    REJECTED
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    [Return]    ${sr_list}

Import Impex User Role_main
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    @{valid_account_types} =    Create List    oldp_viewer    wearer-editor    contract-viewer    contract-editor    sr-approver
    ...    olbp-payer    user-admin    wearer-viewer
    List Should Contain Value    ${valid_account_types}    ${account_type}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,wearer-editor
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append]${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex User Role for Notification
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    @{valid_account_types} =    Create List    olbp-viewer    wearer-editor    contract-viewer    contract-editor    sr-approver
    ...    olbp-payer    user-admin    wearer-viewer    reports
    List Should Contain Value    ${valid_account_types}    ${account_type}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer,reports
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    Comment    ${account_type_olbp} =    Catenate    SEPARATOR=,    ${account_type}    olbp-viewer
    Comment    ${account_type} =    Set Variable If    '${wf_unchecked_all}'=='YES' or '${wf_unchecked_all}'=='yes'    ${account_type_olbp}    ${account_type}
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append]${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex User Role for Notification Accordion
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    @{valid_account_types} =    Create List    olbp_viewer    wearer-editor    contract-viewer    contract-editor    sr-approver
    ...    olbp-payer    user-admin    wearer-viewer
    List Should Contain Value    ${valid_account_types}    ${account_type}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    Comment    ${account_type} =    Catenate    SEPARATOR=,    ${account_type}    olbp-viewer
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append]${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex User Default Role
    [Arguments]    ${in_customer_email}    ${wf_default_role}
    ${account_type} =    Convert To Lowercase    ${wf_default_role}
    @{valid_account_types} =    Create List    olbp-viewer    wearer-editor    contract-viewer    contract-editor    sr-approver
    ...    olbp-payer    user-admin    wearer-viewer
    List Should Contain Value    ${valid_account_types}    ${account_type}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append]${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex For Service Request Deletion
    [Arguments]    ${tc_name}    ${impx_sr_requester}    ${impx_sr_soldto}    ${impx_sr_creation_time}    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    REMOVE ServiceRequest;code[unique=true];requester(B2BCustomer.uid)${\n}
    @{sr_list} =    Create List
    ${unique_key} =    get_datetime_stamp
    ${final_impex} =    Set Variable    ${headers}
    ${service_request} =    Set Variable    ${EMPTY}
    ${subject} =    Set Variable    This is a subject for
    ${description} =    Set Variable    This is a description for
    ${pending_count} =    Convert To Integer    ${impx_sr_pending_status_count}
    ${rejected_count} =    Convert To Integer    ${impx_sr_rejected_status_count}
    : FOR    ${INDEX}    IN RANGE    1    ${pending_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    1    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    PENDING
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    : FOR    ${INDEX}    IN RANGE    1    ${rejected_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    2    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    REJECTED
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    #Import Import Remove Service Request
    # To be completed
    #    REMOVE ServiceRequest;code[unique=true];requester(B2BCustomer.uid)
    #    ;16100615510711;dev50003459@test.com
    [Return]    ${sr_list}

Import Impex User multiple Roles
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    # remove the following two lines later
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append]${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}


Import Impex To Cahnge User Password
    [Arguments]    ${in_customer_email}    ${in_customer_password}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Set new password
    ${headers} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];password${\n}
    ${final_impex} =    Set Variable    ${headers}
    ${final_impex} =    Catenate    SEPARATOR=;    ${final_impex}    ${in_customer_email}    ${in_customer_password}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}


Import Impex To Update Account
    [Arguments]    ${in_customer_email}    ${in_update_acc}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Set new password
    ${headers} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];soldTos(uid)${\n}
    ${final_impex} =    Set Variable    ${headers}
    ${final_impex} =    Catenate    SEPARATOR=;    ${final_impex}    ${in_customer_email}    ${in_update_acc}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}


#Import Impex User multiple Roles and Default Password
#    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}   ${impx_ur_account_type}
#    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
#    # remove the following two lines later
#    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
#    # Remove all roles for user
#    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
#    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
#    ${final_impex1} =    Set Variable    ${headers1}
#    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
#    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
#    # Set new role for user
#    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append]${\n}
#    ${final_impex2} =    Set Variable    ${headers2}
#    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
#    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}


Import Impex User multiple Roles and Login Status
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    # remove the following two lines later
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append];firstTimeLogin${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    ...    ${impx_first_login}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex Activity Log2
    [Arguments]    ${tc_name}    ${impx_sr_requester}    ${impx_sr_soldto}    ${impx_sr_creation_time}    ${impx_sr_pending_status_count}    ${impx_sr_rejected_status_count}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    INSERT_UPDATE ServiceRequest;code[unique=true];requester(B2BCustomer.uid);subject;description;status(code);soldTo(B2BUnit.uid);creationtime[forceWrite=false,dateformat=dd-MM-yyyy hh:mm:ss]${\n}
    @{sr_list} =    Create List
    ${unique_key} =    get_datetime_stamp
    ${final_impex} =    Set Variable    ${headers}
    ${service_request} =    Set Variable    ${EMPTY}
    ${subject} =    Set Variable    This is a subject for
    ${description} =    Set Variable    This is a description for
    ${pending_count} =    Convert To Integer    ${impx_sr_pending_status_count}
    ${rejected_count} =    Convert To Integer    ${impx_sr_rejected_status_count}
    : FOR    ${INDEX}    IN RANGE    1    ${pending_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    1    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    PENDING
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    : FOR    ${INDEX}    IN RANGE    1    ${rejected_count} + 1
    \    ${new_unique_key} =    Catenate    SEPARATOR=    ${unique_key}    2    ${INDEX}
    \    ${new_subject} =    Catenate    SEPARATOR=${SPACE}    ${subject}    ${new_unique_key}
    \    ${new_description} =    Catenate    SEPARATOR=${SPACE}    ${tc_name}    ${description}    ${new_unique_key}
    \    ${status} =    Set Variable    REJECTED
    \    ${temp_creation_time} =    increment_date_by_days    ${impx_sr_creation_time}    %d-%m-%Y %H:%M:%S    ${INDEX}
    \    ${new_creation_time} =    Set Variable If    ${INDEX} > 1    ${temp_creation_time}    ${impx_sr_creation_time}
    \    ${impex_code} =    Catenate    SEPARATOR=;    ${service_request}    ${new_unique_key}    ${impx_sr_requester}
    \    ...    ${new_subject}    ${new_description}    ${status}    ${impx_sr_soldto}    ${new_creation_time}
    \    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}    ${\n}
    \    Append To List    ${sr_list}    ${new_unique_key}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    #Import Import Remove Service Request
    # To be completed
    #    REMOVE ServiceRequest;code[unique=true];requester(B2BCustomer.uid)
    #    ;16100615510711;dev50003459@test.com
    [Return]    ${sr_list}

Import Impex Activity Log
    [Arguments]    ${impx_act_log_code}    ${impx_nf_creation_time}    ${impx_dsc_param}    ${impx_Principal}    ${impx_url_Param}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    INSERT_UPDATE ActivityLogEvent;activityLog(code);code[unique=true];eventDate[dateformat=dd.MM.yyyy hh:mm:ss];descriptionParameters;principal(uid);urlParameters${\n}
    ${unique_key} =    get_datetime_stamp
    ${activity_log_code}=    Set Variable    ${impx_act_log_code}
    Set Test Variable    ${activity_log_code}
    ${event_code}=    Set Variable    ${activity_log_code}-${unique_key}
    Set Test Variable    ${event_code}
    ${to_date}=    Get Current Date    result_format=%d.%m.%Y %H:%M:%S    #result_format=%m/%d/%Y
    Set Test Variable    ${to_date}
    ${event_date}=    Set Variable    ${to_date}
    Comment    ${event_date}=    Set Variable If    '{impx_nf_creation_time}'!='${EMPTY}'    ${impx_nf_creation_time}    ${to_date}
    ${dsc_param}    Set Variable    ${impx_dsc_param}
    ${Principal}=    Set Variable    ${impx_Principal}
    ${url_Param}=    Set Variable    ${impx_url_Param}
    #
    ${final_impex} =    Set Variable    ${headers}
    ${activity_log_event} =    Set Variable    ${EMPTY}
    ${impex_code} =    Catenate    SEPARATOR=;    ${activity_log_event}    ${activity_log_code}    ${event_code}    ${event_date}
    ...    ${dsc_param}    ${impx_Principal}    ${url_Param}
    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}


Import Impex Remove Activity Log
    [Documentation]    REMOVE ActivityLogEvent;activityLog(code);code[unique=true]
    ...    ;0012;0012-161102103911
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    REMOVE ActivityLogEvent;activityLog(code);code[unique=true]${\n}
    ${final_impex} =    Set Variable    ${headers}
    ${activity_log_event} =    Set Variable    ${EMPTY}
    ${impex_code} =    Catenate    SEPARATOR=;    ${activity_log_event}    ${activity_log_code}    ${event_code}
    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex User Multiple Roles And First Time User
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    # Set User first time login property as No
    ${impx_first_login}    Set Variable    ${False}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=append];firstTimeLogin${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${account_type}
    ...    ${impx_first_login}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

# Manage My Contract
Import Impex For Removing Activity Log Usig Principal
    [Documentation]    REMOVE ActivityLogEvent[batchmode=true];principal(uid)[unique=true]
    ...  ;0010637143;
    [Arguments]  ${principal}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${headers} =    Set Variable    REMOVE ActivityLogEvent[batchmode=true];principal(uid)[unique=true]${\n}
    ${final_impex} =    Set Variable    ${headers}
    ${activity_log_event} =    Set Variable    ${EMPTY}
    ${impex_code} =    Set Variable    ;${principal};
    ${final_impex} =    Catenate    SEPARATOR=    ${final_impex}    ${impex_code}
    Log    ${final_impex}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex User With Common Attributes
    [Documentation]    INSERT_UPDATE B2BCustomer;uid[unique=true];email;password;groups(uid)[mode=append];soldTos(uid);rentalsPayer(uid);firstName;lastName;firstTimeLogin
    ...  ;hyb296@demo.com;hyb296@demo.com;12341234;wearer-editor,sr-approver;0010637143,0010637132;p0010637132,p0010637143;HYB296;DEM296;False
    [Arguments]    ${in_customer_email}    ${impx_ur_account_type}  ${impx_password}  ${impx_soldTos}  ${impx_payer}  ${impx_firstname}  ${impx_lastname}  ${impx_firstlogin}=False
    ${account_type} =    Convert To Lowercase    ${impx_ur_account_type}
    ${impx_soldTos} =    Convert To Lowercase    ${impx_soldTos}
    ${impx_payer} =      Convert To Lowercase    ${impx_payer}
    ${impx_firstname} =  Convert To Lowercase    ${impx_firstname}
    ${impx_lastname} =   Convert To Lowercase    ${impx_lastname}
    # remove the following two lines later
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    # Remove all roles for user
    ${headers1} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;groups(uid)[mode=remove]${\n}
    ${remove_accounts} =    Set Variable    sr-approver,olbp-payer,wearer-editor,wearer-viewer,contract-viewer,contract-editor,user-admin,olbp-viewer
    ${final_impex1} =    Set Variable    ${headers1}
    ${final_impex1} =    Catenate    SEPARATOR=;    ${final_impex1}    ${in_customer_email}    ${in_customer_email}    ${remove_accounts}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex1}    ${HAC_USERNAME}    ${HAC_PASSWORD}
    # Set new role for user
    ${headers2} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];email;password;groups(uid)[mode=append];soldTos(uid);rentalsPayer(uid);firstName;lastName;firstTimeLogin${\n}
    ${final_impex2} =    Set Variable    ${headers2}
    ${final_impex2} =    Catenate    SEPARATOR=;    ${final_impex2}    ${in_customer_email}    ${in_customer_email}    ${impx_password}  ${account_type}  ${impx_soldTos}  ${impx_payer}  ${impx_firstname}  ${impx_lastname}  ${impx_firstlogin}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex2}    ${HAC_USERNAME}    ${HAC_PASSWORD}

Import Impex For Update User Status
    [Documentation]    INSERT_UPDATE B2BCustomer;uid[unique=true];groups(uid)[mode=append];userRegistrationStatus(code,itemtype(code))
    ...                ;hyb170418144635@test.com;wearer-editor;ACTIVE:UserRegistrationStatus
    [Arguments]    ${in_customer_email}   ${user_role}  ${user_reg_status}
    ${SITE_URL} =    Get From Dictionary    ${HAC_URL}    ${AUT_LOCATION}
    ${user_reg_status} =    Set Variable    ${user_reg_status}:UserRegistrationStatus
    ${headers} =    Set Variable    INSERT_UPDATE B2BCustomer;uid[unique=true];groups(uid)[mode=append];userRegistrationStatus(code,itemtype(code))${\n}
    ${final_impex} =    Set Variable    ${headers}
    ${final_impex} =    Catenate    SEPARATOR=;    ${final_impex}  ${in_customer_email}   ${user_role}  ${user_reg_status}
    Hac_API.HAC Import Impex    ${SITE_URL}    ${final_impex}    ${HAC_USERNAME}    ${HAC_PASSWORD}
