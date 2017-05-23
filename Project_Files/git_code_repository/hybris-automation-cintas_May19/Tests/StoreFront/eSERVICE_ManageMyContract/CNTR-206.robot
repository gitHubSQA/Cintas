*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ManageMyContract/eSRVC_ManageMyContract_Template.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ManageMyContract/eSRVC_ManageMyContractAddWearer_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-206A
    [Documentation]  CNTR-206A Contract Viewer Can See List of My Wearers
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206B
    [Documentation]  CNTR-206B Contract Editor Can See List of My Wearers
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206D1
    [Documentation]  Search List of Wearers for Specific Wearers (FirstName+Uppercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206D2
    [Documentation]  Search List of Wearers for Specific Wearers (FirstName+Lowercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  INC  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206D3
    [Documentation]  Search List of Wearers for Specific Wearers (LastName+Uppercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206D4
    [Documentation]  Search List of Wearers for Specific Wearers (LastName+Lowercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206D5
    [Documentation]  Search List of Wearers for Specific Wearers (AccountName+Uppercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206D6
    [Documentation]  Search List of Wearers for Specific Wearers (AccountName+Lowercase)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206D7
    [Documentation]   Search List of Wearers for Specific Wearers (Account No)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206E1
    [Documentation]  CNTR-206E User Can Sort Wearers List (Last Name)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206E2
    [Documentation]  CNTR-206E User Can Sort Wearers List (First Name)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206E3
    [Documentation]  CNTR-206E User Can Sort Wearers List (Sort ID)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}

CNTR-206E4
    [Documentation]  CNTR-206E User Can Sort Wearers List (Account Name)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}


CNTR-206E5
    [Documentation]  CNTR-206E User Can Sort Wearers List (Account No)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE2    ${TEST NAME}
    [Template]    eSRVC_ManageMyContractAddWearer_Template.Manage My Contract Add Wearer Template
    ${testData}


CNTR-206F
    [Documentation]  User Can View Wearer Service Contract Details by Selecting a Wearer from the List
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}
