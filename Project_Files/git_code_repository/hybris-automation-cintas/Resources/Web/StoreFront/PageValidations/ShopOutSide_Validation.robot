*** Settings ***
Library           Collections
Library           DateTime
Library           ../../../../hybris-automation-shared/Libraries/DateUtils.py
Library           ../../../../hybris-automation-shared/Libraries/StringUtils.py
Resource          ../PageObjects/MyAccount_Page.robot
Resource          Common_Validation.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../PageValidations/GlobalMessage_Validations.robot
Resource          GlobalMessage_Validations.robot
Resource          ../PageObjects/Header_Page.robot
Resource          ../PageActions/PLP_Actions.robot
Resource          ../PageActions/PDP_Actions.robot
Resource          ../PageObjects/PDP_Page.robot
Resource          ../PageObjects/PLP_Page.robot
Resource          ../PageObjects/ShoopManageProduct_Page.robot
Resource          ../PageObjects/ShoopReviewRequest_Page.robot
Resource          ../PageObjects/ShoopRibbon_Page.robot
Resource          ../PageObjects/ShoopSelectAccount_Page.robot
Resource          ../PageActions/ShoopManageProduct_Actions.robot
Resource          ../PageActions/ShoopReviewRequest_Actions.robot
Resource          ../PageActions/ShoopSelectAccount_Actions.robot
Resource          ../FunctionalKeywords/ShopOutSide_Keywords.robot
Resource          Common_Validation.robot
Resource          ../PageActions/SelectAnAccount_Actions.robot

*** Keywords ***
Validate Shop Outside Top Nav Menu
    [Arguments]    ${ip_plp_url}    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}
    ShopOutSide_Validation.Validate Shop Outside Top Nav Menu Content    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}
    Common_Actions.Open Page    cintasrentalsstorefront/my-account
    ShopOutSide_Validation.Validate Shop Outside Top Nav Menu Content    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}
    Comment    ShopOutSide_Validation.Validate Outside Categories Link Open PLP page    ${ip_plp_url}    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}
    ShopOutSide_Validation.Validate Outside Categories Link Open PLP page    ${ip_plp_url}    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}

Validate Shop Outside Top Nav Menu Content
    [Arguments]    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}
    Header_Actions.Click Add Products And Service Menu
#    Header_Actions.Click Dropdown Top Nav Main Menu    Add Products & Services
    # Top Nav
    ${el1} =    Header_Page.divDropdownTopNavMainLabel    Add Products & Services
    run keyword and continue on failure    page should contain element    ${el1}
    # Dropdown Hearder
    ${hdr1} =    Header_Page.divDropdownHeader    Garments
    run keyword and continue on failure    page should contain element    ${hdr1}
    ${hdr2} =    Header_Page.divDropdownHeader    Facility Services
    run keyword and continue on failure    page should contain element    ${hdr2}
    ${hdr3} =    Header_Page.divDropdownHeader    Deep Clean
    run keyword and continue on failure    page should contain element    ${hdr3}
    # Subjection
    ${sec1}=    Header_Page.divDropdownTopNavSubLabel    ${ip_garment_ctg}
    run keyword and continue on failure    page should contain element    ${sec1}
    ${sec2}=    Header_Page.divDropdownTopNavSubLabel    ${ip_facility_ctg}
    run keyword and continue on failure    page should contain element    ${sec2}
    ${sec3}=    Header_Page.divDropdownTopNavSubLabel    ${ip_deep_ctg}
    run keyword and continue on failure    page should contain element    ${sec3}

Validate Outside Categories Link Open PLP page
    [Arguments]    ${ip_plp_url}    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}
    #Garment
#    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    ${ip_garment_ctg}
    ShopOutSide_Keywords.Select ShOOP Category1    ${ip_garment_ctg}
    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_plp_url}
    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_garment_ctg}
    #Facilities
#    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    ${ip_facility_ctg}
    ShopOutSide_Keywords.Select ShOOP Category1    ${ip_facility_ctg}
    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_plp_url}
    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_facility_ctg}
    #Deep Clean
