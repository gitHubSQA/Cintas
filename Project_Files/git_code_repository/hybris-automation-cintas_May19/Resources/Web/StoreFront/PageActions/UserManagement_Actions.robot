*** Settings ***
Library           Selenium2Library
Library           String
Resource          ../PageObjects/UserManagement_Page.robot

*** Keywords ***
Click Add New User Button
    ${locator} =  UserManagement_Page.btn_AddNewUser
    wait until element is visible  ${locator}
    click element  ${locator}

# ------------ Filter and Search Section ---------------
Enter Search Text
    [Arguments]  ${search_text}
    ${locator} =  UserManagement_Page.txt_Search
    wait until element is visible  ${locator}
    input text  ${locator}  ${search_text}

Click Search Button
    ${locator} =  UserManagement_Page.btn_Search
    wait until element is visible  ${locator}
    click element  ${locator}

Click Filter By Account Button
    ${locator} =  UserManagement_Page.btn_FilterByAccount
    wait until element is visible  ${locator}
    click element  ${locator}

Select User Status By Label
    [Arguments]  ${user_status}
    [Documentation]  ${user_status} value should be: Pending or Rejected or Active or Inactive
    ${locator} =  UserManagement_Page.ddl_SelectStatus
    wait until element is visible  ${locator}
    select from list by label  ${locator}  ${user_status}

Select User Status By Value
    [Arguments]  ${user_status}
    [Documentation]  ${user_status} value should be: ACTIVE or INACTIVE or PENDING_APPROVAL or REJECTED
    ${locator} =  UserManagement_Page.ddl_SelectStatus
    Wait Until Page Contains Element  ${locator}
    select from list by value  ${locator}  ${user_status}

Get User Selected Status
    ${locator} =  UserManagement_Page.btn_Status
    wait until element is visible  ${locator}
    ${text} =  Selenium2Library.Get Element Attribute  ${locator}@title
    [Return]  ${text}

Get User No Search Result Message
    ${locator} =  UserManagement_Page.lbl_NoResult
    wait until element is visible  ${locator}
    ${text}=    Get Text    ${locator}
    [Return]    ${text}

Click On Remove Filter Search X Button
    ${locator} =  UserManagement_Page.btnRemoveFilterSearch
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get User Filter Text
    ${locator} =    UserManagement_Page.lblFilterText
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}


#------------- Nav -------------------
Click All Users Tab
    ${locator} =  UserManagement_Page.tab_Allusers
    wait until element is visible  ${locator}
    click element  ${locator}

Click Users Pending Approval Tab
    ${locator} =  UserManagement_Page.tab_UsersPendingApproval
    wait until element is visible  ${locator}
    click element  ${locator}

#----------- All user or User Pending Approval Table -------------
Click Last Name Header
    ${locator} =    UserManagement_Page.tbl_HeaderLastName
    wait until element is visible    ${locator}
    Click Element    ${locator}

Click First Name Header
    ${locator} =    UserManagement_Page.tbl_HeaderdivFirstName
    wait until element is visible    ${locator}
    Click Element  ${locator}

Click Email Header
    ${locator} =    UserManagement_Page.tbl_HeaderdivEmail
    wait until element is visible    ${locator}
    Click Element  ${locator}

Click Submitted Date Header
    ${locator} =    UserManagement_Page.tbl_HeaderdivSubmitted
    wait until element is visible    ${locator}
    Click Element  ${locator}

#------------------------- Table ---------------------

Get User Table Cell Value
    [Arguments]    ${column_name}    ${row_number}
    ${locator} =    UserManagement_Page.tbl_UsersTableCell   ${column_name}    ${row_number}
    wait until element is visible    ${locator}
    ${text}=    Get Text    ${locator}
    [Return]    ${text}

Click User Table Row
    [Arguments]    ${unique_cell_value}
    ${locator} =    UserManagement_Page.tbl_UsersTableRow    ${unique_cell_value}
    wait until element is visible    ${locator}
    Click Element    ${locator}


Get User Table Row Count
    ${locator} =    UserManagement_Page.tbl_UsersTableRowCount
    ${total_rows} =    Get Matching Xpath Count    ${locator}
    [Return]    ${total_rows}

Click User Table Row By Index
    [Arguments]    ${row_index}
    ${locator} =    UserManagement_Page.tbl_UsersTableIndex    ${row_index}
    wait until element is visible    ${locator}
    Click Element    ${locator}

Get User Table Row Href By Index
    [Arguments]    ${row_index}
    ${locator} =    UserManagement_Page.tbl_UsersTableIndex    ${row_index}
    wait until element is visible    ${locator}
    ${href} =  Selenium2Library.Get Element Attribute  ${locator}@href
    [Return]  ${href}


Get User Table Column Values
    [Arguments]    ${page_index}    ${column_name}
    Run Keyword If    '${page_index}' != '1'    UserManagement_Actions.Click Page Index    ${page_index}
    ${locator} =    UserManagement_Page.tbl_UsersTableRowCount
    ${total_row} =    Get Matching Xpath Count    ${locator}
    @{column_values}    Create List
    : FOR    ${row_number}    IN RANGE    1    ${total_row}+1
    \    ${locator} =    UserManagement_Page.tbl_UsersTableCell   ${column_name}    ${row_number}
    \    ${text} =    Get Text    ${locator}
    \    Append To List    ${column_values}    ${text}
    [Return]    @{column_values}

#------------------ Pagination ----------------
Click Page Index
    [Arguments]    ${page_number}
    ${locator} =    UserManagement_Page.divPageIndex    ${page_number}
    wait until element is visible    ${locator}
    Click Element    ${locator}

Get Total View Entry
    ${locator} =    UserManagement_Page.divTotalViewEntry
    wait until element is visible    ${locator}
    ${text}=    Get Text    ${locator}
    [Return]    ${text}

Click Pagination Left Arrow
    ${locator} =    UserManagement_Page.divpaginationLeftArrow
    wait until element is visible    ${locator}
    Click Element    ${locator}

Click Pagination Right Arrow
    ${locator} =    UserManagement_Page.divpaginationRightArrow
    wait until element is visible    ${locator}
    Click Element    ${locator}