*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          ../PageObjects/ServiceRequest_Page.robot

*** Keywords ***
Enter Search Text
    [Arguments]    ${search_text}
    ${locator} =    ServiceRequest_Page.txtSearch
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${search_text}

Enter Start Date
    [Arguments]    ${start_date}
    ServiceRequest_Actions.Click Date Picker
    ${locator} =    ServiceRequest_Page.txtDateRangePickerStart
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${start_date}

Enter Stop Date
    [Arguments]    ${stop_date}
    ${locator} =    ServiceRequest_Page.txtDateRangePickerStop
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${stop_date}

Click Search Button
    ${locator} =    ServiceRequest_Page.btnSearch
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Manage My Request Button
    ${locator} =    ServiceRequest_Page.btnManageMyRequest
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Manage Other User Request Button
    ${locator} =    ServiceRequest_Page.btnManageOtherUserRequest
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Create New Request Button
    ${locator} =    ServiceRequest_Page.btnCreateNewRequest
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Filter By Account Button
    ${locator} =    ServiceRequest_Page.btnFilterByAccount
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click ID
    ${locator} =    ServiceRequest_Page.divServiceRequestIdSort
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Submitted
    ${locator} =    ServiceRequest_Page.divSubmittedSort
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Description
    ${locator} =    ServiceRequest_Page.divDescriptionSort
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Last Name
    ${locator} =    ServiceRequest_Page.divLastNameSort
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click First Name
    ${locator} =    ServiceRequest_Page.divFirstNameSort
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Email
    ${locator} =    ServiceRequest_Page.divEmailSort
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Service Request Status
    ${locator} =    ServiceRequest_Page.cbxServiceRequestStatus
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Date Picker
    ${locator} =    ServiceRequest_Page.txtDatePicker
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Clear All SR Filters
    ${locator} =    ServiceRequest_Page.spnRemoveFilterIcon
    @{els} =    Get Webelements    ${locator}
    : FOR    ${remove_icon}    IN    @{els}
    \    Click Element    ${remove_icon}

Input Date Range
    [Arguments]    ${start_date}    ${end_date}
    ServiceRequest_Actions.Enter Start Date    ${start_date}
    ServiceRequest_Actions.Enter Stop Date    ${end_date}
    ServiceRequest_Actions.Click Date Picker Apply Button

Click Date Picker Apply Button
    ${locator} =    ServiceRequest_Page.txtDateRangePickerApplyButton
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Status
    [Arguments]    ${search_text}
    ${el1} =    ServiceRequest_Page.cbxServiceRequestStatus
    wait until element is visible    ${el1}   ${DEFAULT_TIMEOUT}
    Click Element    ${el1}
    ${el2} =    ServiceRequest_Page.divSelectStatusItem    ${search_text}
    wait until element is visible    ${el2}
    Click Element    ${el2}

Filter By Date
    [Arguments]    ${start_date}    ${end_date}
    ServiceRequest_Actions.Input Date Range    ${start_date}    ${end_date}
    ServiceRequest_Actions.Click Search Button

Filter By Text
    [Arguments]    ${search_text}
    ServiceRequest_Actions.Enter Search Text    ${search_text}
    ServiceRequest_Actions.Click Search Button

Filter By Status
    [Arguments]    ${status_text}
    ServiceRequest_Actions.Select Status    ${status_text}
    ServiceRequest_Actions.Click Search Button

# Pagination
Click Page Index
    [Arguments]    ${page_number}
    ${locator} =    ServiceRequest_Page.divPageIndex    ${page_number}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Total View Entry
    ${locator} =    ServiceRequest_Page.divTotalViewEntry
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Click Pagination Left Arrow
    ${locator} =    ServiceRequest_Page.divpaginationLeftArrow
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Pagination Right Arrow
    ${locator} =    ServiceRequest_Page.divpaginationRightArrow
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

# Table Action
Get Service Request Table Cell Value
    [Arguments]    ${column_name}    ${row_number}
    ${locator} =    ServiceRequest_Page.divServiceRequestTableCell    ${column_name}    ${row_number}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get Service Request Table Column Values
    [Arguments]    ${page_index}    ${column_name}
    Run Keyword If    '${page_index}' != '1'    ServiceRequest_Actions.Click Page Index    ${page_index}
    ${locator} =    ServiceRequest_Page.lnkServiceRequestTableRowCount
    ${total_row} =    Get Matching Xpath Count    ${locator}
    @{column_values}    Create List
    : FOR    ${row_number}    IN RANGE    1    ${total_row}+1
    \    ${locator} =    ServiceRequest_Page.divServiceRequestTableCell    ${column_name}    ${row_number}
    \    ${text}=    Get Text    ${locator}
    \    Append To List    ${column_values}    ${text}
    [Return]    @{column_values}

Click Service Request Table Row
    [Arguments]    ${unique_cell_value}
    ${locator} =    ServiceRequest_Page.divServiceRequestTableRow    ${unique_cell_value}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Service Request Row Count
    ${locator} =    ServiceRequest_Page.lnkServiceRequestTableRowCount
    ${total_rows} =    Get Matching Xpath Count    ${locator}
    [Return]    ${total_rows}

Get DateRangePicker Value
    ${dateRange_value} =    Execute Javascript    return $(".cintas-daterangepicker input").val()
    [Return]    ${dateRange_value}

Get Service Request Status Value
    ${status_value} =    Get Text    css=.dropdown-toggle .filter-option
    [Return]    ${status_value}

Get Service Request Search Text
    ${search_text} =    Execute Javascript    return $("#searchbox").val()
    [Return]    ${search_text}

Click Service Request Table Row By Index
    [Arguments]    ${unique_cell_value}
    ${locator} =    ServiceRequest_Page.divServiceRequestTableRowIndex    ${unique_cell_value}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