#    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    ${ip_deep_ctg}
    ShopOutSide_Keywords.Select ShOOP Category1    ${ip_deep_ctg}
    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_plp_url}
    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_deep_ctg}

Validate Shoop Tab
    ${el1} =    PLP_Page.lnkTabGarment
    ${el2} =    PLP_Page.lnkTabFacilityServices
    #Default Status
    ${base_garment}=    Selenium2Library.Get Element Attribute    ${el1}@class
    ${base_facility}=    Selenium2Library.Get Element Attribute    ${el2}@class
    #First Validation
    Click Element    ${el1}
    ${status_garment}=    Selenium2Library.Get Element Attribute    ${el1}@class
    run keyword and continue on failure    Should Contain    ${status_garment}    active
    ${status_facility}=    Selenium2Library.Get Element Attribute    ${el2}@class
    run keyword and continue on failure    Should Not Contain    ${status_facility}    active
    # Second Validaiton
    Click Element    ${el2}
    ${status_facility}=    Selenium2Library.Get Element Attribute    ${el2}@class
    run keyword and continue on failure    Should Contain    ${status_facility}    active
    ${status_garment}=    Selenium2Library.Get Element Attribute    ${el1}@class
    run keyword and continue on failure    Should Not Contain    ${status_garment}    active
    # Return to default
    Run Keyword If    '${base_garment}'=='active'    Click Element    ${el1}
    Run Keyword If    '${base_facility}'=='active'    Click Element    ${el2}

Validate Ribbon Status
    [Arguments]    ${choose}    ${manage}    ${select_account}    ${review_request}
    ${present_url}=    Get Location
    ShoopRibbon_Actions.Click Choose Bar
    Run Keyword If    '${choose}' == 'yes'    Run Keyword And Continue On Failure    Common_Validation.Validate Page URL    cintasrentalsstorefront/Rental-Product-Taxonomy/c/shop-out-of-program/${ip_category}
    Run Keyword If    '${choose}' != 'yes'    Run Keyword And Continue On Failure    Location Should Be    ${present_url}
    # Manage
    ${present_url1}=    Get Location
    ShoopRibbon_Actions.Click Manage Bar
    Run Keyword If    '${manage}' == 'yes'    Run Keyword And Continue On Failure    Common_Validation.Validate Page URL    cintasrentalsstorefront/shop-out-of-program/manage-products
    Run Keyword If    '${manage}' != 'yes'    Run Keyword And Continue On Failure    Location Should Be    ${present_url1}
    # Select Account
    ${present_url2}=    Get Location
    ShoopRibbon_Actions.Click Select Account Bar
    Location Should Be    ${present_url3}
    Run Keyword If    '${select_account}' == 'yes'    Run Keyword And Continue On Failure    Common_Validation.Validate Page URL    cintasrentalsstorefront/shop-out-of-program/select-account
    Run Keyword If    '${select_account}' != 'yes'    Run Keyword And Continue On Failure    Location Should Be    ${present_url2}
    # Review Request
    ${present_url3}=    Get Location
    ShoopRibbon_Actions.Click Review Request Bar
    Run Keyword If    ' ${review_request}' == 'yes'    Run Keyword And Continue On Failure    Common_Validation.Validate Page URL    cintasrentalsstorefront/shop-out-of-program/review-request
    Run Keyword If    ' ${review_request}' != 'yes'    Run Keyword And Continue On Failure    Location Should Be    ${present_url3}

