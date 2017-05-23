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
    [Documentation]  As A User I Cannot Upload a File if it is Greater than 10 MB
    [Tags]    RELEASE1.3    SERVICE_REQUEST    SPRINT5  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195A2
    [Documentation]  As A User I Cannot Upload a File if it is Not in Whhitelisted File Extension
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195A3
    [Documentation]  As A User I Cannot Upload an Empty File
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B1
    [Documentation]  User Having SR Approval  can Upload a File (.doc and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B2
    [Documentation]  User Having SR Approval  can Upload a File (.docx and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B3
    [Documentation]  User Having SR Approval  can Upload a File (.xls and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B4
    [Documentation]  User Having SR Approval  can Upload a File (.xlsx and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B5
    [Documentation]  User Having SR Approval  can Upload a File (.pdf and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B6
    [Documentation]  User Having SR Approval  can Upload a File (.jpg and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B7
    [Documentation]  User Having SR Approval  can Upload a File (.png and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B8
    [Documentation]  User Having SR Approval  can Upload a File (.txt  and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195B9
    [Documentation]  User Having SR Approval  can Upload a File (.xml and size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195C
    [Documentation]  User Having No SR Approval  can Upload a File (.jpg nad size less than 10 MB)
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195D
    [Documentation]  User can Remove Uploaded File while creating service request
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195E
    [Documentation]  SR Approver wants to see the Attachment of a pending approval SR while Approving or Rejecting
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

CNTR-195F
    [Documentation]  As a User I want to See the Attachment I have added to my SR While Pending Approval
    [Tags]    RELEASE1.3    SPRINT5    SERVICE_REQUEST  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${ESRVC_SERVICE_REQUEST_PATH}    SR_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_CreateServiceRequest_Template.Create Service Request Template
    ${testData}

