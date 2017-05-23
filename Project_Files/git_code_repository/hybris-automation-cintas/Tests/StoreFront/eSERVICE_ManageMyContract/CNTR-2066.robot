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
CNTR-2066A
    [Documentation]  A Contract Editor Can Add Garments To My New Employee
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-2066B
    [Documentation]  A Contract Editor Can Modify A Garment Added To A New Employee
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-2066C1
    [Documentation]   A Contract Editor Can Remove A Garment When Creating A New Employee (pdp page)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-2066C2
    [Documentation]  A Contract Editor Can Remove A Garment When Creating A New Employee (X Button from garment details)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}
