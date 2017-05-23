*** Settings ***
Resource          ../PageObjects/MyAccount_Page.robot
Resource          Common_Validation.robot
Resource          ../PageObjects/ServiceRequest_Page.robot
Resource          ../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../PageActions/ServiceRequest_Actions.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../../Common/Common_Keywords.robot
Resource          ../PageActions/ServiceRequestDetails_Actions.robot
Resource          ../PageValidations/GlobalMessage_Validations.robot
Resource          GlobalMessage_Validations.robot
Resource          ../PageObjects/Header_Page.robot
Resource          ../PageActions/Login_Actions.robot
Resource          ../PageActions/Common_Actions.robot
Resource          ../FunctionalKeywords/Login_Keywords.robot
Library           ../../../../hybris-automation-shared/Libraries/DateUtils.py
Library           ../../../../hybris-automation-shared/Libraries/StringUtils.py
Library           Collections
Library           DateTime

*** Keywords ***
Validate User Notificaiton Options
    [Arguments]    ${impx_ur_account_type}
    [Documentation]    ${pending_sr_status} | ${new_sr_status} | ${new_user_status} | ${pending_user_status}=TRUE or FALSE
    AlertNotification_Validation.Validate Profile Management Notificaiton Options    ${True}    ${True}    ${True}    ${True}
    AlertNotification_Validation.Validate Activity Center Notificaiton Options    ${impx_ur_account_type}    ${True}    ${True}    ${True}    ${True}    ${True}
    ...    ${True}
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer' or '${impx_ur_account_type}'=='olbp-viewer'    AlertNotification_Validation.Validate Billing Notificaiton Options    ${impx_ur_account_type}    ${True}    ${True}    ${True}
    ...    ${True}
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver' or '${impx_ur_account_type}'=='user-admin'    AlertNotification_Validation.Validate Approver Notificaiton Options    ${impx_ur_account_type}    ${True}    ${True}    ${True}
    ...    ${True}

Validate Profile Management Notificaiton Options
    [Arguments]    ${pass_status}    ${Name_change_status}    ${add_account_status}    ${remove_account_status}
    [Documentation]    ${pass_status} | ${Name_change_status} | ${add_account_status} | ${remove_account_status}=TRUE or FALSE
    # check availability of options
    ${el1}=    MyAccount_Page.chkPasswordChangeNotification
    ${el2}=    MyAccount_Page.chkNameChangeNotification
    ${el3}=    MyAccount_Page.chkAddAccountNotification
    ${el4}=    MyAccount_Page.chkRemoveAccountNotification
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    # validate checkbox status
    ${status1}=    MyAccount_Page.get_chkPasswordChangeNotificationStatus
    ${status2}=    MyAccount_Page.get_chkNameChangeNotificationStatus
    ${status3}=    MyAccount_Page.get_chkAddAccountNotificationStatus
    ${status4}=    MyAccount_Page.get_chkRemoveAccountNotificationStatus
    Run Keyword And Continue On Failure    Should Be Equal    ${pass_status}    ${status1}
    Run Keyword And Continue On Failure    Should Be Equal    ${Name_change_status}    ${status2}
    Run Keyword And Continue On Failure    Should Be Equal    ${add_account_status}    ${status3}
    Run Keyword And Continue On Failure    Should Be Equal    ${remove_account_status}    ${status4}

Validate Billing Notificaiton Options
    [Arguments]    ${impx_ur_account_type}    ${submission_status}    ${setup_status}    ${max_status}    ${processed_status}
    [Documentation]    ${submission_status} | ${setup_status} | ${max_status} | ${processed_status}=TRUE or FALSE
    # availability of options
    ${el1}=    MyAccount_Page.chkPaymentSubmissionsNotification
    ${el2}=    MyAccount_Page.chkAutoPaymentSetupNotification
    ${el3}=    MyAccount_Page.chkMaxAutoPaymentNotification
    ${el4}=    MyAccount_Page.chkAutoPaymentProcessedNotification
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    # status of options
    ${status1}=    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    MyAccount_Page.get_chkPaymentSubmissionsNotificationStatus
    ${status2}=    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    MyAccount_Page.get_chkAutoPaymentSetupNotificationStatus
    ${status3}=    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    MyAccount_Page.get_chkMaxAutoPaymentNotificationStatus
    ${status4}=    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    MyAccount_Page.get_chkAutoPaymentProcessedNotificationStatus
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Should Be Equal    ${submission_status}    ${status1}
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Should Be Equal    ${setup_status}    ${status2}
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Should Be Equal    ${max_status}    ${status3}
    Run Keyword If    '${impx_ur_account_type}'=='olbp-payer'    Run Keyword And Continue On Failure    Should Be Equal    ${processed_status}    ${status4}
    # Validate no Billing for Olbp-Viewer
    ${el_billing}=    MyAccount_Page.divBillingSection
    Run Keyword If    '${impx_ur_account_type}'=='olbp-viewer'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el_billing}

