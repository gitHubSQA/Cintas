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
CNTR-1221C1
    [Documentation]  Only admin users associated to the Sold-to can see the registration request
    [Tags]    RELEASE1.2   SPRINT3    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-1221C2
    [Documentation]  Admin users not associated to the Sold-to can not see the registration request
    [Tags]    RELEASE1.2   SPRINT3    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-1221D
    [Documentation]  Approve user registration request (Sucessful Call)
    [Tags]    RELEASE1.2   SPRINT3    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}


CNTR-1221F
    [Documentation]  Deny user registration request
    [Tags]    RELEASE1.2   SPRINT3    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_UserManagement_Template.User Management Template
    ${testData}

