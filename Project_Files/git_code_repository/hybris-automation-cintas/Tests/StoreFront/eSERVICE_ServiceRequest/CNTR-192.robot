*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ServiceRequest_Template.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_ServiceRequest_Template_Xml.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-192C
    [Documentation]  Validate the  Default Sorting Order for the SR list page as an Approver
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    # Defect with rejected SR's not showing date is causing script to fail
    ${testData}

CNTR-192D
    [Documentation]  Validate the SR list can be sorted by ID Asc or Desc-- Mine Page
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-192E
    [Documentation]  Validate the SR list can be sorted by Submitted Date Asc or Desc
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-192F
    [Documentation]  Validate the SR list can be sorted by Description Asc or Desc
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1    INC  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    # Defect with Description not sorting is causing script to fail, Now we don't have any sorting based on Subject
    ${testData}

CNTR-192G
    [Documentation]  Validate the SR list can be sorted by First Name Asc or Desc
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-192H
    [Documentation]  Validate the SR list can be sorted by Last Name Asc or Desc
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

CNTR-192I
    [Documentation]  Validate the SR list can be sorted by Email (if it exists)  Asc or Desc
    [Tags]    RELEASE1.2  SERVICE_REQUEST    POC    SPRINT1  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ServiceRequest_Template.Service Request Template
    ${testData}

