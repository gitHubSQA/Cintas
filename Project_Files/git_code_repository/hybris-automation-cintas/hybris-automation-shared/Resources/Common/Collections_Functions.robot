*** Settings ***
Library           Collections

*** Keywords ***
Remove Empty Keys
    [Arguments]    ${dict}
    @{keys}=    Get Dictionary Keys    ${dict}
    :FOR    ${key}    IN    @{keys}
    \    ${value} =    Get From Dictionary    ${dict}    ${key}
    \    Run Keyword If    '${value}' == '${EMPTY}'    Remove From Dictionary    ${dict}    ${key}
    [Return]    ${dict}