Validate Activity Center Notificaiton Options
    [Arguments]    ${impx_ur_account_type}    ${cintas_garment_status}    ${approver_garment_status}    ${sr_reject_status}    ${sr_approved_status}    ${approver_service_status}
    ...    ${cintas_service_status}
    [Documentation]    ${cintas_garment_status} | ${approver_garment_status} | ${sr_reject_status} | ${sr_approved_status}|${approver_service_status}|${cintas_service_status}=TRUE or FALSE
    ${el1}=    MyAccount_Page.chkCintasGarmentAddChangeNotification
    ${el2}=    MyAccount_Page.chkApproverGarmentAddChangeNotification
    ${el3}=    MyAccount_Page.chkSrRejectedNotification
    ${el4}=    MyAccount_Page.chkSrApprovedNotification
    ${el5}=    MyAccount_Page.chkApproverServiceAddChangeNotification
    ${el6}=    MyAccount_Page.chkCintasServiceAddChangeNotification
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-viewer' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword If    '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword If    '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver' or '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver' or '${impx_ur_account_type}'=='contract-editor'  Run Keyword And Continue On Failure    Page Should Contain Element    ${el5}
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el6}
    ${status1}=    MyAccount_Page.get_chkCintasGarmentAddChangeNotificationStatus
    ${status2}=    MyAccount_Page.get_chkApproverGarmentAddChangeNotificationStatus
    ${status3}=    MyAccount_Page.get_chkSrRejectedNotificationStatus
    ${status4}=    MyAccount_Page.get_chkSrApprovedNotificationStatus
    ${status5}=    MyAccount_Page.get_chkApproverServiceAddChangeNotificationStatus
    ${status6}=    MyAccount_Page.get_chkCintasServiceAddChangeNotificationStatus
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-viewer' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Should Be Equal    ${cintas_garment_status}    ${status1}
    Run Keyword If    '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Should Be Equal    ${sr_approved_status}    ${status4}
    Run Keyword If    '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Should Be Equal    ${sr_reject_status}    ${status3}
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver' or '${impx_ur_account_type}'=='contract-editor' or '${impx_ur_account_type}'=='wearer-editor'    Run Keyword And Continue On Failure    Should Be Equal    ${approver_garment_status}    ${status2}
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver' or '${impx_ur_account_type}'=='contract-editor'  Run Keyword And Continue On Failure    Should Be Equal    ${approver_service_status}    ${status5}
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Should Be Equal    ${cintas_service_status}    ${status6}


Validate Approver Notificaiton Options
    [Arguments]    ${impx_ur_account_type}    ${pending_sr_status}    ${new_sr_status}    ${new_user_status}    ${pending_user_status}
    [Documentation]    ${pending_sr_status} | ${new_sr_status} | ${new_user_status} | ${pending_user_status}=TRUE or FALSE
    ${el1}=    MyAccount_Page.chkPendingSrApproveNotification
    ${el2}=    MyAccount_Page.chkNewSrApproveNotification
    ${el3}=    MyAccount_Page.chkNewUserRequestNotificationStatus
    ${el4}=    MyAccount_Page.chkPendingUserRequestNotificationStatus
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword If    '${impx_ur_account_type}'=='user-admin'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword If    '${impx_ur_account_type}'=='user-admin'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    ${status1}=    MyAccount_Page.get_chkPendingSrApproveNotificationStatus
    ${status2}=    MyAccount_Page.get_chkNewSrApproveNotificationStatus
    ${status3}=    MyAccount_Page.get_chkNewUserRequestNotificationStatus
    ${status4}=    MyAccount_Page.get_chkPendingUserRequestNotificationStatus
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver'    Run Keyword And Continue On Failure    Should Be Equal    ${pending_sr_status}    ${status1}
    Run Keyword If    '${impx_ur_account_type}'=='sr-approver'    Run Keyword And Continue On Failure    Should Be Equal    ${new_sr_status}    ${status2}
    Run Keyword If    '${impx_ur_account_type}'=='user-admin'    Run Keyword And Continue On Failure    Should Be Equal    ${new_user_status}    ${status3}
    Run Keyword If    '${impx_ur_account_type}'=='user-admin'    Run Keyword And Continue On Failure    Should Be Equal    ${pending_user_status}    ${status4}

