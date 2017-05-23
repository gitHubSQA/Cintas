*** Settings ***
Resource          ../PageActions/SelectAnAccount_Actions.robot
Resource          ../PageActions/Header_Actions.robot
Resource          ../PageActions/PLP_Actions.robot
Resource          ../PageActions/PDP_Actions.robot
Resource          ../PageActions/ShoopManageProduct_Actions.robot
Resource          ../PageActions/ShoopReviewRequest_Actions.robot
Resource          ../PageActions/ShoopRibbon_Actions.robot
Resource          ../PageObjects/ShoopSelectAccount_Page.robot
Resource          ../PageValidations/Common_Validation.robot
Resource          ../PageActions/ShoopSelectAccount_Actions.robot

*** Keywords ***
Filter By Account By Search
    [Arguments]    ${filter_text}    ${filter_state}    ${filter_sold_to}
    # Missing Click Filter By Account
    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
    SelectAnAccount_Actions.Click Search
    # Need to modify - Pass a list and select all Sold To's from the that list
    Run Keyword If    '${filter_sold_to}' != '${EMPTY}'    SelectAnAccount_Actions.Check Sold To Checkbox    ${filter_sold_to}
    SelectAnAccount_Actions.Click Select

Filter By Account All
    SelectAnAccount_Actions.Click Select All Accounts

Select ShOOP Category
    [Arguments]    ${main_menu}    ${sub_menu}
    Header_Actions.Click Dropdown Top Nav Main Menu    ${main_menu}
    Header_Actions.Click Dropdown Top Nav Sub Menu    ${sub_menu}


Select ShOOP Category1
    [Arguments]   ${sub_menu}
    Header_Actions.Click Add Products And Service Menu
    Header_Actions.Click Dropdown Top Nav Sub Menu    ${sub_menu}




Add Product To Agreement with Comment
    [Arguments]    ${comment}
    PDP_Actions.Enter Comment    ${comment}
    PDP_Actions.Click On Add To Agreement

Add Product From Manage Page
    [Arguments]    ${ip_product2}
    ShoopManageProduct_Actions.Click Add Product Button
    PLP_Actions.Click On Product Image    ${ip_product2}
    ShopOutSide_Keywords.Add Product To Agreement with Comment    ${pdp_comment}

Add Facility Product From Manage Page
    [Arguments]    ${ip_product3}
    ShoopManageProduct_Actions.Click Add Product Button  # updated as per new change
    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    Microfiber-Cleaning
    PLP_Actions.Click On Product Image    ${ip_product3}
    ShopOutSide_Keywords.Add Product To Agreement with Comment    ${pdp_comment}
    #GlobalMessage_Validations.Validate Message Contains    Product has been added.

Submit SHOOP Request
    ShoopReviewRequest_Actions.Click SHOOP Submit Request
    Common_Validation.Validate Global Message    Your request have been submitted for approval.

Add Account For Each Product
    @{ip_product}=    Get Webelements    css=.js-btn-selectaccount-product
    : FOR    ${product}    IN    @{ip_product}
    \    Click Element    ${product}
    \    ShoopSelectAccount_Actions.Click On Select Account For Each product    ${product}
    \    SelectAnAccount_Actions.Click Select All Accounts

Add ST For Each Product
    [Arguments]    ${product_position}    @{sold_to_list}
    @{ip_product}=    Get Webelements    css=.js-btn-selectaccount-product
    Click Element    @{ip_product}[${product_position}]
    : FOR    ${sold_to}    IN    @{sold_to_list}
    \    SelectAnAccount_Actions.Check Sold To (ST) Checkbox    ${sold_to}
    SelectAnAccount_Actions.Click Select

Add MST For Each Product
    [Arguments]    ${product_name}    @{master_sold_to_list}
    @{ip_product}=    Get Webelements    css=.js-btn-selectaccount-product
    : FOR    ${product}    IN    @{ip_product}
    \    Click Element    ${product}
    \    ShoopSelectAccount_Actions.Click On Select Account For Each product    ${product}
    \    SelectAnAccount_Actions.Click Select All Accounts
    ShoopSelectAccount_Actions.Click On Select Account For Each product    ${product_name}
    : FOR    ${master_sold_to}    IN    @{master_sold_to_list}
    \    SelectAnAccount_Actions.Check Master Sold To (MST) Checkbox    ${master_sold_to}
    SelectAnAccount_Actions.Click Select

Add MST For All Products
    [Arguments]    ${product_name}    @{master_sold_to_list}
    @{ip_product}=    Get Webelements    css=.js-btn-selectaccount-product
    : FOR    ${product}    IN    @{ip_product}
    \    Click Element    ${product}
    \    ShoopSelectAccount_Actions.Click On Select Account For Each product    ${product}
    \    SelectAnAccount_Actions.Click Select All Accounts
    ShoopSelectAccount_Actions.Click On Select Account For Each product    ${product_name}
    : FOR    ${master_sold_to}    IN    @{master_sold_to_list}
    \    SelectAnAccount_Actions.Check Master Sold To (MST) Checkbox    ${master_sold_to}
    SelectAnAccount_Actions.Click Select

Add ST For All Product
    [Arguments]    ${product_name}    @{sold_to_list}
    ShoopSelectAccount_Actions.Click On Select Account For Each product    ${product_name}
    : FOR    ${sold_to}    IN    @{sold_to_list}
    \    SelectAnAccount_Actions.Check Sold To (ST) Checkbox    ${sold_to}
    SelectAnAccount_Actions.Click Select

Add Diffeerent Account For Each Product
    [Arguments]    ${ip_product1_acc}    ${ip_product2_acc}    ${ip_product3_acc}
    Run Keyword If    '${ip_product1_acc}'!='${EMPTY}'    ShopOutSide_Keywords.Add ST For Each Product    ${0}    ${ip_product1_acc}
    Run Keyword If    '${ip_product2_acc}'!='${EMPTY}'    ShopOutSide_Keywords.Add ST For Each Product    ${1}    ${ip_product2_acc}
    Run Keyword If    '${ip_product3_acc}'!='${EMPTY}'    ShopOutSide_Keywords.Add ST For Each Product    ${2}    ${ip_product3_acc}
