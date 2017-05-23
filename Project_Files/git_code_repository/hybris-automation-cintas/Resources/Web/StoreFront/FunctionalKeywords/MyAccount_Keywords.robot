*** Settings ***
Resource          ../PageActions/MyAccount_Actions.robot
Resource          ../PageActions/ServiceRequestDetails_Actions.robot
Resource          ../PageActions/CreateNewRequest_Actions.robot
Resource          ../PageActions/GlobalMessage_Actions.robot
Resource          ../PageActions/Common_Actions.robot
Resource          ../PageActions/SelectAnAccount_Actions.robot
Resource          ServiceRequest_Keywords.robot
Resource          ../PageObjects/CreateNewRequest_Page.robot
Resource          ../PageValidations/Common_Validation.robot
Library           ../../../../hybris-automation-shared/Libraries/MathUtils.py
Library           String
Library           Selenium2Library

*** Keywords ***
Navigate to Notification Preferances
    Common_Actions.Open Page    cintasrentalsstorefront/my-account
    MyAccount_Actions.Click Notification Preferences Accordion Title

Unchecked User All Notificaiton Options
    [Arguments]    ${impx_ur_account_type}
    ${status1}=    MyAccount_Page.get_ProfileAllNotificationCheckBoxStatus
    ${status2}=    MyAccount_Page.get_chkBillingAllNotificationStatus
    ${status3}=    MyAccount_Page.get_chkActivityAllNotificationStatus
    ${status4}=    MyAccount_Page.get_chkApproverAllNotificationSataus
    # Make sure all checked
    Run Keyword If    '${status1}'=='${False}'    MyAccount_Actions.Click Profile All Notification Check box
    Run Keyword If    '${status2}'=='${False}'    MyAccount_Actions.Click Billing All Notification Check box
    Run Keyword If    '${status3}'=='${False}'    MyAccount_Actions.Click Activity All Notification Check box
    Run Keyword If    '${status4}'=='${False}'    MyAccount_Actions.Click Approver All Notification
    # now perform unchecked
    ${status1}=    MyAccount_Page.get_ProfileAllNotificationCheckBoxStatus
    ${status2}=    MyAccount_Page.get_chkBillingAllNotificationStatus
    ${status3}=    MyAccount_Page.get_chkActivityAllNotificationStatus
    ${status4}=    MyAccount_Page.get_chkApproverAllNotificationSataus
    Run Keyword If    '${status1}'=='${True}'    MyAccount_Actions.Click Profile All Notification Check box
    Run Keyword If    '${status2}'=='${True}'    MyAccount_Actions.Click Billing All Notification Check box
    Run Keyword If    '${status3}'=='${True}'    MyAccount_Actions.Click Activity All Notification Check box
    Run Keyword If    '${status4}'=='${True}'    MyAccount_Actions.Click Approver All Notification
    # Click Upadate save Button
    MyAccount_Actions.Click Save Update Button
    Common_Actions.Wait For Loading
    Common_Validation.Validate Global Message    Your preferences have been updated

    #--------------------------------------------------------
    #Check Later
    Comment    # Make sure all checked
    Comment    Run Keyword If    '${status1}'=='${False}'    MyAccount_Actions.Click Profile All Notification Check box
    Comment    Run Keyword If    ('${impx_ur_account_type}'=='olbp-payer' or '${impx_ur_account_type}'=='olbp-viewer') and '${status2}'=='${False}'    MyAccount_Actions.Click Billing All Notification Check box
    Comment    Run Keyword If    '${status3}'=='${False}'    MyAccount_Actions.Click Activity All Notification Check box
    Comment    Run Keyword If    ('${impx_ur_account_type}'=='sr-approver' or '${impx_ur_account_type}'=='user-admin') and '${status4}'=='${False}'    MyAccount_Actions.Click Approver All Notification
    Comment    # now perform unchecked
    Comment    Run Keyword If    '${status1}'=='${True}'    MyAccount_Actions.Click Profile All Notification Check box
    Comment    Run Keyword If    ('${impx_ur_account_type}'=='olbp-payer' or '${impx_ur_account_type}'=='olbp-viewer') and '${status2}'=='${True}'    MyAccount_Actions.Click Billing All Notification Check box
    Comment    Run Keyword If    '${status3}'=='${True}'    MyAccount_Actions.Click Activity All Notification Check box
    Comment    Run Keyword If    ('${impx_ur_account_type}'=='sr-approver' or '${impx_ur_account_type}'=='user-admin') and '${status4}'=='${True}'    MyAccount_Actions.Click Approver All Notification

