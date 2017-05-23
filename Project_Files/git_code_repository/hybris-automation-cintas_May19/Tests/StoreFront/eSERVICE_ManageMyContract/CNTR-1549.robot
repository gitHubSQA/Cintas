*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ManageMyContract/eSRVC_ManageMyContract_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-1549A1
    [Documentation]  CNTR-1549A PDP access - Role validation (sr-approver)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549A2
    [Documentation]  CNTR-1549A PDP access - Role validation (user-admin)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549A3
    [Documentation]  CNTR-1549A PDP access - Role validation (olbp-payer)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549A4
    [Documentation]  CNTR-1549A PDP access - Role validation (olbp-viewer)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549A5
    [Documentation]  CNTR-1549A PDP access - Role validation (contract-editor)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549A6
    [Documentation]  CNTR-1549A PDP access - Role validation (contract-viewer)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549A7
    [Documentation]  CNTR-1549A PDP access - Role validation (wearer-editor)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549A8
    [Documentation]  CNTR-1549A PDP access - Role validation (wearer-viewer)
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549B
    [Documentation]  CNTR-1549B PDP Show all components
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549E
    [Documentation]  CNTR-1549E PDP for Contract Viewer
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-1549F
    [Documentation]  CNTR-1549F PDP for Wearer Viewer
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}




