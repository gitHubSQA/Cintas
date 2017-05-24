*** Settings ***
Library  Selenium2Library

*** Keywords ***
Get Checkbox Checked Status By Id
    [Arguments]  ${element_id}
    ${result} =  Execute Javascript  document.getElementById('${element_id}').checked
    [Return]  ${result}

Scroll To Top Of Page
    Execute JavaScript    window.scrollTo(0,0)
