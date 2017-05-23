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
CNTR-122A
    [Documentation]  Single User addition BLOCKED (when try to use existing Email)
    [Tags]    RELEASE1.2   SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-122C
    [Documentation]  Single User addition
    [Tags]    RELEASE1.2   SPRINT2   USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

