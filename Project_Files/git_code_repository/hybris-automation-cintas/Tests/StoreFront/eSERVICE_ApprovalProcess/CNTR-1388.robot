*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_CreateServiceRequest_Template.robot
Resource          ../../../Resources/Web/StoreFront/PageValidations/CreateNewRequest_Validations.robot
Resource          ../../../Resources/Web/StoreFront/PageActions/CreateNewRequest_Actions.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ChatServiceRequest_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-1388A
    [Documentation]  View In Progress/Closed SRs for other users as SR Approver - Single ST
    [Tags]    RELEASE1.2    SPRINT6    APP_PROCESS  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_ChatServiceRequest_Template.Chat Service Request Template
    ${testData}

CNTR-1388B
    [Documentation]  View In-Progress/Closed SRs for other users as SR Approver - Multiple ST
    [Tags]    RELEASE1.2    SPRINT6    APP_PROCESS  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_ChatServiceRequest_Template.Chat Service Request Template
    ${testData}
