*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_UserManagement/eSRVC_UserManagement_Template.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_UserManagement/eSRVC_UserManagementUpdate_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-1164A
    [Documentation]  Single User addition
    [Tags]    RELEASE1.2    SPRINT4    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

CNTR-1164B
    [Documentation]  New user Sold-to validation
    [Tags]    RELEASE1.2    SPRINT4    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}



CNTR-1164D
    [Documentation]  Update User - Create SR (Account Change)
    [Tags]    RELEASE1.3    SPRINT4    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_UserManagementUpdate_Template.User Management Update Template
    ${testData}









