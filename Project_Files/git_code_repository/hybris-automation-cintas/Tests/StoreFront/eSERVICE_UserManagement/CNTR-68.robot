*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_UserManagement/eSRVC_UserManagement_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-68A
    [Documentation]  Validate the Approvals count (User Admin)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-68B
    [Documentation]  Validate menu bahavior - User Admin (Pending User)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-68C
    [Documentation]  Validate menu bahavior - SR Approver (Pending SR)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-68D1
    [Documentation]  Validate menu bahavior - User Admin & SR Approver (Pending User)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-68D2
    [Documentation]  Validate menu bahavior - User Admin & SR Approver (Pending User)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-68E1
    [Documentation]  CNTR-68E Validate menu bahavior - No Approval role (olbp-payer)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-68E2
    [Documentation]  CNTR-68E Validate menu bahavior - No Approval role (olbp-viewer)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-68E3
    [Documentation]  Validate menu bahavior - No Approval role (contract-editor)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-68E4
    [Documentation]  Validate menu bahavior - No Approval role (contract-viewer)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-68G
    [Documentation]  Validate the Approvals total count (User Admin and SR Approver)
    [Tags]    RELEASE1.2    SPRINT1    USER    BATCH1  TEST
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}




    