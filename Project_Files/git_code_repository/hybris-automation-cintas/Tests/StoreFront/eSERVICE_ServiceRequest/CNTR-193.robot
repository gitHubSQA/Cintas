*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Setup        Common_Keywords.Begin Web Test
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ServiceRequest_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-193A1
    [Documentation]  Search for a pending approval SR in hybris (lowercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193A2
    [Documentation]  Search for a pending approval SR in hybris (uppercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193B
    [Documentation]  Search field validation in hybris
    ...
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193E1
    [Documentation]  Validate search Description in hybris (lowercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193E2
    [Documentation]  Validate search Description in hybris (uppercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193G1
    [Documentation]  Validate search Requester as a SR Approver in hybris (lowercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193G2
    [Documentation]  Validate search Requester as a SR Approver in hybris (uppercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193H1
    [Documentation]  Validate search Email as a SR Approver in hybris (lowercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-193H2
    [Documentation]  Validate search Email as a SR Approver in hybris (uppercase)
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

