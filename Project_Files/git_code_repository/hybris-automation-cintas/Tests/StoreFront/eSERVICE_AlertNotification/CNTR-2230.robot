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
CNTR-2230A
    [Documentation]  Invoice Submitted Notification
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_BaillingActivityNotification_Template.Bailling Activity Notification Template
    ${testData}

CNTR-2230B
    [Documentation]  Automatic Payment Setup
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_BaillingActivityNotification_Template.Bailling Activity Notification Template
    ${testData}

CNTR-2230C
    [Documentation]  Automatic Payment Max amount
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_BaillingActivityNotification_Template.Bailling Activity Notification Template
    ${testData}

CNTR-2230D
    [Documentation]  Automatic Payment processed
    [Tags]    RELEASE1.2    SPRINT5    ALERT_NOTIFICATION  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_ALERT_NOTIFICATION_PATH}    ALERT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_BaillingActivityNotification_Template.Bailling Activity Notification Template
    ${testData}
