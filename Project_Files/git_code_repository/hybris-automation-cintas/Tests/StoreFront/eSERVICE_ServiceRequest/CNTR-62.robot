*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ServiceRequest_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-62A
    [Documentation]  Validate SR Pending Approval View with user who is not an SR Approver
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-62D
    [Documentation]  Create a Service Request Without Specifying details
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-62E
    [Documentation]  Validate Visible Fields for Rejected Status
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}
