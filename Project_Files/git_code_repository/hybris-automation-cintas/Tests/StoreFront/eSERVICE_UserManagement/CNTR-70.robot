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
CNTR-70A
    [Documentation]  Single User addition
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70B
    [Documentation]  Test Firstname validation
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-70C
    [Documentation]  Test Lastname validation
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70D1
    [Documentation]  Test Email validation (Empty)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70D2
    [Documentation]  Test Email validation (Email mask)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70E
    [Documentation]  Test Email validation (Existing User)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70F
    [Documentation]  Test Role validation (mandatory)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70G
    [Documentation]  Test Role validation (OLBP Payer)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-70H
    [Documentation]  Test Role validation (Contract Editor)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70I
    [Documentation]  Test Role validation (Wearer Editor)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70J1
    [Documentation]  Test Role validation (Other roles:user-admin;sr-approver;reports)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-70J2
    [Documentation]  Test Role validation (Other roles:contract-viewer;wearer-viewer;olbp-viewer)
    [Tags]    RELEASE1.2    SPRINT1   USER
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70O
    [Documentation]  Single User addition with multiple roles
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70P1
    [Documentation]  Page Access (user-admin)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-70P2
    [Documentation]  Page Access (non user-admin)
    [Tags]    RELEASE1.2    SPRINT1   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


