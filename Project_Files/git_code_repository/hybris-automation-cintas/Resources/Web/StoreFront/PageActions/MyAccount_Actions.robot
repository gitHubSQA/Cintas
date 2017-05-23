*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          ../PageObjects/MyAccount_Page.robot

*** Keywords ***
Click Save Update Button
    ${locator} =    MyAccount_Page.btnSaveUpdate
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Profile All Notification Check box
    ${locator} =    MyAccount_Page.chkProfileAllNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Billing All Notification Check box
    ${locator} =    MyAccount_Page.chkBillingAllNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Activity All Notification Check box
    ${locator} =    MyAccount_Page.chkActivityAllNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Approver All Notification
    ${locator} =    MyAccount_Page.chkApproverAllNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Remove Account Check box
    ${locator} =    MyAccount_Page.chkRemoveAccount
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Remove Account Notification Check box
    ${locator} =    MyAccount_Page.chkRemoveAccountNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Add Account Notification Check box
    ${locator} =    MyAccount_Page.chkAddAccountNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Password Change Notification Check box
    ${locator} =    MyAccount_Page.chkPasswordChangeNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Name Change Notification Check box
    ${locator} =    MyAccount_Page.chkNameChangeNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Auto Payment Cancel Notification
    ${locator} =    MyAccount_Page.chkAutoPaymentCancelNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Payment Submissions Notification Check box
    ${locator} =    MyAccount_Page.chkPaymentSubmissionsNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Auto Payment Setup Notification
    ${locator} =    MyAccount_Page.chkAutoPaymentSetupNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Max Auto Payment Notification
    ${locator} =    MyAccount_Page.chkMaxAutoPaymentNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Auto Payment Processed Notification Check box
    ${locator} =    MyAccount_Page.chkAutoPaymentProcessedNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Service Request Rejected Notification Check box
    ${locator} =    MyAccount_Page.chkSrRejectedNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Approver Garment Add Change Notification Check box
    ${locator} =    MyAccount_Page.chkApproverGarmentAddChangeNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Approver Service Add Change Notification Check box
    ${locator} =    MyAccount_Page.chkApproverServiceAddChangeNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Service Request Approved Notification
    ${locator} =    MyAccount_Page.chkSrApprovedNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Cintas Service Add Change Notification Check box
    ${locator} =    MyAccount_Page.chkCintasServiceAddChangeNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Cintas Garment Add Change Notification Check box
    ${locator} =    MyAccount_Page.chkCintasGarmentAddChangeNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Pending SR Approve Notification Check box
    ${locator} =    MyAccount_Page.chkPendingSrApproveNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click New SR Approved Notification Check box
    ${locator} =    MyAccount_Page.chkNewSrApproveNotification
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click User Profile Accordion Title
    ${locator} =    MyAccount_Page.divUserProfileAccordionTitle
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Change Password Accordion
    ${locator} =    MyAccount_Page.divChangePasswordAccordionTitle
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click My Account Accordion Title
    ${locator} =    MyAccount_Page.divMyAccountAccordionTitle
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Notification Preferences Accordion Title
    ${locator} =    MyAccount_Page.divNotificationPreferencesAccordion
    wait until element is visible    ${locator}
    Click Element    ${locator}

Checked Profile All Notification Check box
    ${locator} =    MyAccount_Page.chkProfileAllNotification
    log    ${locator}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

#---------- Update Profile ------------------------
Click Save Update Profile Button
    ${locator} =    MyAccount_Page.btnSaveUpdateProfile
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Enter First Name
    [Arguments]    ${first_name}
    ${locator} =    MyAccount_Page.txtFirstName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${first_name}

Enter Last Name
    [Arguments]    ${last_name}
    ${locator} =    MyAccount_Page.txtLastName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${last_name}

#---------- Change Password ------------------------
Enter Current Password
    [Arguments]    ${current_password}
    ${locator} =    MyAccount_Page.txtbxCurrentPassword
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${current_password}

Enter New Password
    [Arguments]    ${new_password}
    ${locator} =    MyAccount_Page.txtbxNewPassword
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${new_password}

Enter Confirm Password
    [Arguments]    ${confirm_password}
    ${locator} =    MyAccount_Page.txtbxCheckNewPassword
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${confirm_password}

Click Update Password Button
    ${locator} =    MyAccount_Page.btnSaveUpdatePassword
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