Checked Profile Management Notificaiton Options
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

Checked Billing Notificaiton Options
    [Arguments]    ${impx_ur_account_type}    ${submission_status}    ${setup_status}    ${max_status}    ${processed_status}
    [Documentation]    ${submission_status} | ${setup_status} | ${max_status} | ${processed_status}=TRUE or FALSE
    # availability of options
    ${el1}=    MyAccount_Page.chkPaymentSubmissionsNotification
    ${el2}=    MyAccount_Page.chkAutoPaymentSetupNotification
    ${el3}=    MyAccount_Page.chkMaxAutoPaymentNotification
    ${el4}=    MyAccount_Page.chkAutoPaymentProcessedNotification
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    # status of options
    ${status1}=    MyAccount_Page.get_chkPaymentSubmissionsNotificationStatus
    ${status2}=    MyAccount_Page.get_chkAutoPaymentSetupNotificationStatus
    ${status3}=    MyAccount_Page.get_chkMaxAutoPaymentNotificationStatus
    ${status4}=    MyAccount_Page.get_chkAutoPaymentProcessedNotificationStatus
    Run Keyword And Continue On Failure    Should Be Equal    ${submission_status}    ${status1}
    Run Keyword And Continue On Failure    Should Be Equal    ${setup_status}    ${status2}
    Run Keyword And Continue On Failure    Should Be Equal    ${max_status}    ${status3}
    Run Keyword And Continue On Failure    Should Be Equal    ${processed_status}    ${status4}

Checked Activity Center Notificaiton Options
    [Arguments]    ${impx_ur_account_type}    ${cintas_garment_status}    ${approver_garment_status}    ${sr_reject_status}    ${sr_approved_status}    ${approver_service_status}
    ...    ${cintas_service_status}
    [Documentation]    ${cintas_garment_status} | ${approver_garment_status} | ${sr_reject_status} | ${sr_approved_status}|${approver_service_status}|${cintas_service_status}=TRUE or FALSE
    ${el1}=    MyAccount_Page.chkCintasGarmentAddChangeNotification
    ${el2}=    MyAccount_Page.chkApproverGarmentAddChangeNotification
    ${el3}=    MyAccount_Page.chkSrRejectedNotification
    ${el4}=    MyAccount_Page.chkSrApprovedNotification
    ${el5}=    MyAccount_Page.chkApproverServiceAddChangeNotification
    ${el6}=    MyAccount_Page.chkCintasServiceAddChangeNotification
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el5}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el6}
    ${status1}=    MyAccount_Page.get_chkCintasGarmentAddChangeNotificationStatus
    ${status2}=    MyAccount_Page.get_chkApproverGarmentAddChangeNotificationStatus
    ${status3}=    MyAccount_Page.get_chkSrRejectedNotificationStatus
    ${status4}=    MyAccount_Page.get_chkSrApprovedNotificationStatus
    ${status5}=    MyAccount_Page.get_chkApproverServiceAddChangeNotificationStatus
    ${status6}=    MyAccount_Page.get_chkCintasServiceAddChangeNotificationStatus
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Should Be Equal    ${cintas_garment_status}    ${status1}
    Run Keyword If    '${impx_ur_account_type}'=='contract-viewer' or '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Should Be Equal    ${approver_garment_status}    ${status2}
    Run Keyword And Continue On Failure    Should Be Equal    ${sr_reject_status}    ${status3}
    Run Keyword And Continue On Failure    Should Be Equal    ${sr_approved_status}    ${status4}
    Run Keyword And Continue On Failure    Should Be Equal    ${approver_service_status}    ${status5}
    Run Keyword And Continue On Failure    Should Be Equal    ${cintas_service_status}    ${status6}