Validate Ribbon Enable and Disable Status
    [Arguments]    ${choose}    ${manage}    ${select_account}    ${review_request}
    [Documentation]    Value shoud be either 'enable' or 'disable'
    #variables
    ${choose}=    Convert To Lowercase    ${choose}
    ${manage}=    Convert To Lowercase    ${manage}
    ${select_account}=    Convert To Lowercase    ${select_account}
    ${review_request}=    Convert To Lowercase    ${review_request}
    # Choose
    ${choose_el}=    ShoopRibbon_Page.lnkChooseBar
    ${choose_class}=    Selenium2Library.Get Element Attribute    ${choose_el}@class
    Run Keyword If    '${choose}' == 'enable'    Run Keyword And Continue On Failure    Should Not Contain    ${choose_class}    disabled
    Run Keyword If    '${choose}' == 'disable'    Run Keyword And Continue On Failure    Should Contain    ${choose_class}    disabled
    # Manage
    ${manage_el}=    ShoopRibbon_Page.lnkManageBar
    ${manage_class}=    Selenium2Library.Get Element Attribute    ${manage_el}@class
    Run Keyword If    '${manage}' == 'enable'    Run Keyword And Continue On Failure    Should Not Contain    ${manage_class}    disabled
    Run Keyword If    '${manage}' == 'disable'    Run Keyword And Continue On Failure    Should Contain    ${manage_class}    disabled
    # Select Account
    ${account_el}=    ShoopRibbon_Page.lnkSelectAccountBar
    ${account_class}=    Selenium2Library.Get Element Attribute    ${account_el}@class
    Run Keyword If    '${select_account}' == 'enable'    Run Keyword And Continue On Failure    Should Not Contain    ${account_class}    disabled
    Run Keyword If    '${select_account}' == 'disable'    Run Keyword And Continue On Failure    Should Contain    ${account_class}    disabled
    # Review Request
    ${review_el}=    ShoopRibbon_Page.lnkReviewRequestBar
    ${review_class}=    Selenium2Library.Get Element Attribute    ${review_el}@class
    Run Keyword If    ' ${review_request}' == 'enable'    Run Keyword And Continue On Failure    Should Not Contain    ${review_class}    disabled
    Run Keyword If    ' ${review_request}'=='disable'    Run Keyword And Continue On Failure    Should Contain    ${review_class}    disabled

Validate No Ribbon Visible
    ${locator}=    ShoopRibbon_Page.divRibbon
    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${locator}

Validate PDP Regular Components
    ${el1}=    PDP_Page.txtPdpComment
    # No Back Button any more
    Comment    ${el2}=    PDP_Page.btnPdpBack
    #
    ${el3}=    PDP_Page.btnPdpAdd
    Comment    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run keyword if    '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run keyword if    '${impx_ur_account_type}'=='contract-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run keyword if    '${impx_ur_account_type}'!='contract-editor'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el1}
    Run keyword if    '${impx_ur_account_type}'!='contract-editor'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el3}

Validate Product Attributes In PDP
    [Arguments]    ${ip_pd_name}    ${ip_product}    ${ip_pd_color}
    ${ip_pd_name}    Convert To Lowercase    ${ip_pd_name}
    ${ip_product}    Convert To Lowercase    ${ip_product}
    Comment    ${ip_pd_color}=    Convert To Lowercase    ${ip_pd_color}
    ${el1}=    PDP_Page.divProductName
    ${el2}=    PDP_Page.divProductStyle
    Comment    ${el3}=    PDP_Page.divProductSelectedColor
    ${ip_pd_name_act}=    Get Text    ${el1}
    ${ip_product_act}=    Get Text    ${el2}
    Comment    ${ip_pd_color_act}=    Get Text    ${el3}
    ${ip_pd_name_act}=    Convert To Lowercase    ${ip_pd_name_act}
    ${ip_product_act}=    Convert To Lowercase    ${ip_product_act}
    Comment    ${ip_pd_color_act}=    Convert To Lowercase    ${ip_pd_color_act}
    Run Keyword And Continue On Failure    Should Be Equal    ${ip_pd_name_act}    ${ip_pd_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${ip_product_act}    style:${ip_product}
    Comment    Run Keyword And Continue On Failure    Should Be Equal    ${ip_pd_color_act}    ${ip_pd_color} (${ip_pd_color})
    #todo    FIT
    #todo    size

Validate PDP Change Components
    ${el1}=    PDP_Page.txtPdpComment
    ${el2}=    PDP_Page.btnPdpBack
    ${el3}=    PDP_Page.btnPdpRemove
    ${el4}=    PDP_Page.btnPdpUpdate
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}

