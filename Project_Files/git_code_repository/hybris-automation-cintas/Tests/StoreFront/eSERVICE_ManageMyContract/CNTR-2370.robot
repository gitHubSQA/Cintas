*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ShopOutside/eSRVC_ShopOutSide_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ChatServiceRequest_Template.robot

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-2370A1
    [Documentation]  Single Payer Dashboard Component (have Due)
    [Tags]    RELEASE1.3    SPRINT6    MY_CONTACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_ChatServiceRequest_Template.Chat Service Request Template
    ${testData}

CNTR-2370A2
    [Documentation]  Single Payer Dashboard Component (NO Due)
    [Tags]    RELEASE1.3    SPRINT6    MY_CONTACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_ChatServiceRequest_Template.Chat Service Request Template
    ${testData}
