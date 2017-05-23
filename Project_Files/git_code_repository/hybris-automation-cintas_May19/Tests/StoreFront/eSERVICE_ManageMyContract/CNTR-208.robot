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
CNTR-208A1
    [Documentation]  CNTR-208A As a Single Contract Wearer I want to go directly to my garments on landing on E-Service (single SoldTos)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-208A2
    [Documentation]  CNTR-208A As a Single Contract Wearer I want to go directly to my garments on landing on E-Service (Multiple SoldTos)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

# TODO: I need test data to run this test cases.
CNTR-208B
    [Documentation]  CNTR-208B As a Multi-Contract Wearer I want to go directly to a Contract Selection Screen on landing on E-Service (multi contract under SoldTo)
    [Tags]    RELEASE1.2   SPRINT3    CONTRACT  INC  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}