Validate Product Attributes In Manage Page
    [Arguments]    ${ip_product2}
    Comment    ${ip_product2}=    Convert To Lowercase    ${ip_product2}
    ${el1}=    ShoopManageProduct_Page.divProductStyle    ${ip_product2}
    Page Should Contain Element    ${el1}
    #todo    Name
    #todo    color

Validate Add Product From Manage Page
    [Arguments]    ${ip_product2}
    ShopOutSide_Keywords.Add Product From Manage Page    ${ip_product2}
    Comment    ShopOutSide_Validation.Validate Product Attributes In Manage Page    ${ip_product2}
    # GlobalMessage_Validations.Validate Message Contains    Product has been added. Ref: CNTR-2813

Validate Update Product From Manage Page
    [Arguments]    ${ip_product2_name}
    ShoopManageProduct_Actions.Click Change Button    ${ip_product2_name}
    PDP_Actions.Click On Update Agreement
    GlobalMessage_Validations.Validate Message Contains    Product has been updated.

Validate Update Product From Manage Page By Index
    [Arguments]    ${index}
    ShoopManageProduct_Actions.Click Change Button By Index  ${index}
    PDP_Actions.Click On Update Agreement
    GlobalMessage_Validations.Validate Message Contains    Product has been updated.


Validate Remove Product From Manage Page
    [Arguments]    ${ip_product2}
    ShoopManageProduct_Actions.Click Change Button    ${ip_product2}
    PDP_Actions.Click On Remove Agreement
    GlobalMessage_Validations.Validate Message Contains    Product has been removed.
    ShopOutSide_Keywords.Add Product To Agreement with Comment    ${pdp_comment}

Validate Remove Product From Manage Page By Index
    [Arguments]    ${index}
    ShoopManageProduct_Actions.Click Change Button By Index  ${index}
    PDP_Actions.Click On Remove Agreement
    GlobalMessage_Validations.Validate Message Contains    Product has been removed.
    ShopOutSide_Keywords.Add Product To Agreement with Comment    ${pdp_comment}

Validate Add Account Error Message
    ShoopSelectAccount_Actions.Click On Continue Button
    ${locator}=    ShoopSelectAccount_Page.noProductItem
    ${noElement}=    Get Matching Xpath Count    ${locator}
    : FOR    ${INDEX}    IN RANGE    0    ${noElement}
    \    ${actual_msg}=    Get Text    id=shopOOPProductError_${INDEX}
    \    Run Keyword And Continue On Failure    Should Be Equal    ${actual_msg}    At least one account must be chosen for each product.

Validate Add Account For All Product
    ShoopSelectAccount_Actions.Click On Select Account For All Product
    SelectAnAccount_Actions.Click Select All Accounts

Validate Add All Accounts for Each Product
    @{ip_product}=    Get Webelements    css=.js-btn-selectaccount-product
    : FOR    ${product}    IN    @{ip_product}
    \    Click Element    ${product}
    \    Comment    ShoopSelectAccount_Actions.Click On Select Account For Each product    ${product}
    \    SelectAnAccount_Actions.Click Select All Accounts

Validate Add Account Error Message_old
    ShoopSelectAccount_Actions.Click On Continue Button
    ${locator}=    ShoopSelectAccount_Page.noProductItem
    ${noElement}=    Get Matching Xpath Count    ${locator}
    : FOR    ${INDEX}    IN RANGE    0    ${noElement}+1
    \    Comment    ${error_id}=    ShoopSelectAccount_Page.divErrorMessage    ${INDEX}
    \    ${actual_msg}=    Get Text    css=#shopOOPProductError_${INDEX}
    \    Run Keyword And Continue On Failure    Should Be Equal    ${actual_msg}    At least one account must be chosen for each product.
    ${actual_msg}=    Get Text    css=#shopOOPProductError_0
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_msg}    At least one account must be chosen for each product.
    Comment    ${actual_msg}=    Get Text    css=#shopOOPProductError_1
    Comment    Run Keyword And Continue On Failure    Should Be Equal    ${actual_msg}    At least one account must be chosen for each product.
    Comment    ${actual_msg}=    Get Text    css=#shopOOPProductError_2
    Comment    Run Keyword And Continue On Failure    Should Be Equal    ${actual_msg}    At least one account must be chosen for each product.

