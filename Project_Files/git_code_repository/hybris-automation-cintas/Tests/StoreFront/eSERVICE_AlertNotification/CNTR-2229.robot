*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_CreateServiceRequest_Template.robot
Resource          ../../../Resources/Web/StoreFront/PageValidations/CreateNewRequest_Validations.robot
Resource          ../../../Resources/Web/StoreFront/PageActions/CreateNewRequest_Actions.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_AlertNotification/eSRVC_DashboardAlertNotification_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-2229A
    [Documentation]  Profile changes via FrontEnd (Name)
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_DashboardAlertNotification_Template.Dashboard Alert Notification Template
    ${testData}

CNTR-2229C
    [Documentation]  Password Change Notification
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_DashboardAlertNotification_Template.Dashboard Alert Notification Template
    ${testData}

CNTR-2229D
    [Documentation]  Add Account profile Notification
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_DashboardAlertNotification_Template.Dashboard Alert Notification Template
    ${testData}

CNTR-2229E
    [Documentation]  Account Removed profile Notification
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_DashboardAlertNotification_Template.Dashboard Alert Notification Template
    ${testData}

