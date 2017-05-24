*** Settings ***
Library           RequestsLibrary
Library           Selenium2Library
Library           Collections
Library           OperatingSystem
Library           String
Library           ../../Libraries/HtmlUtils.py


*** Keywords ***
HAC Import Impex
    [Arguments]     ${browser_url}    ${impex}    ${username}    ${password}
    ${auth} =  Create List    ${username}    ${password}
    Create Session    httpbin    ${browser_url}    auth=${auth}
    ${headers} =   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${resp1} =  Get Request  httpbin    /    headers=${headers}
    Should Be Equal As Strings  ${resp1.status_code}  200
    ${jsessionid}  Set Variable    ${resp1.cookies['JSESSIONID']}
    ${CSRFToken} =    get_node_value_by_name    ${resp1.content}    input    _csrf
    ${params} =   Create Dictionary   scriptContent=${impex}    validationEnum=IMPORT_STRICT     maxThreads=4    encoding=UTF-8    _csrf=${CSRFToken}
    ${resp2}=  Post Request  httpbin    /console/impex/import     data=${params}      headers=${headers}
    Should Be Equal As Strings  ${resp2.status_code}  200
    ${impex_response} =    Set Variable    ${resp2.content}
    Should Not Contain    ${impex_response}    Import has encountered problems
    Should Contain    ${impex_response}    Import finished successfully
    [Return]    ${impex_response}

HAC Import Impex From File
    [Arguments]     ${browser_url}    ${file_path}    ${username}    ${password}
    ${impex_data} =    Get Binary File    ${file_path}
    HAC Import Impex     ${browser_url}    ${impex_data}    ${username}    ${password}

HAC Get Property Value
    [Arguments]     ${browser_url}    ${key}    ${username}    ${password}
    ${auth}=  Create List    ${username}    ${password}
    Create Session    httpbin    ${browser_url}    auth=${auth}
    ${headers} =   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${resp1} =  Get Request  httpbin    /   headers=${headers}
    Should Be Equal As Strings  ${resp1.status_code}  200
    ${jsessionid}  Set Variable    ${resp1.cookies['JSESSIONID']}
    ${CSRFToken} =    get_node_value_by_name    ${resp1.content}    input    _csrf
    Set To Dictionary    ${headers}    X-CSRF-TOKEN    ${CSRFToken}
    ${resp2}=  Get Request  httpbin    /platform/config    headers=${headers}
    Should Be Equal As Strings  ${resp2.status_code}  200
    ${config_value} =    get_node_value_by_name    ${resp2.content}    input    ${key}
    [Return]    ${config_value}

HAC Modify Property Value
    [Arguments]     ${browser_url}    ${key}    ${value}    ${username}    ${password}
    ${auth}=  Create List    ${username}    ${password}
    Create Session    httpbin    ${browser_url}    auth=${auth}
    ${headers} =   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${resp1} =  Get Request  httpbin    /    headers=${headers}
    Should Be Equal As Strings  ${resp1.status_code}  200
    ${jsessionid}  Set Variable    ${resp1.cookies['JSESSIONID']}
    ${CSRFToken} =    get_node_value_by_name    ${resp1.content}    input    _csrf
    Set To Dictionary    ${headers}    X-CSRF-TOKEN    ${CSRFToken}
    ${params} =   Create Dictionary   key=${key}   val=${value}
    ${resp2}=  Post Request  httpbin    /platform/config/configstore/     data=${params}      headers=${headers}
    Should Be Equal As Strings  ${resp2.status_code}  200
    ${response_content} =    Set Variable    ${resp2.content}
    Should Contain    ${response_content}    {"action":"update","hasEdited":false}
    [Return]    ${response_content}

HAC Execute Scripting Language
    [Arguments]     ${browser_url}    ${script}    ${language}    ${username}    ${password}
    ${language_type} =    Convert To Lowercase	${language}
    @{valid_language_types} =	Create List    groovy    javascript    beanshell
    List Should Contain Value    ${valid_language_types}    ${language_type}
    ${auth}=  Create List    ${username}    ${password}
    Create Session    httpbin    ${browser_url}    auth=${auth}
    ${headers} =   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${resp1} =  Get Request    httpbin    /    headers=${headers}
    Should Be Equal As Strings  ${resp1.status_code}  200
    ${jsessionid}  Set Variable    ${resp1.cookies['JSESSIONID']}
    ${CSRFToken} =    get_node_value_by_name    ${resp1.content}    input    _csrf
    Set To Dictionary    ${headers}    X-CSRF-TOKEN    ${CSRFToken}
    ${params} =   Create Dictionary   script=${script}    scriptType=${language_type}     commit=false
    ${resp2}=  Post Request  httpbin    /console/scripting/execute     data=${params}      headers=${headers}
    Should Be Equal As Strings  ${resp2.status_code}  200
    ${script_response} =    Set Variable    ${resp2.content}
    Should Not Contain    ${script_response}    Script execution has failed
    Should Not Contain    ${script_response}    MultipleCompilationErrorsException
    [Return]    ${script_response}

