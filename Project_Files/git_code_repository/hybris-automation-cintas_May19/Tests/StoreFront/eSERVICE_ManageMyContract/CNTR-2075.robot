*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ManageMyContract/eSRVC_ManageMyContractAddWearer_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-2075A
    [Documentation]  CNTR-2075A A Contract Editor Can Add an Account When Creating A New Wearer
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  INC
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-2075B
    [Documentation]  CNTR-2075B As A Contract Editor If I Modify My Account During The Create Process I want To Clear Previously Selected Garments
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}



