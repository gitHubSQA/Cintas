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
CNTR-2471A1
    [Documentation]  Roles (Contract Editor,Billing Question)
    [Tags]    SPRINT7    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A2
    [Documentation]  Roles (Contract Editor,Product or Service Issue)
    [Tags]    SPRINT6    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A3
    [Documentation]  Roles (Contract Editor,General Inquiry)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A4
    [Documentation]  Roles (Contract Editor,Change Current Product or Service)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A5
    [Documentation]  Roles (Contract Editor,Add a Product)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A6
    [Documentation]  Roles (Wearer Editor,Billing Question)
    [Tags]    SPRINT7    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A7
    [Documentation]  Roles (Wearer Editor,Product or Service Issue)
    [Tags]    SPRINT6    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A8
    [Documentation]  Roles (Wearer Editor,General Inquiry)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A9
    [Documentation]  Roles (Wearer Editor,Change Current Product or Service)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471A10
    [Documentation]  Roles (Wearer Editor,Add a Product)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}



CNTR-2471C1
    [Documentation]  Categories (olbp-viewer)
    [Tags]    SPRINT7    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471C2
    [Documentation]  Categories (olbp-payer)
    [Tags]    SPRINT6    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471C3
    [Documentation]  Categories (Contract viewer)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471C4
    [Documentation]  Categories (Wearer viewer)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471C5
    [Documentation]  Categories (sr-approver)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471C6
    [Documentation]  Categories (User-admin)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}


CNTR-2471B1
    [Documentation]  Listing Page (Contract Editor,Billing Question)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471B2
    [Documentation]  Listing Page (Contract Editor,Product or Service Issue)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471B3
    [Documentation]  Listing Page (Contract Editor,General Inquiry)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471B4
    [Documentation]  Listing Page (Wearer Editor,Change Current Product or Service)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-2471B5
    [Documentation]  Listing Page (Wearer Editor, Add a Product)
    [Tags]    APP_PROCESS    RELEASE1.3    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}
