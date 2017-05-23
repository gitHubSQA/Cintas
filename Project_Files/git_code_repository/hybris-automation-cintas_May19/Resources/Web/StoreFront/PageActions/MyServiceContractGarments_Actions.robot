*** Settings ***
Library  Selenium2Library
Library  String
Resource          ../PageObjects/MyServiceContractGarments_Page.robot

*** Variables ***
${msg_unavilable_property} =  Component is not available

*** Keywords ***
# Button
Click On Add Uniform Button
    ${locator} =    MyServiceContractGarments_Page.btnAddUniformButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Remove Uniform Wearer Button
    ${locator} =    MyServiceContractGarments_Page.btnRemoveUniformWearerButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Change Button of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.btnChangeProductByIndex  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On View Button of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.btnViewProductByIndex  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Remove X Button of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.icnRemoveUniformByIndex  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Back To Result Link
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.lnkBackToResult  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

# Read Product Information

Get Name of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductName  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_name} =  Run Keyword If  ${passed}  Get Text    ${locator}    #ELSE  Log  ${msg_unavilable_property}
    [Return]    ${product_name}

Get Style of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductStyle  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_style} =  Run Keyword If  ${passed}   Get Text    ${locator}  #ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_style}

# Need to verify it will read value or not
Get SKU of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductSku  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_sku} =  Run Keyword If  ${passed}   Get Text    ${locator}  #ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_sku}

Get Color of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductColor  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_color} =  Run Keyword If  ${passed}   Get Text    ${locator}
    [Return]    ${product_color}

Get Fit of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductFit  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_fit} =  Run Keyword If  ${passed}   Get Text    ${locator}  #ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_fit}

Get Size1 of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductSize1  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_size1} =   Run Keyword If  ${passed}   Get Text    ${locator}  #ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_size1}

Get Size2 of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductSize2  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_size2} =   Run Keyword If  ${passed}  Get Text    ${locator}  #ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_size2}

Get Quantity of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServiceContractGarments_Page.divProductQuantity  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_qty} =    Run Keyword If  ${passed}  Get Text    ${locator}  #ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_qty}

Get Number Of Wearer Garments List Item
    ${locator} =    MyServiceContractGarments_Page.lstWearerGarmentsListItem
    ${no_item} =  Get Matching XPath Count  ${locator}
    [Return]    ${no_item}

#-------- overlay --------------------
Click On Remove Wearer Confirmation Yes Button
    ${locator} =    MyServiceContractGarments_Page.btnRemoveWearerConfirmationYes
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Remove Product Confirmation Yes Button
    ${locator} =    MyServiceContractGarments_Page.btnRemoveProductConfirmationYes
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


