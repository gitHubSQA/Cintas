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
CNTR-96A
    [Documentation]  Product Detail Page Layout Conforms to Wireframe for Editor and Viewer (Contract Editor)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96B1
    [Documentation]  CNTR-96B A Contract Editor Can Edit Product Attributes for Wearers (Color, Size, Sleeve)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96B2
    [Documentation]  CNTR-96B A Contract Editor Can Edit Product Attributes for Wearers  (Fit, Sleeve)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96B3
    [Documentation]  CNTR-96B A Contract Editor Can Edit Product Attributes for Wearers (All Attributes)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96C1
    [Documentation]  A Wearer Editor Can Edit Products Attributes (Color, Size, Sleeve)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96C2
    [Documentation]  A Wearer Editor Can Edit Products Attributes (Fit, Sleeve)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96C3
    [Documentation]  A Wearer Editor Can Edit Products Attributes (All Attributes)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96D
    [Documentation]  If A Editor makes No Changes Do Not Send A Notification [Update Uniform]
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96E
    [Documentation]  A Contract Viewer Can View Product Attributes of My Wearers
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96F
    [Documentation]  A Wearer Viewer can View My Products Attributes
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96G
    [Documentation]  A Contract Editor Can Remove An Employee [Employee Garment Page]
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96H1
    [Documentation]  A Contact Editor Can Remove a Garment (Contract Garment Page)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}

CNTR-96H2
    [Documentation]  A Contact Editor Can Remove a Garment (PDP Page)
    [Tags]    RELEASE1.2    SPRINT4    CONTRACT  BATCH2
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${CONTRACT_PATH}    CONTRACT_TEMPLATE1    ${TEST NAME}
    [Template]    eSRVC_ManageMyContract_Template.Manage My Contract Template
    ${testData}






