*** Settings ***
Library           Selenium2Library
Library  String
Resource          ../PageObjects/MyServicesAddWearerConfirm_Page.robot


*** Keywords ***
#--------- Button-----------------
Click On Change Button of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.btnChangeProductByIndex  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Remove X Button of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.icnRemoveUniformByIndex  ${index}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Back Button
    ${locator} =    MyServicesAddWearerConfirm_Page.btnBackButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Submit Request Button
    ${locator} =    MyServicesAddWearerConfirm_Page.btnSubmitRequestButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

#------- Read First and Last Name ------------

Get Wearer First Name
    ${locator} =    MyServicesAddWearerConfirm_Page.lblFirstName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${first_name} =  Get Text    ${locator}
    [Return]    ${first_name}


Get Wearer Last Name
    ${locator} =    MyServicesAddWearerConfirm_Page.lblLastName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${last_name}=  Get Text    ${locator}
    [Return]    ${last_name}

Get Wearer Email Address
    ${locator} =    MyServicesAddWearerConfirm_Page.lblEmailAddress
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${email} =  Get Text    ${locator}
    [Return]    ${email}


Get Wearer Phone Number
    ${locator} =    MyServicesAddWearerConfirm_Page.lblPhoneNumber
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${phone_number} =  Get Text    ${locator}
    [Return]    ${phone_number}

Get Wearer Employee ID
    ${locator} =    MyServicesAddWearerConfirm_Page.lblEmployeeID
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${emp_id} =  Get Text    ${locator}
    [Return]    ${emp_id}

Get Wearer Account Number
    ${locator} =    MyServicesAddWearerConfirm_Page.lblAccountNumber
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${account_number} =  Get Text    ${locator}
    [Return]    ${account_number}

Get Wearer Comment
    ${locator} =    MyServicesAddWearerConfirm_Page.lblComment
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${comment} =  Get Text    ${locator}
    [Return]    ${comment}

# Read Product Information

Get Name of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductName  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_name} =  Run Keyword If  ${passed}  Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_name}

Get Style of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductStyle  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_style} =  Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_style}

# Need to verify it will read value or not
Get SKU of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductSku  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_sku} =  Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_sku}

Get Color of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductColor  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_color} =  Run Keyword If  ${passed}   Get Text    ${locator}
    [Return]    ${product_color}

Get Fit of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductFit  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_fit} =  Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_fit}

Get Size1 of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductSize1  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_size1} =   Run Keyword If  ${passed}   Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_size1}

Get Size2 of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductSize2  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_size2} =   Run Keyword If  ${passed}  Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_size2}

Get Quantity of Product Item
    [Arguments]    ${index}
    ${locator} =    MyServicesAddWearerConfirm_Page.divProductQuantity  ${index}
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${product_qty} =    Run Keyword If  ${passed}  Get Text    ${locator}  ELSE Log  ${msg_unavilable_property}
    [Return]    ${product_qty}