Checked Approver Notificaiton Options
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

Checked User All Notificaiton Options
    [Arguments]    ${impx_ur_account_type}
    # Make sure all unchecked
    ${status1}=    MyAccount_Page.get_ProfileAllNotificationCheckBoxStatus
    ${status2}=    MyAccount_Page.get_chkBillingAllNotificationStatus
    ${status3}=    MyAccount_Page.get_chkActivityAllNotificationStatus
    ${status4}=    MyAccount_Page.get_chkApproverAllNotificationSataus
    Run Keyword If    '${status1}'=='${True}'    MyAccount_Actions.Click Profile All Notification Check box
    Run Keyword If    '${status2}'=='${True}'    MyAccount_Actions.Click Billing All Notification Check box
    Run Keyword If    '${status3}'=='${True}'    MyAccount_Actions.Click Activity All Notification Check box
    Run Keyword If    '${status4}'=='${True}'    MyAccount_Actions.Click Approver All Notification
    # now perform checked
    ${status1}=    MyAccount_Page.get_ProfileAllNotificationCheckBoxStatus
    ${status2}=    MyAccount_Page.get_chkBillingAllNotificationStatus
    ${status3}=    MyAccount_Page.get_chkActivityAllNotificationStatus
    ${status4}=    MyAccount_Page.get_chkApproverAllNotificationSataus
    Run Keyword If    '${status1}'=='${False}'    MyAccount_Actions.Click Profile All Notification Check box
    Run Keyword If    '${status2}'=='${False}'    MyAccount_Actions.Click Billing All Notification Check box
    Run Keyword If    '${status3}'=='${False}'    MyAccount_Actions.Click Activity All Notification Check box
    Run Keyword If    '${status4}'=='${False}'    MyAccount_Actions.Click Approver All Notification
    # Click Upadate save Button
    MyAccount_Actions.Click Save Update Button
    Common_Actions.Wait For Loading
    Common_Validation.Validate Global Message    Your preferences have been updated

#------------- Update user profile and Password ---------------------
Update User Name
    [Arguments]    ${first_name}    ${last_name}
    Common_Actions.Open Page    cintasrentalsstorefront/my-account
    Common_Actions.Wait For Loading
    MyAccount_Actions.Click User Profile Accordion Title
    Run Keyword If    '${first_name}'!='${EMPTY}'    MyAccount_Actions.Enter First Name   ${first_name}
    Run Keyword If    '${last_name}'!='${EMPTY}'     MyAccount_Actions.Enter Last Name    ${last_name}
    MyAccount_Actions.Click Save Update Profile Button
    Common_Actions.Wait For Loading
    Common_Validation.Validate Global Message    Your profile has been updated

Update User Password
    [Arguments]    ${current_password}  ${new_password}  ${confirm_password}
    Common_Actions.Open Page    cintasrentalsstorefront/my-account
    Common_Actions.Wait For Loading
    MyAccount_Actions.Click Change Password Accordion
    Run Keyword If    '${current_password}' != '${EMPTY}'    MyAccount_Actions.Enter Current Password  ${current_password}
    Run Keyword If    '${new_password}' != '${EMPTY}'        MyAccount_Actions.Enter New Password      ${new_password}
    Run Keyword If    '${confirm_password}' != '${EMPTY}'    MyAccount_Actions.Enter Confirm Password  ${confirm_password}
    MyAccount_Actions.Click Update Password Button
    Common_Actions.Wait For Loading
    Common_Validation.Validate Global Message    Your password has been changed

