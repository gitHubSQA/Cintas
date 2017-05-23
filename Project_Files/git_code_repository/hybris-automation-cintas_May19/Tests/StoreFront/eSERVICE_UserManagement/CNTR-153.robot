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
CNTR-153A
    [Documentation]  Validate Page layout & display
    [Tags]    RELEASE1.2    SPRINT2    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}


CNTR-153B
    [Documentation]  Deactivate User  (Yes Button)
    [Tags]    RELEASE1.2    SPRINT2    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}


CNTR-153C
    [Documentation]  Cancel deactivating user by clicking X (Cancel or Close Button)
    [Tags]    RELEASE1.2    SPRINT2    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}

CNTR-153D
    [Documentation]  Cancel deactivating user by selecting NO on Overlay (No Button)
    [Tags]    RELEASE1.2    SPRINT2    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}


