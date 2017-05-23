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
CNTR-2105A1
    [Documentation]  CNTR-2105A Change Sold-To selection on Garments PDP as Contact Viewer (Single ST)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2105A2
    [Documentation]  CNTR-2105A Change Sold-To selection on Garments PDP as Contact Viewer (Multiple ST)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2105B1
    [Documentation]  CNTR-2105B Change Sold-To selection on Garments PDP as Contact Editor  (Single ST)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2105B2
    [Documentation]  CNTR-2105B Change Sold-To selection on Garments PDP as Contact Editor  (Multiple ST)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2105C1
    [Documentation]  CNTR-2105C Change Sold-To selection on Garments PLP as Contact Editor  (Single ST)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2105C2
    [Documentation]  CNTR-2105C Change Sold-To selection on Garments PLP as Contact Editor  (multiple ST)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}
