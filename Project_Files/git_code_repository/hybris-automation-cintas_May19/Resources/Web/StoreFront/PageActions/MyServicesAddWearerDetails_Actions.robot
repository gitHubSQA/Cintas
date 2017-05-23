*** Settings ***
Library           Selenium2Library
Library  String
Resource          ../PageObjects/MyServicesAddWearerDetails_Page.robot

*** Keywords ***
#--------- Button-----------------
Click On Add Uniform Button
    ${locator} =    MyServicesAddWearerDetails_Page.btnAddUniformButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Copy From Existing Wearer Button
    ${locator} =    MyServicesAddWearerDetails_Page.btnCopyFromExistingWearer
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Change Button of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.btnChangeProductByIndex  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Remove X Button of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.icnRemoveUniformByIndex  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Continue Button
    ${locator} =    MyServicesAddWearerDetails_Page.btnContinueButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Wearer Name
    ${locator} =    MyServicesAddWearerDetails_Page.lblWearerName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${wearer_name} =  Get Text    ${locator}
    [Return]   ${wearer_name}


# Read Product Information

Get Name of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductName  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_name} =  Run Keyword If  ${passed}  Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_name}

Get Style of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductStyle  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_style} =  Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_style}

# Need to verify it will read value or not
Get SKU of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductSku  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_sku} =  Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_sku}

Get Color of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductColor  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_color} =  Run Keyword If  ${passed}   Get Text    ${locator}
    [Return]    ${product_color}

Get Fit of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductFit  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_fit} =  Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_fit}

Get Size1 of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductSize1  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_size1} =   Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_size1}

Get Size2 of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductSize2  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_size2} =   Run Keyword If  ${passed}  Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_size2}

Get Quantity of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerDetails_Page.divProductQuantity  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_qty} =    Run Keyword If  ${passed}  Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_qty}


#------------ Copy wearer ovelay-------------

Enter First OR Last Name
    [Arguments]    ${name}
    ${locator} =    MyServicesAddWearerDetails_Page.txtSearchBox
    wait until element is visible    ${locator}
    Input Text    ${locator}    ${name}

Click On Search Button
    ${locator} =    MyServicesAddWearerDetails_Page.btnSearchButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Last Name Table Header
    ${locator} =    MyServicesAddWearerDetails_Page.divLastName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


Click On First Name Table Header
    ${locator} =    MyServicesAddWearerDetails_Page.divFirstName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Sort ID Table Header
    ${locator} =    MyServicesAddWearerDetails_Page.divSortId
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
#--- Table search------

Get Wearer Table Cell Value
    [Arguments]    ${column_name}    ${row_number}
    ${locator} =    MyServicesAddWearerDetails_Page.divWearerTableCell   ${column_name}    ${row_number}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text}=    Get Text    ${locator}
    [Return]    ${text}

Click Wearer Table Row
    [Arguments]    ${unique_cell_value}
    ${locator} =    MyServicesAddWearerDetails_Page.divWearerTableRow    ${unique_cell_value}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Wearer Table Row Count
    ${locator} =    MyServicesAddWearerDetails_Page.lnkWearerTableRowCount
    ${total_rows} =    Get Matching Xpath Count    ${locator}
    [Return]    ${total_rows}

Click Wearer Table Row By Index
    [Arguments]    ${row_index}
    ${locator} =    MyServicesAddWearerDetails_Page.divWearerTableRowIndex   ${row_index}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

#-------- overlay --------------------
Click Copy Wearer Confirmation Yes Button
    ${locator} =    MyServicesAddWearerDetails_Page.btnCopyWearerConfirmationYes
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element   ${locator}

