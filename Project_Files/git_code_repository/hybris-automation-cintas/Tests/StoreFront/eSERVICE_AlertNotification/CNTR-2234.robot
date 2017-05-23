*** Settings ***
Documentation     Suite description
...               Common_Keywords.End Web Test
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_AlertNotification/eSRVC_AlertNotification_Template.robot
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_CreateServiceRequest_Template.robot
Resource          ../../../Resources/Web/StoreFront/PageValidations/CreateNewRequest_Validations.robot
Resource          ../../../Resources/Web/StoreFront/PageActions/CreateNewRequest_Actions.robot
Resource          ../../../Resources/Web/StoreFront/PageActions/MyAccount_Actions.robot
Variables         ../../../Configurations/GlobalVariables.py
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-2234A
    [Documentation]  As an SR Approver I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}

CNTR-2234B
    [Documentation]  As a User Admin I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}

CNTR-2234C1
    [Documentation]  As a OLBP Viewer I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}

CNTR-2234C2
    [Documentation]  As a OLBP Payer I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}

CNTR-2234D1
    [Documentation]  As a Contract Viewer I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}

CNTR-2234D2
    [Documentation]  As a Contract Editor I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}

CNTR-2234E1
    [Documentation]  As a Wearer Viewer I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}

CNTR-2234E2
    [Documentation]  As a Wearer Editor I can Manage My Notifications
    ...
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_AlertNotification_Template.Alert Notification Template
    ${testData}
