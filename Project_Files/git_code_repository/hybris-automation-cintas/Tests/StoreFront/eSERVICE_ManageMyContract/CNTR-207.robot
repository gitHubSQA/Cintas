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
CNTR-207B1
    [Documentation]  CNTR-207B Employee Garments Page as Contract Viewer
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-207B2
    [Documentation]  CNTR-207B Employee Garments Page as Wearer Viewer
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-207C1
    [Documentation]  CNTR-207C Employee Garments Page as Contract Editor
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-207C2
    [Documentation]  CNTR-207C Employee Garments Page as Wearer Editor
    [Tags]    RELEASE1.2    SPRINT2    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}





