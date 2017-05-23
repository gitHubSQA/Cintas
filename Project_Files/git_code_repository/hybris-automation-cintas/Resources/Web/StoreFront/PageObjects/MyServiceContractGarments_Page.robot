*** Settings ***
Library           Selenium2Library

*** Keywords ***
#----------Button----------------
btnAddUniformButton
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Add Uniform')]

btnRemoveUniformWearerButton
    [Return]    xpath=//*[@class='btn btn-default' and contains(text(),'Remove Uniform Wearer')]

btnChangeProduct
    [Arguments]    ${product_name}
    [Return]    css=form[action*='${product_name}'] button

btnChangeProductByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::button[contains(text(),'Change')]

btnViewProductByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::button[contains(text(),'View')]

icnRemoveUniformByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::i

lnkBackToResult
    [Return]    css=a.back-link
# Product information
#divProductStyle
#    [Arguments]    ${style}
#    [Return]    xpath=//*[@class='product-name' and text()='${style}']

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

#-------- overlay --------------------
btnRemoveWearerConfirmationYes
    [Return]    css=.btn.btn-primary.js-btn-remove-employee

btnRemoveWearerConfirmationNo
    [Return]    TODO

btnRemoveProductConfirmationYes
    [Return]    id=removeOneProductConfirmed

btnRemoveProductConfirmationNo
    [Return]    TODO

lstWearerGarmentsListItem
    [Return]   //*[@class='wearer-garments-list-item']
