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
    [Tags]    SPRINT7    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-63B
    [Tags]    SPRINT7    APP_PROCESS    RELEASE1.3  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

# Old one
#CNTR-63A
#    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
#    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
#    ${testData}
#
#CNTR-63B
#    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
#    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
#    ${testData}

CNTR-63C
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63D
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}
    #$('.btn.btn-primary').get(2).click()

CNTR-63E
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63F
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63G
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63H
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63I
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63J
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-63L
    [Tags]    RELEASE1.2    SPRINT1    SERVICE_REQUEST    POC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}
