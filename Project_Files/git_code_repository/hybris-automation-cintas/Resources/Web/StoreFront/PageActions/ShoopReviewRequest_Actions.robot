*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/ShoopReviewRequest_Page.robot

*** Keywords ***
Click SHOOP Submit Request
    ${locator} =    ShoopReviewRequest_Page.btnSubmitRequest
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get ST Name
    [Arguments]    ${item_number}    ${mst_number}    ${cst_number}
    ${locator} =    ShoopReviewRequest_Page.divSoldToName    ${item_number}     ${mst_number}    ${cst_number}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${st_name} =    Get Text    ${locator}
    [Return]    ${st_name}

Get ST Number
    [Arguments]    ${item_number}    ${mst_number}    ${cst_number}
    ${locator} =    ShoopReviewRequest_Page.divSoldToNumber    ${item_number}     ${mst_number}    ${cst_number}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${st_number} =    Get Text    ${locator}
    [Return]    ${st_number}
