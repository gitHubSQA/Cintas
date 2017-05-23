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
*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-195A1
    [Tags]    RELEASE1.3    SERVICE_REQUEST    SPRINT5  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195A2
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195A3
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B1
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B2
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B3
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B4
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B5
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B6
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B7
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B8
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B9
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195C
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195D
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195E
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195F
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}
