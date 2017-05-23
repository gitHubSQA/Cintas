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
CNTR-2065A
    [Documentation]  A Contract Editor Can Copy Garments From an Existing Wearer
    [Tags]    RELEASE1.3    SPRINT6    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}






