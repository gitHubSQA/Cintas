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
CNTR-2073A1
    [Documentation]  CNTR-2073A Comment Box on Garments PDP for Contract Editor [garment]
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073A2
    [Documentation]  CNTR-2073A Comment Box on Service PDP for Contract Editor [Facility]
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073A3
    [Documentation]  CNTR-2073A Hide the Comment Box on Garments PDP for Contract Viewer [garment]
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073A4
    [Documentation]  CNTR-2073A Hide the Comment Box on Garments PDP for Wearer Viewer [garment]
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073A5
    [Documentation]  CNTR-2073A Hide the Comment Box on Service PDP for Contract Viewer [Facility]
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}


CNTR-2073B1
    [Documentation]  CNTR-2073B Add comment when Adding Garment (Contract Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073B2
    [Documentation]  CNTR-2073B Add comment when Adding Service (Contract Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073D1
    [Documentation]  CNTR-2073D Add comment when Updating Garment (Contract Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073D2
    [Documentation]  CNTR-2073D Add comment when Updating Service (Contract Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073E
    [Documentation]  CNTR-2073E Add comment when Updating Garment (Wearer Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073F1
    [Documentation]  CNTR-2073F Add comment when removing Garment (Contract Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}


CNTR-2073F2
    [Documentation]  CNTR-2073F Add comment when removing service (Contract Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-2073G
    [Documentation]  CNTR-2073G Add comment when removing Garment (Wearer Editor)
    [Tags]    RELEASE1.2   SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}





