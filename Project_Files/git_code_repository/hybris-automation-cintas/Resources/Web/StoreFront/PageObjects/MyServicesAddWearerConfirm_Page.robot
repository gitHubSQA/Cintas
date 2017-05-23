*** Settings ***
Library           Selenium2Library

*** Keywords ***
#----------Button---------------
btnChangeProductByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::button

icnRemoveUniformByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@ class='wearer-garments-list-item'][${index}]/descendant::i

btnSubmitRequestButton
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Submit Request')]

btnBackButton
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Back')]

#---- Wearer first and last name---------
lblLastName
    [Return]  xpath=//*[@class='user-detail-content']/descendant::div[contains(text(),'Last Name:')]/following-sibling::div

lblFirstName
    [Return]  xpath=//*[@class='user-detail-content']/descendant::div[contains(text(),'First Name:')]/following-sibling::div

lblEmailAddress
    [Return]  xpath=//*[@class='user-detail-content']/descendant::div[contains(text(),'Email Address:')]/following-sibling::div

lblPhoneNumber
    [Return]  xpath=//*[@class='user-detail-content']/descendant::div[contains(text(),'Phone Number:')]/following-sibling::div

lblEmployeeID
    [Return]  xpath=//*[@class='user-detail-content']/descendant::div[contains(text(),'Employee ID:')]/following-sibling::div

lblAccountNumber
    [Return]  xpath=/*[@class='user-detail-content']/descendant::div[contains(text(),'Account Number:')]/following-sibling::div

lblComment
    [Return]  xpath=//*[@class='user-detail-content']/descendant::div[contains(text(),'Comment:')]/following-sibling::div

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

