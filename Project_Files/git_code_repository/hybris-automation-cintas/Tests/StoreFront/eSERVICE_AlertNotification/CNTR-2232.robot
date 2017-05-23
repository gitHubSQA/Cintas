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
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_AlertNotification/eSRVC_BaillingActivityNotification_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-2232A
    [Documentation]  New Service Requests Activity Logs (SR Approver)
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_DashboardAlertNotification_Template.Dashboard Alert Notification Template
    ${testData}

CNTR-2232C
    [Documentation]  New User Requests Activity Logs (User Admin)
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_DashboardAlertNotification_Template.Dashboard Alert Notification Template
    ${testData}

CNTR-2232B
    [Documentation]  Pending Service Requests Activity Logs (SR Approver)
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_BaillingActivityNotification_Template.Bailling Activity Notification Template
    ${testData}

CNTR-2232D
    [Documentation]  Pending Requests Activity Logs (User Admin)
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_BaillingActivityNotification_Template.Bailling Activity Notification Template
    ${testData}