Validate No Activity Message in Dashboard or Register
    [Documentation]    ${pending_sr_status} | ${new_sr_status} | ${new_user_status} | ${pending_user_status}=TRUE or FALSE
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}
    ${locator}=    Dashboard_Page.divCintasTable
    ${passed}=    Run Keyword And Return Status    Page Should Contain Element    ${locator}
    Run Keyword If    ${passed}    AlertNotification_Validation.Validate First Time Login Notification
    ...    ELSE    AlertNotification_Validation.Validate No Activity Message

Validate New SR Activity Log For SR Approver
    [Arguments]    ${approver_email}
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${approver_email}    ${in_customer_password}
    ${to_date}=    Get Current Date    result_format=%m/%d/%Y
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Approver    You have a new service request to approve    ${to_date}

Validate Activity Log Message in Dashboard
    [Arguments]    ${activity_log_no}    ${activity_type}    ${activity_description}    ${activity_event_date}
    [Documentation]    ${pending_sr_status} | ${new_sr_status} | ${new_user_status} | ${pending_user_status}=TRUE or FALSE
    ${act_activity_type}=    Dashboard_Actions.Get Activity Type    ${activity_log_no}
    ${act_activity_description}=    Dashboard_Actions.Get Activity Description    ${activity_log_no}
    #${act_activity_description}=  convert to lowercase  ${act_activity_description}
    ${act_activity_event_date}=    Dashboard_Actions.Get Activity Event Date    ${activity_log_no}
    Run Keyword And Continue On Failure    Should Be Equal    ${act_activity_type}    ${activity_type}
    Run Keyword And Continue On Failure    Should Be Equal    ${act_activity_description}    ${activity_description}
    ${activity_description}=  convert to lowercase  {activity_description}
    Run Keyword if    '${activity_event_date}'!='${EMPTY}'    Run Keyword And Continue On Failure    Should Be Equal    ${act_activity_event_date}    ${activity_event_date}





Validate Notification Description Link From Dashboard Page
    [Arguments]   ${page_url_exp}   ${breadcrumb_section_title_exp}  ${activity_log_no}=1
    [Documentation]
#    Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    Dashboard_Actions.Click High Lighted Notificatiaon Table Row By Index  ${activity_log_no}
    Common_Validation.Validate Patial URL  ${page_url_exp}
    ${active_section_title_act} =  Common_Actions.Get Breadcrumb Section Title Text
    Run Keyword And Continue On Failure    Should Be true    '${breadcrumb_section_title_exp.upper()}'=='${active_section_title_act.upper()}'












Validate New User Request For User Admin
    [Arguments]    ${approver_email}
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${approver_email}    ${in_customer_password}
    ${to_date}=    Get Current Date    result_format=%m/%d/%Y
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Approver    You have a new user request to approve    ${to_date}

Validate Activity Log Count
    [Arguments]    ${approver_email}
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${approver_email}    ${in_customer_password}
    ${no_first_signin}=    Dashboard_Actions.Get New Activity Log Count
    Run Keyword And Continue On Failure    Should Be True    ${no_first_signin}>=1
    Common_Actions.Wait For Loading
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${approver_email}    ${in_customer_password}
    ${no_second_signin}=    Dashboard_Actions.Get New Activity Log Count
    Run Keyword And Continue On Failure    Should Be Empty    ${no_second_signin}

Validate Activity highlight Count
    [Arguments]    ${approver_email}
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${approver_email}    ${in_customer_password}
    #wait for the lsit load
    ${locator}=    Dashboard_Page.divActivityLogList
    Wait Until Element Is Visible    ${locator}    120s
    # Login
    ${no_first_signin}=    Dashboard_Actions.Get Highlighted Row
    Run Keyword And Continue On Failure    Should Be True    ${no_first_signin}>=1
    Common_Actions.Customer Sign Out
    Login_Keywords.Login Customer    ${approver_email}    ${in_customer_password}
    #wait for the lsit load
    ${locator}=    Dashboard_Page.divActivityLogList
    Wait Until Element Is Visible    ${locator}    120s
    #login again
    ${no_second_signin}=    Dashboard_Actions.Get Highlighted Row
    Run Keyword And Continue On Failure    Should Be True    ${no_second_signin}==0

