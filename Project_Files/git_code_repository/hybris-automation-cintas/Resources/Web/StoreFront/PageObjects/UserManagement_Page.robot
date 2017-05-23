*** Settings ***
Library           Selenium2Library

*** Keywords ***
btn_AddNewUser
    [Return]    css=.cintas-nav-tabs a[href='/cintasrentalsstorefront/user-management/add-user']

# ------------ Filter and Search Section ---------------
txt_Search
    [Return]    id=searchbox

btn_Search
    [Return]    css=.search-section .js-btn-search

btn_FilterByAccount
    [Return]    css=.search-section .js-btn-filter-by-account

ddl_SelectStatus
    [Return]  id=select-status

btn_Status
    [Return]    xpath=//button[@data-id="select-status"]

lbl_NoResult
    [Return]    css=.default-wrapper

btnRemoveFilterSearch
    [Return]    id=removeFilterSearch

lblFilterText
    [Return]    css=.filtered-text>span:nth-of-type(1)



#------------- Nav -------------------
tab_Allusers
    [Return]    xpath=//a[@class='js-btn-approve-user' and contains(.,'All Users')]

tab_UsersPendingApproval
    [Return]    xpath=//a[@class='js-btn-approve-user' and contains(.,'Users Pending Approval')]

#----------- All user or User Pending Approval Table -------------
tbl_HeaderLastName
    [Return]    id=lastName

tbl_HeaderdivFirstName
    [Return]    id=firstName

tbl_HeaderdivEmail
    [Return]    id=email

tbl_HeaderdivSubmitted
    [Return]    id=creationtime

#------------------------- Table ---------------------

tbl_UsersTableCell
    [Arguments]    ${column_name}    ${row_number}
    [Return]    xpath=//a[contains(@class,'cintas-table-row')][${row_number}]/descendant::div[contains(text(),'${column_name}')]/following-sibling::div

tbl_UsersTableRow
    [Arguments]    ${cell_value}
    [Return]    xpath=//div[contains(text(),'${cell_value}')]/ancestor::a[contains(@class,'cintas-table-row')]

tbl_UsersTableIndex
    [Arguments]    ${row_index}
    [Return]    xpath=//a[contains(@class,'cintas-table-row')][${row_index}]

tbl_UsersTableRowCount
    [Return]    //a[contains(@class,'cintas-table-row')]   #Excldue xpath as Get Matching Xpath Count  does not support it


#--------------- Pagination ------------------
divPageIndex
    [Arguments]    ${page_index}
    [Return]    css=.pagination-section.top div[class='page-list-item'][data-page-index='${page_index}']

divTotalViewEntry
    [Return]    xpath=//*[@class='pagination-section top']/descendant::strong[2]

divPaginationLeftArrow
    [Return]    css=.pagination-section.top .fa-chevron-left

divPaginationRightArrow
    [Return]    css=.pagination-section.top .fa-chevron-right

divTopPageList
    [Return]    css=.pagination-section.top .page-list-wrapper

divBottomPageList
    [Return]    css=.pagination-section.bottom .page-list-wrapper
#--------------- Search ----------------------





