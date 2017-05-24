*** Settings ***
Library           ExcelLibrary
Library           Collections

*** Keywords ***
Get Data From Excel Document
    [Arguments]    ${template_path}    ${sheet_name}    ${index_column_name}    ${index_value}
    [Documentation]    Get any row of data by passing column name to use as unique identifier and row value
    ${header_list} =   Create List
    ${value_list} =   Create List
    ${excel_dict} =   Create Dictionary
    Open Excel    ${template_path}
    ${headers} =    Get Row Values    ${sheet_name}    0
    ${row_count} =    Get Row Count    ${sheet_name}
    ${column_count} =    Get Column Count    ${sheet_name}

    : FOR    ${iColumnNo}    IN RANGE    0    ${column_count}
    \    ${header}    Read Cell Data By Coordinates    ${sheet_name}    ${iColumnNo}    0
    \    Run Keyword If    "${header}"=="${index_column_name}"    Set Test Variable    ${colNum}    ${iColumnNo}
    \    ${column_found} =    set variable if   "${header}"=="${index_column_name}"   True    False
    \    Run Keyword If    "${header}"=="${index_column_name}"    Exit For Loop
    Run Keyword If    ${column_found} == False    Fail    Keyword 'Get Data From Excel Document' did not find column '${index_column_name}' in the excel document on sheet '${sheet_name}'

    : FOR    ${iRowNo}    IN RANGE    1    ${row_count}
    \    ${row_cell_data}    Read Cell Data By Coordinates    ${sheet_name}    ${colNum}    ${iRowNo}
    \    ${row_data} =    Run Keyword If    "${row_cell_data}"=="${index_value}"    Get Row Values    ${sheet_name}    ${iRowNo}
    \    ${row_found} =    set variable if   "${row_cell_data}"=="${index_value}"   True    False
    \    Run Keyword If    "${row_cell_data}"=="${index_value}"    Exit For Loop
    Run Keyword If    ${row_found} == False    Fail    Keyword 'Get Data From Excel Document' did not find row '${index_value}' in the excel document on sheet '${sheet_name}'

    : FOR    ${item}    IN    @{headers}
    \    ${items_headers} =    Get From List	${item}    1
    \    Append To List     ${header_list}    ${items_headers}

    : FOR    ${item}    IN    @{row_data}
    \    ${items_value} =    Get From List	${item}    1
    \    Append To List     ${value_list}    ${items_value}

    : FOR    ${INDEX}    IN RANGE    0    ${column_count}
    \    ${key} =    set variable   ${header_list[${INDEX}]}
    \    ${value} =    set variable   ${value_list[${INDEX}]}
    \    Set to Dictionary    ${excel_dict}    ${key}    ${value}
    [Return]    ${excel_dict}

Get Excel Document Sheet Row Count
    [Arguments]    ${template_path}    ${sheet_name}
    Open Excel    ${template_path}
    ${row_count} =    Get Row Count    ${sheet_name}
    ${row_count} =    Evaluate    ${row_count}-1
    [Return]    ${row_count}

Convert Excel Document To Dictionary
    [Arguments]    ${template_path}    ${sheet_name}
    [Documentation]    Get any row of data by passing column name to use as unique identifier and row value
    ${final_list} =   Create List
    ${header_list} =   Create List
    ${excel_dict} =   Create Dictionary
    Open Excel    ${template_path}
    ${headers} =    Get Row Values    ${sheet_name}    0
    ${row_count} =    Get Row Count    ${sheet_name}
    ${column_count} =    Get Column Count    ${sheet_name}

    : FOR    ${item}    IN    @{headers}
    \    ${items_headers} =    Get From List	${item}    1
    \    Append To List     ${header_list}    ${items_headers}

    : FOR    ${iRowNo}    IN RANGE    1    ${row_count}
    \    ${row_data} =    Get Row Values    ${sheet_name}    ${iRowNo}
    \    ${row_data} =    Create List From Row Data    ${row_data}
    \    ${excel_dict} =   ExcelUtils.Create Dictionary For Row    ${header_list}    ${row_data}
    \    Append To List     ${final_list}    ${excel_dict}
    [Return]    ${final_list}

Get Matching Row From Excel
    [Arguments]    ${template_path}    ${sheet_name}    ${index_column_name}    ${index_value}
    [Documentation]    Get all rows of data by passing column name and row value
    ${final_list} =   Create List
    ${header_list} =   Create List
    ${excel_dict} =   Create Dictionary
    Open Excel    ${template_path}
    ${headers} =    Get Row Values    ${sheet_name}    0
    ${row_count} =    Get Row Count    ${sheet_name}
    ${column_count} =    Get Column Count    ${sheet_name}

    : FOR    ${iColumnNo}    IN RANGE    0    ${column_count}
    \    ${header}    Read Cell Data By Coordinates    ${sheet_name}    ${iColumnNo}    0
    \    Run Keyword If    "${header}"=="${index_column_name}"    Set Test Variable    ${colNum}    ${iColumnNo}
    \    ${column_found} =    set variable if   "${header}"=="${index_column_name}"   True    False
    \    Run Keyword If    "${header}"=="${index_column_name}"    Exit For Loop
    Run Keyword If    ${column_found} == False    Fail    Keyword 'Get Data From Excel Document' did not find column '${index_column_name}' in the excel document on sheet '${sheet_name}'

    : FOR    ${item}    IN    @{headers}
    \    ${items_headers} =    Get From List	${item}    1
    \    Append To List     ${header_list}    ${items_headers}

    : FOR    ${iRowNo}    IN RANGE    1    ${row_count}
    \    ${row_cell_data}    Read Cell Data By Coordinates    ${sheet_name}    ${colNum}    ${iRowNo}
    \    ${row_data} =    Run Keyword If    "${row_cell_data}"=="${index_value}"    Get Row Values    ${sheet_name}    ${iRowNo}
    \    ${row_data} =    Run Keyword If    "${row_cell_data}"=="${index_value}"    Create List From Row Data    ${row_data}
    \    ${excel_dict} =   Run Keyword If    "${row_cell_data}"=="${index_value}"    ExcelUtils.Create Dictionary For Row    ${header_list}    ${row_data}
    \    Run Keyword If    "${row_cell_data}"=="${index_value}"    Append To List     ${final_list}    ${excel_dict}
    ${found_row_count} =    Get Length    ${final_list}
    Run Keyword If    ${found_row_count} == 0   Fail    Keyword 'Get Matching Row From Excel' did not find any rows with value '${index_value}' in the excel document on sheet '${sheet_name}'
    [Return]    ${final_list}


Create List From Row Data
    [Arguments]    ${row_data}
    ${row_list} =   Create List
    : FOR    ${item}    IN    @{row_data}
    \    ${items_value} =    Get From List	${item}    1
    \    Append To List     ${row_list}    ${items_value}
    [Return]    ${row_list}

Create Dictionary For Row
    [Arguments]    ${header_list}    ${row_value_list}
    ${dict} =   Create Dictionary
    ${column_count} =    get length   ${header_list}
    : FOR    ${INDEX}    IN RANGE    0    ${column_count}
    \    ${key} =    set variable   ${header_list[${INDEX}]}
    \    ${value} =    set variable   ${row_value_list[${INDEX}]}
    \    Set to Dictionary    ${dict}    ${key}    ${value}
    [Return]    ${dict}