Validate Notification Components in Dashboard Page
    #wait for the lsit load
    ${locator}=    Dashboard_Page.divActivityLogList
    Wait Until Element Is Visible    ${locator}    120s
    #
    ${el1}=    Dashboard_Page.divActivityTypeHeader
    ${el2}=    Dashboard_Page.divActivityDateHeader
    ${el3}=    Dashboard_Page.divActivityDescHeader
    ${el4}=    Dashboard_Page.cbxActivityType
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}

#------------------- Activity Log for Profile Management ---------------------
Validate Update Pofile Activity Log
    Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    ${to_date}=    Get Current Date    result_format=%m/%d/%Y
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Profile Management    Your myCintas profile name has been changed    ${to_date}

Validate Update Password Activity Log
    [Arguments]    ${in_customer_email}   ${in_customer_password}
    Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    ${to_date}=    Get Current Date    result_format=%m/%d/%Y
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Profile Management    Your myCintas password has been changed    ${to_date}
    Impex_Keywords.Import Impex To Cahnge User Password   ${in_customer_email}    ${in_customer_password}

Validate Added Account Activity Log
    [Arguments]    ${account}
    Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    ${to_date}=    Get Current Date    result_format=%m/%d/%Y
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Profile Management    Account # ${account} has been added to your profile    ${to_date}

Validate Remove Account Activity Log
    [Arguments]    ${account}
    Common_Actions.Open Page    cintasrentalsstorefront/dashboard
    ${to_date}=    Get Current Date    result_format=%m/%d/%Y
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Profile Management    Account # ${account} has been removed to your profile    ${to_date}

#------------------------------------------------------------------------


Validate Pending SR Activity Log For SR Approver
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Approver    You have pending approval requests    ${exp_date}

Validate Pending User Request For User Admin
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    1    Approver    You have pending user requests    ${exp_date}

Validate Payment Submission
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    # Validate only First Page
    ${highlighted_elements}=    Get Matching Xpath Count    //*[@class='cintas-table-row cintas-table-highlighted-row']
    ${highlighted_elements}=    Evaluate    ${highlighted_elements}+1
    : FOR    ${row}    IN RANGE    1    ${highlighted_elements}
    \    ${passed} =    Run Keyword And Return Status    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row}    Billing    A Payment has been submitted for Account 0010637153
    \    ...    ${exp_date}
    \    Exit For Loop If    ${passed}

Validate Automatic Payment Processed
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Billing    Automatic payment processed for Account 0010637153    ${exp_date}

Validate Automatic Max Amount
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Billing    Automatic Payment max amount for Account 0010637153 is less than the amount due on the bill    ${exp_date}

Validate Automatic Payment Setup
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Billing    Automatic Payment has been set up for Account 0010637153    ${exp_date}

Validate Garment Change Having No Approver
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Account Activity    Garment change has been submitted to Cintas for 0010637153 on account # {1}    ${exp_date}

Validate Garment Change Having Approver
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Account Activity    Garment change request for 0010637153 on account # {1} has been submitted for approval.    ${exp_date}

Validate Service Change Having No Approver
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Account Activity    Service change has been submitted to Cintas for account # 0010637153.    ${exp_date}

Validate Service Change Having Approver
    @{date_time}=    Split String    ${to_date}
    @{Date}=    Split String    @{date_time}[0]    separator=.
    ${exp_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Account Activity    Service change request for account # 0010637153 has been submitted for approval.    ${exp_date}

Validate First Time Login Notification
    ${activity_log_no}    Set Variable    1
    ${act_activity_type}=    Dashboard_Actions.Get old Activity Type    ${activity_log_no}
    ${act_activity_description}=    Dashboard_Actions.Get old Activity Description    ${activity_log_no}
    Run Keyword And Continue On Failure    Should Be Equal    ${act_activity_type}    Registration
    Run Keyword And Continue On Failure    Should Be Equal    ${act_activity_description}    Welcome to myCintas

Validate No Activity Message
    ${actual_message}=    Dashboard_Actions.Get No Activity Message
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_message}    There are no activities present on your account

# This keyword will use for Manage my Contract
Validate Manage My Contract Notification
    [Arguments]    ${row_number}  ${activity_desc}
    ${to_date}=    Get Current Date    result_format=%m/%d/%Y
    AlertNotification_Validation.Validate Activity Log Message in Dashboard    ${row_number}    Account Activity    ${activity_desc}     ${to_date}
    Log  Key work execution is successful