Validate Shoop Categoty Text
    [Arguments]    ${category_text}
    ${act_category_text}=    PLP_Actions.Get Face Category Text
    Run Keyword And Continue On Failure    Should Contain    ${act_category_text}    ${category_text}

Validate Outside Categories Link Open PLP page_old
    [Arguments]    ${ip_plp_url}    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}
    #Garment
#    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    ${ip_garment_ctg}
    Header_Actions.Click Add Products And Service Menu
    Header_Actions.Click Dropdown Top Nav Sub Menu    ${ip_garment_ctg}
    ShopOutSide_Validation.Validate Shoop Categoty Text    ${ip_garment_ctg}
    Comment    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_plp_url}${ip_garment_ctg}
    Comment    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_garment_ctg}
    #Facilities
#    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    ${ip_facility_ctg}
    Header_Actions.Click Add Products And Service Menu
    Header_Actions.Click Dropdown Top Nav Sub Menu    ${ip_facility_ctg}
    ShopOutSide_Validation.Validate Shoop Categoty Text    ${ip_facility_ctg}
    Comment    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_plp_url}${ip_facility_ctg}
    Comment    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_facility_ctg}
    #Deep Clean
#    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    ${ip_deep_ctg}
    Header_Actions.Click Add Products And Service Menu
    Header_Actions.Click Dropdown Top Nav Sub Menu    ${ip_deep_ctg}
    ShopOutSide_Validation.Validate Shoop Categoty Text    ${ip_deep_ctg}
    Comment    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_plp_url}${ip_deep_ctg}
    Comment    run keyword and continue on failure    Common_Validation.Validate Category URL    ${ip_deep_ctg}

Validate Product Account Number In Review Page
    [Arguments]    ${ip_product1_acc}    ${ip_product2_acc}    ${ip_product3_acc}
    Run Keyword If    '${ip_product1_acc}'!='${EMPTY}'    ShopOutSide_Validation.Validate ST Number For Each Product    ${ip_product1_acc}    ${1}    ${1}    ${1}
    Run Keyword If    '${ip_product2_acc}'!='${EMPTY}'    ShopOutSide_Validation.Validate ST Number For Each Product    ${ip_product2_acc}    ${2}    ${1}    ${1}
    Run Keyword If    '${ip_product3_acc}'!='${EMPTY}'    ShopOutSide_Validation.Validate ST Number For Each Product    ${ip_product3_acc}    ${3}    ${1}    ${1}

Validate ST Name For Each Product
    [Arguments]    ${ip_product_acc_name}    ${item_number}    ${mst_number}    ${cst_number}
    ${st_name}=    ShoopReviewRequest_Actions.Get ST Name    ${item_number}    ${mst_number}    ${cst_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${st_name}    ${ip_product_acc_name}

Validate ST Number For Each Product
    [Arguments]    ${ip_product_acc}    ${item_number}    ${mst_number}    ${cst_number}
    ${st_number}=    ShoopReviewRequest_Actions.Get ST Number    ${item_number}    ${mst_number}    ${cst_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${st_number}    ${ip_product_acc}

Validate Product Account Name In Review Page
    [Arguments]    ${ip_product1_acc_name}    ${ip_product2_acc_name}    ${ip_product3_acc_name}
    Run Keyword If    '${ip_product1_acc_name}'!='${EMPTY}'    ShopOutSide_Validation.Validate ST Number For Each Product    ${ip_product1_acc_name}    ${1}    ${1}    ${1}
    Run Keyword If    '${ip_product2_acc_name}'!='${EMPTY}'    ShopOutSide_Validation.Validate ST Number For Each Product    ${ip_product2_acc_name}    ${2}    ${1}    ${1}
    Run Keyword If    '${ip_product3_acc_name}'!='${EMPTY}'    ShopOutSide_Validation.Validate ST Number For Each Product    ${ip_product3_acc_name}    ${3}    ${1}    ${1}
