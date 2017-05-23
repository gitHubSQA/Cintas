*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ServiceRequest_Template.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_CreateServiceRequest_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-63A
    [Documentation]  Validate SR Details View as a Non Approver of SRs
    [Tags]    SPRINT7    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-63B
    [Documentation]  Validate SR  Details View as a SR Approver
    [Tags]    SPRINT7    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}


CNTR-63C
    [Documentation]  Validate the Approval of A Pending SR with Comments
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63D
    [Documentation]  Validate the Approval of a Pending SR without Comments
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63E
    [Documentation]  Validate Rejection of a Pending SR with Comments
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63F
    [Documentation]  Validate Rejection of a Pending SR without Comments
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63G
    [Documentation]  Validate Confirmation Pop-Up on Approve YES
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63H
    [Documentation]  Validate Confirmation Pop-Up on Approve NO
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63I
    [Documentation]  Validate Confirmation Pop-Up on Rejection YES
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63J
    [Documentation]  Validate Confirmation Pop-Up on Rejection NO
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63L
    [Documentation]  Validate Back Button on SR Details View
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

