*** Settings ***
Library  Selenium2Library
Library  String
Resource          ../PageObjects/PDP_Page.robot

*** Keywords ***
# Click on Differetn Buttons
Click On Add To Agreement
    ${locator} =    PDP_Page.btnPdpAdd
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Update Agreement
    ${locator} =    PDP_Page.btnPdpUpdate
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Remove Agreement
    ${locator} =    PDP_Page.btnPdpRemove
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Enter Comment
    [Arguments]    ${comment}
    ${locator} =    PDP_Page.txtPdpComment
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${comment}

Click On Back To Results
    ${locator} =    PDP_Page.lnkPdpBackResult
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Change Account Link
    ${locator} =    PDP_Page.lnkChangeAccount
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

# Select Variant by ID

Select Color By ID
    [Arguments]    ${color_id}
    ${locator} =    PDP_Page.divProductColorVariantSwatchID  ${color_id}
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Fit By ID
    [Arguments]    ${fit_id}
    ${locator} =    PDP_Page.divProductFitSwatchID  ${fit_id}
    wait until element is visible   ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Size By ID
    [Arguments]    ${size_id}
    ${locator} =    PDP_Page.divProductSizeSwatchID  ${size_id}
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Sleeve By ID
    [Arguments]    ${sleeve_id}
    ${locator} =    PDP_Page.divProductSleeveSwatchID  ${sleeve_id}
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


# Select Variant by description
Select Color
    [Arguments]    ${color}
    ${locator} =    PDP_Page.divProductColorVariantSwatch  ${color}
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Fit
    [Arguments]    ${fit_desc}
    ${locator} =    PDP_Page.divProductFitSwatch  ${fit_desc}
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Size
    [Arguments]    ${size_desc}
    ${locator} =    PDP_Page.divProductSizeSwatch  ${size_desc}
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Sleeve
    [Arguments]    ${sleeve_desc}
    ${locator} =    PDP_Page.divProductSleeveSwatch  ${sleeve_desc}
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Select Trim Option
    [Arguments]    ${option}
    ${option} =  convert to lowercase  ${option}
    ${el_yes} =    PDP_Page.txtProductQuantity
    wait until element is visible    ${el_yes}    ${DEFAULT_TIMEOUT}
    ${el_no} =    PDP_Page.txtProductQuantity
    wait until element is visible    ${el_no}    ${DEFAULT_TIMEOUT}
    Run Keyword If    '${option}' == 'yes'  Click Element    ${el_yes}
    ...  ELSE  Click Element    ${el_no}

Enter Quantity
    [Arguments]    ${qty}
    ${locator} =    PDP_Page.txtProductQuantity
    wait until element is visible     ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${qty}

# Reading Product Information
Get Product Name
    ${locator} =    PDP_Page.divProductName
    ${product_name} =    Get Text    ${locator}
    [Return]    ${product_name}

Get Product Style
    ${locator} =    PDP_Page.divProductStyle
    ${style}=    Get Text    ${locator}
    ${product_style} =  Fetch From Right    ${style}    :
    [Return]    ${product_style}
    
Get Selected Color
    ${locator} =    PDP_Page.divProductSelectedColor
    ${product_color} =    Get Text    ${locator}
    [Return]    ${product_color}
Get Selected Fit
    ${locator} =    PDP_Page.divProductSelectedFit
    ${product_fit} =    Get Text    ${locator}
    [Return]    ${product_fit}

Get Selected Size
    ${locator} =    PDP_Page.divProductSelectedSize
    ${product_size} =    Get Text    ${locator}
    [Return]    ${product_size}
Get Selected Sleeve
    ${locator} =    PDP_Page.divProductSelectedSleeve
    ${product_sleeve} =    Get Text    ${locator}
    [Return]    ${product_sleeve}

Get Quantity From Text Box
    ${locator} =    PDP_Page.txtProductQuantity
    ${qty} =    Get value    ${locator}
    [Return]    ${qty}

Get Quantity From label
    ${locator} =    PDP_Page.lblProductQuantity
    ${qty_label_value} =    Get Text    ${locator}
    ${qty_value} =    Fetch From Right    ${qty_label_value}    :
    ${qty_value} =    Fetch From Right    ${qty_value}    ${SPACE}
    Log  ${qty_value}
    [Return]    ${qty_value}


#--------------------Selected Swatch-------------------------------------
Get Selected Color Swatch Data Name
    ${locator} =    PDP_Page.divSelectedProductColorSwatch
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${data_name} =  Run Keyword If  ${passed}  Selenium2Library.Get Element Attribute  ${locator}@data-name
    [Return]    ${data_name}

Get Selected Fit Swatch Description
    ${locator} =    PDP_Page.divActiveProductFitSwatch
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${data_fit_desc} =  Run Keyword If  ${passed}   Selenium2Library.Get Element Attribute  ${locator}@data-fit-desc
    [Return]    ${data_fit_desc}

Get Selected Size Swatch Description
    ${locator} =    PDP_Page.divSelectedProductSizeSwatch
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${data_size_desc} =  Run Keyword If  ${passed}  Selenium2Library.Get Element Attribute  ${locator}@data-size-desc
    [Return]    ${data_size_desc}

Get Selected Sleeve Swatch Description
    ${locator} =    PDP_Page.divActiveProductSleeveSwatch
    ${passed} =  Run Keyword And Return Status  wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${data_sleeve_desc} =  Run Keyword If  ${passed}  Selenium2Library.Get Element Attribute  ${locator}@data-sleeve-desc
    [Return]    ${data_sleeve_desc}


# Quantity and Trim shoud use the following keywords for verification.
# Textarea Should Contain
# Textfield Value Should Be

#--------------------Select able Swatch-------------------------------------
#divProductColorSelectableVariantSwatch
#    [Arguments]    ${color}
#    [Return]    css=.option.color
#
#divProductSelectableFitSwatch
#    [Arguments]    ${fit_desc}
#    [Return]    css=.option.fit.active
#
#divProductSelectableSizeSwatch
#    [Arguments]    ${size_desc}
#    [Return]    css=.option.size.active
#
#divProductSelectableSleeveSwatch
#    [Arguments]    ${sleeve_desc}
#    [Return]    css=.option.sleeve.active


