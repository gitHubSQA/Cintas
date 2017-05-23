*** Settings ***
Library           Selenium2Library

*** Keywords ***
btnContinueButton
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Continue')]

btnAddProduct
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Add Uniform or Product')]

btnChangeProduct
    [Arguments]    ${product_name}
    [Return]    css=form[action*='${product_name}'] button

divProductStyle
    [Arguments]    ${style}
    [Return]    xpath=//*[@class='product-name' and text()='${style}']


btnChangeProductByIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@id='shopOOPProductTag_${index}']/descendant::form/button