*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_CreateServiceRequest_Template.robot
Resource          ../../../Resources/Web/StoreFront/PageValidations/CreateNewRequest_Validations.robot
Resource          ../../../Resources/Web/StoreFront/PageActions/CreateNewRequest_Actions.robot
Variables         ../../../Configurations/${DATA_SOURCE}
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ChatServiceRequest_Template.robot

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-223A
    [Documentation]  Users Can Add Comments in an In Progress Service Request
    [Tags]    RELEASE1.3    SERVICE_REQUEST    SPRINT8  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_ChatServiceRequest_Template.Chat Service Request Template
    ${testData}

CNTR-223B
    [Documentation]  Users Cannot Add Comments in an In a Rejected Service Request
    [Tags]    RELEASE1.3    SERVICE_REQUEST    SPRINT8  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_ChatServiceRequest_Template.Chat Service Request Template
    ${testData}

CNTR-223C
    [Documentation]  Users Cannot Add Comments in an In a Closed Service Request
    [Tags]    RELEASE1.3    SERVICE_REQUEST    SPRINT8  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_ChatServiceRequest_Template.Chat Service Request Template
    ${testData}
