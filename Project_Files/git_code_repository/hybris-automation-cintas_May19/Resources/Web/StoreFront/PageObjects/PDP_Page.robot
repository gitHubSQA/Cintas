*** Settings ***
Library           Selenium2Library

*** Keywords ***
divProductName
    [Return]    css=.product-name.hidden-xs

divProductStyle
    [Return]    css=.product-style.hidden-xs


# Selected Properties
divProductSelectedColor
    [Return]    css=.selected-color

divProductSelectedFit
    [Return]    css=.selected-fit

divProductSelectedSize
    [Return]    css=.selected-size

divProductSelectedSleeve
    [Return]    css=.selected-sleeve

#---------------------------- Swatch Selection using ID -------------------------------------
divProductColorVariantSwatchID
    [Arguments]    ${color_id}
    [Return]    css=#${color_id}>img

divProductFitSwatchID
    [Arguments]    ${fit_id}
    [Return]    css=#${fit_id}

divProductSizeSwatchID
    [Arguments]    ${size_id}
    [Return]    css=#${size_id}

divProductSleeveSwatchID
    [Arguments]    ${sleeve_id}
    [Return]    css=#${sleeve_id}

#--------------------Swatch Selection using description-------------------------------------
divProductColorVariantSwatch
    [Arguments]    ${color}
    [Return]    css=.variation-option.color-section div[data-name='${color}']

divProductFitSwatch
    [Arguments]    ${fit_desc}
    [Return]    css=.variation-option.fit-section div[data-fit-desc='${fit_desc}']

divProductSizeSwatch
    [Arguments]    ${size_desc}
    [Return]    css=.variation-option.size-section div[data-size-desc='${size_desc}']

divProductSleeveSwatch
    [Arguments]    ${sleeve_desc}
    [Return]    css=.variation-option.sleeve-section div[data-sleeve-desc='${sleeve_desc}']
#-------------------------------------------------------------------------------------------
txtProductQuantity
    [Return]    id=quantity

# For viewer role
lblProductQuantity
    [Return]    xpath=//*[@class='product-update-section']/div[2]


txtPdpComment
    [Return]    id=pdp-comment-box

optTrimYes
    [Return]    css=.allow-trim-yes+span

optTrimNo
    [Return]    css=.allow-trim-no+span

# All buttons and links
lnkPdpBackResult
    [Return]    css=.back-link

lnkChangeAccount
    [Return]    css=.btn-link.js-in-change-account

btnPdpAdd
    [Return]    css=.js-btn-add-product-submit-request

btnPdpRemove
    [Return]    css=.js-btn-remove-product-submit-request

btnPdpUpdate
    [Return]    css=.js-btn-update-product-submit-request

#--------------------Select able Swatch-------------------------------------
divProductColorSelectableVariantSwatch
    [Return]    xpath=//div[@class='option color']

divProductSelectableFitSwatch
    [Return]    xpath=//div[@class='option fit active']

divProductSelectableSizeSwatch
    [Return]    xpath=//div[@class='option size active']

divProductSelectableSleeveSwatch
    [Return]    xpath=//div[@class='option sleeve active']

#--------------------Selected Swatch-------------------------------------
divSelectedProductColorSwatch
    [Return]    css=.option.color.active.selected

divActiveProductFitSwatch
    [Return]    css=.option.fit.active.selected

divSelectedProductSizeSwatch
    [Return]    css=.option.size.active.selected

divActiveProductSleeveSwatch
    [Return]    css=.option.sleeve.active.selected