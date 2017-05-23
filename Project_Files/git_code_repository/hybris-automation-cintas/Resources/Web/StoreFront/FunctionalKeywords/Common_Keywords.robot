*** Settings ***
Library           Selenium2Library
Library           ExcelLibrary
Library           Collections


*** Keywords ***
# TODO: I will enhance all the keywords to refect our common requirements
# This resource will contain the keyword that will be shared by all the test cases.
Verify Label
   [Arguments]    ${locator}    ${label}
    [Documentation]    Verifies that label element identified by locator has tet label.
    Element Text Should Be    css=label[for=${locator}]    ${label}

Verify Placeholder
    [Arguments]    ${locator}    ${placeholder}
    [Documentation]    Verifies that element identified by locator has placeholder attribute with value of placeholder.
    ${attr}    Get Element Attribute    ${locator}@placeholder
    Should Be Equal    ${attr}    ${placeholder}

Go To And Verify Page
    [Arguments]    ${url}    ${title}=${empty}
    [Documentation]    Navigates the active browser instance to the provided URL.
    ...    Verifies that current URL is exactly url.
    ...    Verifies that current page title equals title.
    Go To    ${url}
    Location Should Be    ${url}
    Run Keyword Unless    '${title}'=='${empty}'    Title Should Be    ${title}

Input Text And Verify Field
    [Arguments]    ${locator}    ${text}    ${label}=${empty}    ${placeholder}=${empty}
    [Documentation]    Waits until page contain element identified by locator.
    ...    Types the given text into text field identified by locator.
    ...    Verifies that proper label element and placeholder attribute are found.
    ...    Verifes that text field value is what it was set to.
    Wait Until Page Contains Element    ${locator}
    Input Text    ${locator}    ${text}
    Run Keyword Unless    '${label}'=='${empty}'    Verify Label    ${locator}    ${label}
    Run Keyword Unless    '${placeholder}'=='${empty}'    Verify Placeholder    ${locator}    ${placeholder}
    ${value}    Get Value    ${locator}
    Should Be Equal As Strings    ${value}    ${text}

Input Password And Verify Field
    [Arguments]    ${locator}    ${password}    ${label}=${empty}    ${placeholder}=${empty}
    [Documentation]    Waits until page contain element identified by locator.
    ...    Types the given password into text field identified by locator.
    ...    Verifies that proper label element and placeholder attribute are found.
    Wait Until Page Contains Element    ${locator}
    Input Password    ${locator}    ${password}
    Run Keyword Unless    '${label}'=='${empty}'    Verify Label    ${locator}    ${label}
    Run Keyword Unless    '${placeholder}'=='${empty}'    Verify Placeholder    ${locator}    ${placeholder}

Select Radio Button And Verify Field
    [Arguments]    ${group_name}    ${id}    ${value}    ${label}=${empty}
    [Documentation]    Waits until page contain element identified by locator.
    ...    Sets selection of radio button group identified by group_name to name.
    ...    The radio button to be selected is located by two arguments: - group_name is used as the name of the radio input - value is used for the value attribute.
    ...    Verfies that proper label element is found and that selected radio button is really selected.
    Wait Until Page Contains Element    ${id}
    Select Radio Button    ${group_name}    ${id}
    Verify Label    ${id}    ${label}

Select Checkbox And Verify Field
    [Arguments]    ${id}    ${name}    ${label}=${empty}
    [Documentation]    Waits until page contain element identified by id.
    ...    Selects checkbox identified by name.
    ...    Verifies that proper label element and placeholder attribute are found.
    ...    Verifies checkbox identified by locator is selected/checked.
    Wait Until Page Contains Element    ${id}
    Select Checkbox    ${name}
    Run Keyword Unless    '${label}'=='${empty}'    Verify Label    ${id}    ${label}
    Checkbox Should Be Selected    ${name}

Select From List And Verify Field
    [Arguments]    ${locator}    ${item}    ${label}=${empty}
    [Documentation]    Selects item from list identified by locator.
    ...    If label is set, verifies that it is correct.
    Wait Until Page Contains Element    ${locator}
    Run Keyword Unless    '${label}'=='${empty}'    Verify Label    ${locator}    ${label}
    Select From List    ${locator}    ${item}

Generate Random Integer In Range
    [Arguments]    ${min}=0    ${max}=sys.maxint
    [Documentation]    Returns random integer between min and max values. Min defaults to 0 and max to maxint.
    ${int}    Evaluate    random.randint(${min}, ${max})    random,sys
    [Return]    ${int}

Element Should Not Contain
    [Arguments]    ${haystack}    ${needle}
    [Documentation]    Verifies that ${needle} is not part of ${haystack}
    Wait Until Page Contains Element    ${haystack}
    ${error message}    Run Keyword And Expect Error    *    Element Should Contain    ${haystack}    ${needle}
    Should Contain    ${error message}    Element '${haystack}' should have contained text '${needle}' but its text was

