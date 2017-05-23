*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_UserManagement/eSRVC_UserManagementUpdate_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-72A
    [Documentation]  Edit Single User
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72B
    [Documentation]  Test Firstname validation
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72C
    [Documentation]  Test Lastname validation
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72F
    [Documentation]  Test Role validation (mandatory)
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72G
    [Documentation]  Test Role validation (OLBP Payer)
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72H
    [Documentation]  Test Role validation (Contract Editor)
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}


CNTR-72I
    [Documentation]  Test Role validation (Wearer Editor)
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}


CNTR-72J1
    [Documentation]  Test Role validation (Other roles:user-admin;sr-approver;reports)
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72J2
    [Documentation]  Test Role validation (Other roles:contract-viewer;wearer-viewer;olbp-viewer)
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72O
    [Documentation]  Test multiple Roles validation
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-72P
    [Documentation]  Test Role validation (user admin cannot make himself inactive)
    [Tags]    RELEASE1.2    SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

