*** Settings ***
Library           Selenium2Library

*** Keywords ***
btnSelectAccountForEachProduct
    [Arguments]    ${product_name}
    [Return]    css=a[data-product-id='${product_name}']

btnSelectAccountContinueButton
    [Return]    css=.js-select-account-continue

btnSelectAccountForAllProduct
    [Return]    css=.js-btn-selectaccount-all-product

noProductItem
    [Return]    //*[@class='shoop-product-list-item']

divErrorMessage
    [Arguments]    ${index}
    [Return]    css=#shopOOPProductError_${INDEX}