Wait Until Element Is Visible
    [Arguments]    ${locator}
    [Documentation]    Waits until element is visible.
    ...    Timeouts after Selenium Timeout.
    ${timeout}    Get Selenium Timeout
    Wait Until Keyword Succeeds    ${timeout}    1    Element Should Be Visible    ${locator}

Wait Until Element Is Not Visible
    [Arguments]    ${locator}
    [Documentation]    Waits until element is not visible.
    ...    Timeouts after Selenium Timeout.
    ${timeout}    Get Selenium Timeout
    Wait Until Keyword Succeeds    ${timeout}    1    Element Should Not Be Visible    ${locator}

Wait Until Element Contains
    [Arguments]    ${locator}    ${expected}
    [Documentation]    Waits until specified element contains specified text.
    ...    Timeouts after Selenium Timeout.
    ${timeout}    Get Selenium Timeout
    Wait Until Keyword Succeeds    ${timeout}    1    Element Should Contain    ${locator}    ${expected}

Wait Until Element Does Not Contain
    [Arguments]    ${locator}    ${expected}
    [Documentation]    Waits until specified element does not contain specified text.
    ...    Timeouts after Selenium Timeout.
    ${timeout}    Get Selenium Timeout
    Wait Until Keyword Succeeds    ${timeout}    1    Element Should Not Contain    ${locator}    ${expected}

Run Keyword And Log Warning
    [Arguments]    ${keyword}    @{arguments}
    [Documentation]    Runs given keyword with given parameters and logs the error message as a warning.
    ...    This is useful when some features of the product under test are not yet implemented and you don't want to fail tests because of that.
    ${error code}    ${error msg}    Run Keyword And Ignore Error    ${keyword}    @{arguments}
    Log    ${error msg}    WARN

Input Validation For Field
    [Arguments]    ${field}    ${rest field}    ${value}    ${pass}=pass
    [Documentation]    Inputs given value to given field.
    ...    Then focuses to given rest field so that client side input validation is triggered.
    ...    Then verifies that user is shown or not shown error label as specified in pass argument.
    Input Text And Verify Field    ${field}    ${value}
    Focus    ${rest field}
    Run Keyword If    '${pass}'=='pass'    Element Should Not Be Visible    ${field}_em_
    Run Keyword Unless    '${pass}'=='pass'    Element Should Be Visible    ${field}_em_

Verify Field Content
    [Arguments]    ${locator}    ${content}
    [Documentation]    Verifies that field identified by locator has the same value as speficied by content
    ${value}    Get Value    ${locator}
    Should Be Equal As Strings    ${value}    ${content}

Click Label
    [Arguments]    ${label}    ${index}=1
    [Documentation]    Clicks label element which contains text ${label}.
    ...    If there is more than one label with given text, specify index to match those labels.
    Click Element    xpath=(//label[contains(., '${label}')])[${index}]

Click Checkbox Label
    [Arguments]    ${label}    ${index}=1    ${state}=selected
    [Documentation]    Clicks given label element.
    ...    If there are more than one same label, set ${index}.
    ...    If ${state} is set to 'selected', verifies that checkbox with given label is selected.
    ...    If ${state} is set to 'not selecte', verifies that checkbox with given label is not selected.
    Click Label    ${label}    ${index}
    ${id}    Get Element Attribute    xpath=(//label[contains(., '${label}')])[${index}]@for
    Run Keyword If    '${state}'=='selected'    Checkbox Should Be Selected    ${id}
    Run Keyword If    '${state}'=='not selected'    Checkbox Should Not Be Selected    ${id}

Click Radiobutton Label
    [Arguments]    ${label}    ${group}    ${index}=1    ${state}=selected
    [Documentation]    Clicks given label element.
    ...    If there are more than one same label, set ${index}.
    ...    If ${state} is set to 'selected', verifies that radiobutton with given label is selected.
    ...    If ${state} is set to 'not selecte', verifies that radiobutton with given label is not selected.
    Click Label    ${label}    ${index}
    ${id}    Get Element Attribute    xpath=(//label[contains(., '${label}')])[${index}]@for
    ${value}    Get Element Attribute    ${id}@value
    Run Keyword If    '${state}'=='selected'    Radio Button Should Be Set To    ${group}    ${value}
    Run Keyword If    '${state}'=='not selected'    Radio Button Should Not Be Selected    ${group}    ${value}

Location Should Not Contain
    [Arguments]    ${string}
    ${url}    Get Location
    Should Not Contain    ${url}    ${string}

Get Random Item From List
    [Arguments]    @{list}
    [Documentation]    Returns random item from given list
    ${lenght}    Get Length    ${list}
    ${item}    Generate Random Integer In Range    0    ${lenght}-1
    ${item}    Set Variable    @{list}[${item}]
    [Return]    ${item}