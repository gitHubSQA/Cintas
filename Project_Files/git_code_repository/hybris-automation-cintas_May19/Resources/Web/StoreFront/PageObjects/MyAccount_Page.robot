*** Settings ***
Library           Selenium2Library

*** Keywords ***
btnSaveUpdate
    [Return]    css=#notificationPreferencesForm button.btn-primary

divActivityCenterSection
    [Return]    css=#notificationPreferencesForm #prefActivityCenter

divApproverSection
    [Return]    css=#notificationPreferencesForm #prefApprover

divBillingSection
    [Return]    css=#notificationPreferencesForm #prefBilling

divProfileManagementSection
    [Return]    css=#notificationPreferencesForm #prefProfile

chkProfileAllNotification
    [Return]    css=#prefProfile+span

chkBillingAllNotification
    [Return]    css=#prefBilling+span

chkActivityAllNotification
    [Return]    css=#prefActivityCenter+span

chkApproverAllNotification
    [Return]    css=#prefApprover+span

chkPasswordChangeNotification
    [Return]    css=#notification_0116+span

chkNameChangeNotification
    [Return]    css=#notification_0117+span

chkAddAccountNotification
    [Return]    css=#notification_0118+span

chkRemoveAccountNotification
    [Return]    css=#notification_0119+span

chkAutoPaymentCancelNotification
    [Return]    css=#notification_0120+span

chkPaymentSubmissionsNotification
    [Return]    css=#notification_0112+span

chkAutoPaymentSetupNotification
    [Return]    css=#notification_0113+span

chkMaxAutoPaymentNotification
    [Return]    css=#notification_0114+span

chkAutoPaymentProcessedNotification
    [Return]    css=#notification_0115+span

chkSrRejectedNotification
    [Return]    css=#notification_0106+span

chkApproverGarmentAddChangeNotification
    [Return]    css=#notification_0102+span

chkApproverServiceAddChangeNotification
    [Return]    css=#notification_0104+span

chkSrApprovedNotification
    [Return]    css=#notification_0105+span

chkCintasServiceAddChangeNotification
    [Return]    css=#notification_0103+span

chkCintasGarmentAddChangeNotification
    [Return]    css=#notification_0101+span

chkPendingSrApproveNotification
    [Return]    css=#notification_0108+span

chkNewSrApproveNotification
    [Return]    css=#notification_0107+span

chkNewUserRequestNotificationStatus
    [Return]    css=#notification_0109+span

chkPendingUserRequestNotificationStatus
    [Return]    css=#notification_0110+span

divUserProfileAccordionTitle
    [Return]    css=div#accountAccordion #stepHeaderProfileSettings .account-header-title

divChangePasswordAccordionTitle
    [Return]    css=div#accountAccordion #stepHeaderChangePassword .account-header-title

divMyAccountAccordionTitle
    [Return]    css=div#accountAccordion #stepHeaderMyLocation .account-header-title

divNotificationPreferencesAccordion
    [Return]    css=div#accountAccordion #stepHeaderNotificationPreferences .account-header-title

get_ProfileAllNotificationCheckBoxStatus
    ${status}=    Execute Javascript    return $("#prefProfile").prop("checked")
    [Return]    ${status}

get_chkActivityAllNotificationStatus
    ${status}=    Execute Javascript    return $("#prefActivityCenter").prop("checked")
    [Return]    ${status}

get_chkApproverAllNotificationSataus
    ${status}=    Execute Javascript    return $("#prefApprover").prop("checked")
    [Return]    ${status}

get_chkBillingAllNotificationStatus
    ${status}=    Execute Javascript    return $("#prefBilling").prop("checked")
    [Return]    ${status}

get_chkPasswordChangeNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0116").prop("checked")
    [Return]    ${status}

get_chkNameChangeNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0117").prop("checked")
    [Return]    ${status}

get_chkAddAccountNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0118").prop("checked")
    [Return]    ${status}

get_chkRemoveAccountNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0119").prop("checked")
    [Return]    ${status}

get_chkAutoPaymentCancelNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0120").prop("checked")
    [Return]    ${status}

get_chkPaymentSubmissionsNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0112").prop("checked")
    [Return]    ${status}

get_chkAutoPaymentSetupNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0113").prop("checked")
    [Return]    ${status}

get_chkMaxAutoPaymentNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0114").prop("checked")
    [Return]    ${status}

get_chkAutoPaymentProcessedNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0115").prop("checked")
    [Return]    ${status}

get_chkSrRejectedNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0106").prop("checked")
    [Return]    ${status}

get_chkApproverGarmentAddChangeNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0102").prop("checked")
    [Return]    ${status}

get_chkApproverServiceAddChangeNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0104").prop("checked")
    [Return]    ${status}

get_chkSrApprovedNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0105").prop("checked")
    [Return]    ${status}

get_chkCintasServiceAddChangeNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0103").prop("checked")
    [Return]    ${status}

get_chkCintasGarmentAddChangeNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0101").prop("checked")
    [Return]    ${status}

get_chkPendingSrApproveNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0108").prop("checked")
    [Return]    ${status}

get_chkNewSrApproveNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0107").prop("checked")
    [Return]    ${status}

get_chkNewUserRequestNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0109").prop("checked")
    [Return]    ${status}

get_chkPendingUserRequestNotificationStatus
    ${status}=    Execute Javascript    return $("#notification_0110").prop("checked")
    [Return]    ${status}

#----------- Update User Profile ---------
btnSaveUpdateProfile
    [Return]    css=#updateProfileForm .btn.btn-primary

txtFirstName
    [Return]    id=firstName

txtLastName
    [Return]    id=lastName

#----------- Change Password ---------
txtbxCurrentPassword
    [Return]    id=currentPassword

txtbxNewPassword
    [Return]    id=newPassword

txtbxCheckNewPassword
    [Return]    id=checkNewPassword

btnSaveUpdatePassword
    [Return]    css=#updatePasswordForm .btn.btn-primary