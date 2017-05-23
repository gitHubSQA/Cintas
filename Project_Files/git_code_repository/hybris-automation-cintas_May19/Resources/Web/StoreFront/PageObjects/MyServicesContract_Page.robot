*** Settings ***
Library           Selenium2Library

*** Keywords ***
#----------------Button and Box ---------------------------------

txtSearch
    [Return]    id=searchbox

btnSearch
    [Return]    css=.search-section .js-btn-search

btnAddUniformWearer
    [Return]    css=.search-section .btn.btn-primary

btnAddNewProduct
    [Return]    xpath=//*[contains(@class,'btn btn-primary') and contains(text(),'Add New Product')]

btnRemoveFilterSearch
    [Return]    id=removeFilterSearch

lblFilterText
    [Return]    css=.filtered-text>span:nth-of-type(1)

msgNoSearchResult
    [Return]    css=.default-wrapper


#----------------Tiles---------------------------------

tileEmployeeUniform
    [Return]    css=.tile img[title='Uniforms']

tileFacilityService
    [Return]    css=.tile img[title='Facility Services']

tileDeepClean
    [Return]    css=.tile img[title='Deep Clean']

#----------Employee Uniform listing Table-----------------
divWearerLastName
    [Return]    id=lastName

divWearerFirstName
    [Return]    id=firstName

divWearerSortId
    [Return]    id=sortNumber

divWearerAccountName
    [Return]    id=accountName

divWearerAccountId
    [Return]    id=accountId

#--------------Facility Service listing Table---------------
divFacilityDescription
    [Return]    id=name

divFacilityQuantity
    [Return]    id=quantity

divFacilityAccountName
    [Return]    id=accountName

divFacilityMaterialNo
    [Return]    css=.col-material-no>div

divFacilityFrequency
    [Return]    css=.col-frequency>div

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

#------------------------- Table ---------------------
# Note: Uniform: //a[@class='cintas-table-row'] and Facility: //div[@class='cintas-table-row']

divMyServiceTableCell
    [Arguments]    ${column_name}    ${row_number}
    [Return]    xpath=//*[@class='cintas-table-row'][${row_number}]/descendant::div[contains(text(),'${column_name}')]/following-sibling::div

divMyServiceTableRow
    [Arguments]    ${cell_value}
    [Return]    xpath=//div[contains(text(),'${cell_value}')]/ancestor::*[@class='cintas-table-row']

divMyServiceTableRowIndex
    [Arguments]    ${row_index}
    [Return]    xpath=//*[@class='cintas-table-row'][${row_index}]

lnkMyServiceTableRowCount
    [Return]    //*[@class='cintas-table-row']   #Excldue xpath as Get Matching Xpath Count  does not support it

# Select an account Modal
mdlSelectAnAccount
    [Return]   id=mstAccountsModal

lnkChangeAccount
    [Return]    css=.btn-link.js-btn-filter-by-account

lblSelectedAccAddress
        [Return]    xpath=//*[@class='solution-contract-headline']/span[1]