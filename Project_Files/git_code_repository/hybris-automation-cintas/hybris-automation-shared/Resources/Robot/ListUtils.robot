*** Settings ***
Library           Selenium2Library


*** Keywords ***
Find Index Of Dictionary In List
    [Arguments]  ${dict_list}  ${dict_key}  ${dict_value}
    ${count} =  get length  ${dict_list}
    : FOR  ${index}  IN RANGE  0  ${count}
    \  ${row_data} =  get from list  ${dict_list}  ${index}
    \  ${value} =  get from dictionary  ${row_data}  ${dict_key}
    \  return from keyword if  "${dict_value}" == "${value}"  ${index}
    [Return]  -1