HAC Monitoring Clear Cache
    [Arguments]     ${browser_url}    ${username}    ${password}
    ${auth}=  Create List    ${username}    ${password}
    Create Session    httpbin    ${browser_url}    auth=${auth}
    ${headers} =   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${resp1} =  Get Request    httpbin    /    headers=${headers}
    Should Be Equal As Strings  ${resp1.status_code}  200
    ${jsessionid}  Set Variable    ${resp1.cookies['JSESSIONID']}
    ${CSRFToken} =    get_node_value_by_name    ${resp1.content}    input    _csrf
    Set To Dictionary    ${headers}    X-CSRF-TOKEN    ${CSRFToken}
    ${resp2}=  Post Request  httpbin    /monitoring/cache/regionCache/clear     headers=${headers}
    Should Be Equal As Strings  ${resp2.status_code}  200
    ${script_response} =    Set Variable    ${resp2.content}
    Log    ${script_response}
    Should Not Contain    ${script_response}    fail
    [Return]    ${script_response}

HAC Execute Cronejob
    [Arguments]     ${browser_url}    ${cronjob_name}    ${async}    ${username}    ${password}
    ${async} =    Convert To Lowercase	${async}
    @{valid_async} =	Create List    true    false
    List Should Contain Value    ${valid_async}    ${async}
    ${script} =    Set Variable    import de.hybris.platform.cronjob.model.CronJobModel;\n\ndef example = new CronJobModel();\nexample.setCode('${cronjob_name}')\n\ndef cronjob = modelService.getByExample(example);\n\ncronJobService.performCronJob(cronjob, ${async});
    log    ${script}
    Hac_API.HAC Execute Scripting Language     ${browser_url}    ${script}    groovy    ${username}    ${password}

HAC Execute Flexible Search
    [Arguments]     ${browser_url}    ${query}    ${username}    ${password}
    [Documentation]    The following function will run a flexible search and return
    ...    - the content of the response recieved from the API call.
    ...
    ${auth}=  Create List    ${username}    ${password}
    Create Session    httpbin    ${browser_url}    auth=${auth}
    ${headers} =   Create Dictionary     Content-Type=application/x-www-form-urlencoded
    ${resp1} =  Get Request    httpbin    /    headers=${headers}
    Should Be Equal As Strings  ${resp1.status_code}  200
    ${jsessionid}  Set Variable    ${resp1.cookies['JSESSIONID']}
    ${CSRFToken} =    get_node_value_by_name    ${resp1.content}    input    _csrf
    Set To Dictionary    ${headers}    X-CSRF-TOKEN    ${CSRFToken}
    ${params} =   Create Dictionary   flexibleSearchQuery=${query}    sqlQuery=${EMPTY}    maxCount=200    user=admin    locale=en     commit=false
    Log    ${params}
    ${resp2}=  Post Request  httpbin    /console/flexsearch/execute     data=${params}      headers=${headers}
    Should Be Equal As Strings  ${resp2.status_code}  200
    ${script_response} =    Set Variable    ${resp2.content}
    Should Contain    ${script_response}    "exception":null
    Should Contain    ${script_response}    "exceptionStackTrace":""
    [Return]    ${script_response}

HAC Execute Flexible Search Return List
    [Arguments]     ${browser_url}    ${query}    ${username}    ${password}
    [Documentation]    The following function will run a flexible search and return
    ...    the content in the form of a List of Dictionaries of the response received
    ...    from the API call.  It will combine the 'headers' with the 'resultList' from
    ...    the json that is returned.
    ...
    ${result_list} =   Create List
    ${script_response} =    Hac_API.HAC Execute Flexible Search     ${browser_url}    ${query}    ${username}    ${password}
    ${script_response} =    Replace String    ${script_response}    \\"    '
    ${resp_dict} =    evaluate    json.loads('''${script_response}''')    json
    ${headers} =    Get From Dictionary    ${resp_dict}    headers
    ${all_results} =    Get From Dictionary    ${resp_dict}    resultList
    ${result_count} =    Get Length    ${all_results}
    Return From Keyword If    ${result_count} == 0    ${result_list}
    : FOR    ${result}    IN    @{all_results}
    \    ${row_and_headers} =    Hac_API.Insert Data Row    ${headers}    ${result}
    \    Append To List    ${result_list}    ${row_and_headers}
    [Return]    ${result_list}

Insert Data Row
    [Arguments]    ${headers}    ${results}
    [Documentation]    The following function is called by HAC Execute Flexible Search Return List.
    ...    Becase Robot Framework does not allow nested for loops, this method was created.
    ${length} =    Get Length    ${headers}
    ${result_dict} =   Create Dictionary
    : FOR    ${INDEX}    IN RANGE    0    ${length}
    \    ${header} =    Get From List   ${headers}    ${INDEX}
    \    ${result} =    Get From List   ${results}    ${INDEX}
    \    Set to Dictionary    ${result_dict}    ${header}    ${result}
    [Return]    ${result_dict}

