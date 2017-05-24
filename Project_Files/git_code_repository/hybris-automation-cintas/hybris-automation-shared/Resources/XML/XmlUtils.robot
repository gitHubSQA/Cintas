*** Settings ***
Library           Selenium2Library
Library           Collections


*** Keywords ***
Convert Xml To Dictionary
    [Arguments]    ${xml_node}
    ${test_list}=   Create List
    : FOR    ${el}    IN    @{xml_node}
    \    log    ${el}
    \    @{child_test} =	 Get Child Elements    ${el}
    \    ${data} =    Get Xml Node Data    ${child_test}
    \    ${execute_test} =    Get From Dictionary    ${data}    execute_test
    \    log    ${execute_test}
    \    Run Keyword If    '${execute_test}' == 'True'    Append To List     ${test_list}    ${data}
    [Return]    ${test_list}

Get Xml Node Data
    [Arguments]    ${xml_list}
    ${input_dictionary} =   Create Dictionary
    : FOR    ${child}    IN    @{xml_list}
    \    ${node_name} =    set variable    ${child.tag}
    \    ${node_value} =    set variable    ${child.text}
    \    Set to Dictionary    ${input_dictionary}    ${node_name}    ${node_value}
    [Return]    ${input_dictionary}
