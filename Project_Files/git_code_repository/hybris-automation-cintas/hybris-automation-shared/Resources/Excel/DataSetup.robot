*** Settings ***
Library           ExcelLibrary
Library           Collections

*** Keywords ***
Get Testcase Data
    [Arguments]    ${template_path}    ${sheet_name}    ${testcase_name}
    [Documentation]    Get test data that will be returned to testcase
    ${header_list} =   Create List
    ${value_list} =   Create List
    ${tc_dictionary} =   Create Dictionary
    Open Excel    ${template_path}
    ${headers} =    Get Row Values    ${sheet_name}    0
    ${row_count} =    Get Row Count    ${sheet_name}

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