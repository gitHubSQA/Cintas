*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ShopOutside/eSRVC_ShopOutSide_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-2346A
    [Documentation]
    [Tags]    RELEASE1.3    SHOOP    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${SHOOP_PATH}    SHOOP_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ShopOutSide_Template.Shop Out Program Template
    ${testData}

CNTR-2346B
    [Documentation]
    [Tags]    RELEASE1.3    SHOOP    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${SHOOP_PATH}    SHOOP_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ShopOutSide_Template.Shop Out Program Template
    ${testData}

CNTR-2346C
    [Documentation]
    [Tags]    RELEASE1.3    SHOOP    SPRINT7  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${SHOOP_PATH}    SHOOP_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ShopOutSide_Template.Shop Out Program Template
    ${testData}
