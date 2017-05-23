*** Settings ***
Library           Selenium2Library
Library           Collections
Library           XML
Library           ExcelLibrary
Library           Collections
Library           String
Library           BuiltIn
Library           ../../../hybris-automation-shared/Libraries/Saucelabs.py
Library           ../../../hybris-automation-shared/Libraries/StringUtils.py
Variables         ../../../Configurations/TestEnvironments.py
Variables         ../../../Configurations/GlobalVariables.py
Resource          ../../../hybris-automation-shared/Resources/Excel/DataSetup.robot
Resource          ../../../hybris-automation-shared/Resources/XML/XmlUtils.robot


*** Variables ***
# Sample parameters for running on Sauce Labs
${REMOTE_URL} =  http://user_name:access_key@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES} =  name:Win8 + Chrome 43,platform:Windows 8.1,browserName:chrome,version:43
${GRID_URL} =   http://10.27.235.88:4444/wd/hub


*** Keywords ***
Prepare Data From XLS
    [Arguments]    ${template_path}    ${template_name}    ${testcase_name}
    ${data} =    DataSetup.Get Testcase Data    ${template_path}    ${template_name}    ${testcase_name}
#    ${data} =    Get Testcase Data from Excel   ${template_path}    ${template_name}    ${testcase_name}
    Set Test Variable    ${testData}    ${data}

Prepare Data From XML
    [Arguments]    ${input_path}    ${testcase_name}
    ${test_list}=   Create List
    @{children} =	 Get Child Elements    ${input_path}	${testcase_name}
    @{test_list} =    Convert Xml To Dictionary     ${children}
    Set Test Variable    ${testData}    ${test_list}

Begin Web Test
    	Run Keyword If   '${TEST_LOCATION}' == 'LOCAL'    Begin Web Test Local
    	...    ELSE IF   '${TEST_LOCATION}' == 'SAUCELABS'    Begin Web Test SauceLabs
    	...    ELSE IF   '${TEST_LOCATION}' == 'GRID'    Begin Web Test GRID
    	...    ELSE    Log    Invalid 'TEST_ENVIRONMENT'

End Web Test
    Run Keyword If   '${TEST_LOCATION}' == 'LOCAL'    End Web Test Local
    ...    ELSE IF   '${TEST_LOCATION}' == 'SAUCELABS'    End Web Test SauceLabs
    ...    ELSE IF   '${TEST_LOCATION}' == 'GRID'    End Web Test GRID
    ...    ELSE    Log    Invalid 'TEST_ENVIRONMENT'

Begin Web Test GRID
        ${SITE_URL}=    Get From Dictionary    ${SITE_URL}    ${AUT_LOCATION}
        Close All Browsers
        Set Selenium Timeout    ${SELENIUM_TIME_OUT}
        Open Browser    ${SITE_URL}    ${BROWSER}   None    ${GRID_URL}
        Maximize Browser Window
        Set Selenium Speed    ${SELENIUM_SPEED}

End Web Test GRID
    [Documentation]    This is suite Teardown that will be shared by the all test cases of a suite.
    Delete All Cookies
    Close All Browsers


Begin Web Test Local
    ${SITE_URL}=    Get From Dictionary    ${SITE_URL}    ${AUT_LOCATION}
    Close All Browsers
    Set Selenium Timeout    ${SELENIUM_TIME_OUT}
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SELENIUM_SPEED}

End Web Test Local
    [Documentation]    This is suite Teardown that will be shared by the all test cases of a suite.
    Delete All Cookies
    Close All Browsers

Begin Web Test SauceLabs
    ${SITE_URL}=    Get From Dictionary    ${SITE_URL}    ${AUT_LOCATION}
    Close All Browsers
    Set Selenium Timeout    ${SELENIUM_TIME_OUT}
    Set Selenium Speed    ${SELENIUM_SPEED}
    Open Browser    ${SITE_URL}    ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    Run keyword If    '${REMOTE_URL}' != ''
    ...    Update Saucelabs Test Name
    ...    ${SUITE_NAME}: ${TEST_NAME}
    ...    ${REMOTE_URL}
    Maximize Browser Window

End Web Test SauceLabs
    [Documentation]    This is suite Teardown that will be shared by the all test cases of a suite.
    Run keyword If    '${REMOTE_URL}' != ''
    ...    Update Saucelabs Test Result
    ...    ${SUITE_NAME}: ${TEST_NAME}
    ...    ${TEST_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    Delete All Cookies
    Close All Browsers

#------------------------------- On test to include Test case name -------------------------------------
Get Testcase Data from Excel
    [Arguments]    ${template_path}    ${sheet_name}    ${testcase_name}
    [Documentation]    Get test data that will be returned to testcase
    ${header_list} =   Create List
    ${value_list} =   Create List
    ${tc_dictionary} =   Create Dictionary
    Open Excel    ${template_path}
    ${headers} =    Get Row Values    ${sheet_name}    0
    ${row_count} =    Get Row Count    ${sheet_name}
    Log  ${testcase_name}
    ${testcase_name} =   fetch from left  ${testcase_name}  :
    Log  ${testcase_name}

    : FOR    ${iRowNo}    IN RANGE    1    ${row_count}
    \    ${row_tc_name}    Read Cell Data By Coordinates    ${sheet_name}    0    ${iRowNo}
    \    ${tc_data} =    Run Keyword If    "${row_tc_name}"=="${testcase_name}"    Get Row Values    ${sheet_name}    ${iRowNo}
    \    ${tc_found} =    set variable if   "${row_tc_name}"=="${testcase_name}"   true    false
    \    Run Keyword If    "${row_tc_name}"=="${testcase_name}"    Exit For Loop
    Run Keyword If    '${tc_found}' == 'false'    Fail    Keyword 'Get Testcase Data' did not find testcase '${testcase_name}' in the excel document on sheet '${sheet_name}'

    : FOR    ${item}    IN    @{headers}
    \    ${items_headers} =    Get From List	${item}    1
    \    Append To List     ${header_list}    ${items_headers}

    : FOR    ${item}    IN    @{tc_data}
    \    ${items_value} =    Get From List	${item}    1
    \    Append To List     ${value_list}    ${items_value}

    ${count} =	  Get Length     ${header_list}

    : FOR    ${INDEX}    IN RANGE    0    ${count}
    \    ${key} =    set variable   ${header_list[${INDEX}]}
    \    ${value} =    set variable   ${value_list[${INDEX}]}
    \    Set to Dictionary    ${tc_dictionary}    ${key}    ${value}

    [Return]    ${tc_dictionary}
