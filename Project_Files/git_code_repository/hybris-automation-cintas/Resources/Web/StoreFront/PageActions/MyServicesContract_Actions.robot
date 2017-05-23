*** Settings ***
Library  Selenium2Library
Library  String
Resource          ../PageObjects/MyServicesContract_Page.robot

*** Keywords ***
#--------------Buttons and Box---------------
Enter Search Text
    [Arguments]    ${search_text}
    ${locator} =    MyServicesContract_Page.txtSearch
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${search_text}

Click On Search Button
    ${locator} =    MyServicesContract_Page.btnSearch
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Add Uniform Wearer Button
    ${locator} =    MyServicesContract_Page.btnAddUniformWearer
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Add New Product Button
    ${locator} =    MyServicesContract_Page.btnAddNewProduct
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Remove Filter Search X Button
    ${locator} =  MyServicesContract_Page.btnRemoveFilterSearch
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get My Service Filter Text
    ${locator} =    MyServicesContract_Page.lblFilterText
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Get My Service No Search Result Message
    ${locator} =    MyServicesContract_Page.msgNoSearchResult
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${msg} =    Get Text    ${locator}
    [Return]    ${msg}

####################################################################

Get Selected Contract Account Address
    ${locator} =    MyServicesContract_Page.lblSelectedAccAddress
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${msg} =    Get Text    ${locator}
    [Return]    ${msg}

#-------------- Tiles---------------
Click On Employee Uniform Tiles
    ${locator} =    MyServicesContract_Page.tileEmployeeUniform
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Facility Service Tiles
    ${locator} =    MyServicesContract_Page.tileFacilityService
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Deep Clean Tiles
    ${locator} =    MyServicesContract_Page.tileDeepClean
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

#-------------Employee Uniform listing Table----------------------
Click Last Name
    ${locator} =    MyServicesContract_Page.divWearerLastName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click First Name
    ${locator} =    MyServicesContract_Page.divWearerFirstName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element  ${locator}

Click Sort ID
    ${locator} =    MyServicesContract_Page.divWearerSortId
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Wearer Account Name
    ${locator} =    MyServicesContract_Page.divWearerAccountName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element  ${locator}

Click Wearer Account ID
    ${locator} =    MyServicesContract_Page.divWearerAccountId
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element  ${locator}


#------------------ Facility Service listing Table ----------------------------
Click Facility Description
    ${locator} =    MyServicesContract_Page.divFacilityDescription
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Facility Quantity
    ${locator} =    MyServicesContract_Page.divFacilityQuantity
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element  ${locator}

Click Facility Account Name
    ${locator} =    MyServicesContract_Page.divFacilityAccountName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element  ${locator}

#------------------ Pagination ----------------
Click Page Index
    [Arguments]    ${page_number}
    ${locator} =    MyServicesContract_Page.divPageIndex    ${page_number}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Total View Entry
    ${locator} =    MyServicesContract_Page.divTotalViewEntry
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text}=    Get Text    ${locator}
    [Return]    ${text}

Click Pagination Left Arrow
    ${locator} =    MyServicesContract_Page.divpaginationLeftArrow
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Pagination Right Arrow
    ${locator} =    MyServicesContract_Page.divpaginationRightArrow
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

#------------------------- Table Action ----------------------------------------

Get My Service Table Cell Value
    [Arguments]    ${column_name}    ${row_number}
    ${locator} =    MyServicesContract_Page.divMyServiceTableCell    ${column_name}    ${row_number}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text}=    Get Text    ${locator}
    [Return]    ${text}

Click My Service Table Row
    [Arguments]    ${unique_cell_value}
    ${locator} =    MyServicesContract_Page.divMyServiceTableRow    ${unique_cell_value}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


Get My Service Table Row Count
    ${locator} =    MyServicesContract_Page.lnkMyServiceTableRowCount
    ${total_rows} =    Get Matching Xpath Count    ${locator}
    [Return]    ${total_rows}

Click My Service Table Row By Index
    [Arguments]    ${row_index}
    ${locator} =    MyServicesContract_Page.divMyServiceTableRowIndex    ${row_index}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get My Service Table Column Values
    [Arguments]    ${page_index}    ${column_name}
    Run Keyword If    '${page_index}' != '1'    MyServicesContract_Page.Click Page Index    ${page_index}
    ${locator} =    MyServicesContract_Page.lnkMyServiceTableRowCount
    ${total_row} =    Get Matching Xpath Count    ${locator}
    @{column_values}    Create List
    : FOR    ${row_number}    IN RANGE    1    ${total_row}+1
    \    ${locator} =    MyServicesContract_Page.divMyServiceTableCell   ${column_name}    ${row_number}
    \    ${text} =    Get Text    ${locator}
    \    Append To List    ${column_values}    ${text}
    [Return]    @{column_values}

Click On Change Account Link
    ${locator} =    MyServicesContract_Page.lnkChangeAccount
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


