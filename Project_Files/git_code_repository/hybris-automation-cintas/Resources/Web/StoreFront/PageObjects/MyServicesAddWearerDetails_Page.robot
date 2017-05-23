*** Settings ***
Library           Selenium2Library

*** Keywords ***
#----------Button----------------
btnAddUniformButton
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Add Uniform')]

btnCopyFromExistingWearer
    [Return]    css=.js-copy-wearer

btnChangeProductByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::button

icnRemoveUniformByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::i

btnContinueButton
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Continue')]

lblWearerName
    [Return]    css=.wearer-name

# Contract Garments information
divProductName
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::div[@class='product-name']

divProductStyle
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::span[@class='label-text' and text()='Style:']/following-sibling::span

divProductSku
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][1]/descendant::div[@class='product-sku']

divProductColor
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::span[@class='label-text' and text()='Color:']/following-sibling::span

divProductFit
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::span[@class='label-text' and text()='Fit:']/following-sibling::span

divProductSize1
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::span[@class='label-text' and text()='Size 1:']/following-sibling::span

divProductSize2
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::span[@class='label-text' and text()='Size 2:']/following-sibling::span

divProductQuantity
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::span[@class='label-text' and text()='Qty:']/following-sibling::span

#------------ Copy wearer overlay-----------------------
txtSearchBox
    [Return]  id=searchbox

btnSearchButton
    [Return]  css=.js-btn-search

divLastName
    [Return]  id=lastName

divFirstName
    [Return]  d=firstName

divSortId
    [Return]  d=sortNumber

divWearerTableCell
    [Arguments]    ${column_name}    ${row_number}
    [Return]    xpath=//*[@class='cintas-table-row'][${row_number}]/descendant::div[contains(text(),'${column_name}')]/following-sibling::div

divWearerTableRow
    [Arguments]    ${cell_value}
    [Return]    xpath=//div[contains(text(),'${cell_value}')]/ancestor::*[@class='cintas-table-row']

divWearerTableRowIndex
    [Arguments]    ${row_index}
    [Return]    xpath=//*[@class='cintas-table-row'][${row_index}]

lnkWearerTableRowCount
    [Return]    xpath=//*[@class='cintas-table-row']

btnCopyWearerConfirmationYes
    [Return]    xpath=//*[@id='copyWearerConfirmation']/div/div/div[3]/div[2]/div[1]/a

    


