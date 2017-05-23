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
CNTR-199A1
    [Documentation]  Search for Facility Product (Description + Uppercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-199A2
    [Documentation]  Search for Facility Product (Description + Uppercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-199A3
    [Documentation]  Search for Facility Product (AccountName)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-199B
    [Documentation]  CNTR-199B Search for Facility Product (Product not Found)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

#---------------- CNTR-199C1 -----------------------------------
CNTR-199C1
    [Documentation]  CNTR-199C Search for Functionality (Search More the 3 Char Valid data)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-199C2
    [Documentation]  CNTR-199C Search for Functionality (Search less than 3 Char)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-199C3
    [Documentation]  CNTR-199C Search for Functionality (Validate Clear Filter)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

#---------------- CNTR-199D -----------------------------------
CNTR-199D1
    [Documentation]  CNTR-199D Sorting Facility Product (Description)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-199D2
    [Documentation]  CNTR-199D Sorting Facility Product (Qty)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-199D3
    [Documentation]  CNTR-199D Sorting Facility Product (AccountName)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}





