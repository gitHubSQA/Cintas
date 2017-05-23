*** Settings ***
Documentation     Suite description
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_UserManagement/eSRVC_UserManagementFilterSorting_Template.robot
Variables         ../../../Configurations/${DATA_SOURCE}

*** Variables ***
${INPUT_FILES}    ${EMPTY}

*** Test Cases ***
CNTR-147I
    [Documentation]  Display - Filtering options display
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147J
    [Documentation]  Display - Results view display
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147K
    [Documentation]  Defaults - Filtering options defaults status
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147L
    [Documentation]  Defaults - Filtering options defaults (10 Entry Per page)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147N
    [Documentation]  Pagination - Get to a results page with 0 results
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147O
    [Documentation]  Pagination - Get to a results page with greater then 0 but less than 10 results
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147P
    [Documentation]  Pagination - Get to a results page with greater then 0 but less than 10 results
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147Q
    [Documentation]  Defaults - Results view Default sort order (Last Name)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147R
    [Documentation]  Pagination - Get to a results page with greater then 0 but less than 10 results
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147S1
    [Documentation]  Lines - Click on a whole line (Active)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147S2
    [Documentation]  Lines - Click on a whole line (Inactive)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147S3
    [Documentation]  Lines - Click on a whole line (Pending)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147S4
    [Documentation]  CNTR-147S Lines - Click on a whole line (Rejected)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147T1
    [Documentation]  Keywords - Perform a Keyword search - Validation (No Result)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147T2
    [Documentation]  Keywords - Perform a Keyword search - Validation (3 Char)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147U1
    [Documentation]  Keywords - Perform a Keyword search with a valide value (First Name)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147U2
    [Documentation]  Keywords - Perform a Keyword search with a valide value (Last Name)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147U3
    [Documentation]  Keywords - Perform a Keyword search with a valide value (Email)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147V
    [Documentation]  Keywords - Click "X" to clear a keyword field facet
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147W1
    [Documentation]  Keywords - Perform a Keyword search with blank spaces (blank+key)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147W2
    [Documentation]  Keywords - Perform a Keyword search with blank spaces (key+blank)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147W3
    [Documentation]  Keywords - Perform a Keyword search with blank spaces (ONLY 4 SPACE)
    [Tags]    RELEASE1.2    SPRINT1    USER  INC
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

#-------------

CNTR-147Y1
    [Documentation]  Sorting - Change the list sorting  (Active,Last Name, ASC)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147Y2
    [Documentation]  Sorting - Change the list sorting  (Active,Last Name, DSC)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147Y3
    [Documentation]  Sorting - Change the list sorting (Active,First Name, ASC)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147Y4
    [Documentation]  Sorting - Change the list sorting (Active,First Name, DSC)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


CNTR-147Y5
    [Documentation]  Sorting - Change the list sorting (Active,Email,ASC)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147Y6
    [Documentation]  Sorting - Change the list sorting (Active,Email,DSC)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147Y7
    [Documentation]  CNTR-147Y Sorting - Change the list sorting (Active, Date, Asc)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}

CNTR-147Y8
    [Documentation]  CNTR-147Y Sorting - Change the list sorting (Active, Date, Dsc)
    [Tags]    RELEASE1.2    SPRINT1    USER  BATCH1
    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
    ${testData}


#------------
#
#CNTR-147Y9
#    [Documentation]  Sorting - Change the list sorting  (Pending,Last Name, ASC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}
#
#CNTR-147Y10
#    [Documentation]  Sorting - Change the list sorting  (Pending,Last Name, DSC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}
#
#
#CNTR-147Y11
#    [Documentation]  Sorting - Change the list sorting (Active,First Name, ASC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}
#
#CNTR-147Y12
#    [Documentation]  Sorting - Change the list sorting (Active,First Name, DSC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}
#
#
#CNTR-147Y13
#    [Documentation]  Sorting - Change the list sorting (Pending,Email, ASC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}
#
#CNTR-147Y14
#    [Documentation]  Sorting - Change the list sorting (Pending,Email, DSC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}
#
#CNTR-147Y15
#    [Documentation]  Sorting - Change the list sorting  (Active,Last Name, ASC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}
#
#CNTR-147Y16
#    [Documentation]  Sorting - Change the list sorting  (Active,Last Name, DSC)
#    [Tags]    RELEASE1.2    SPRINT1    USER  INC
#    [Setup]    Common_Keywords.Prepare Data From XLS    ${INPUT_FILES}${USER_MNG_PATH}    USER_MANAGEMENT_TEMPLATE3    ${TEST NAME}
#    [Template]    eSRVC_UserManagementFilterSorting_Template.User Management Sorting And Filtering Template
#    ${testData}


