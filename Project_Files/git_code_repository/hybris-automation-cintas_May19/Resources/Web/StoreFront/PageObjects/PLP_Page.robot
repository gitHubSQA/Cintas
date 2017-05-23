*** Settings ***
Library           Selenium2Library

*** Keywords ***
imgProductImage
    [Arguments]    ${product_style_number}
    [Documentation]    ${product_style_number}=000341 etc
    #//*[contains(@class,'product-grid-item X935')]/div/a/img
    #//*[contains(@class,'product-grid-item ${product_style_number}')]/descendant::*[contains(@href,'${product_style_number}')]
    [Return]    xpath=//*[contains(@class,'product-grid-item ${product_style_number}')]/div/a/img

buttonFacetDropdown
    [Arguments]    ${facet_type}
    [Documentation]    ${facet_type}= Category or Gender or Color or Size or Material
    [Return]    css=button[data-facet-code='${facet_type}']

inpFacetDropdownCheckbox
    [Arguments]    ${facet_subtype}
    [Documentation]    ${facet_subtype}= Male or Female
    [Return]    xpath=//*[@class='checkbox-label' and contains(.,'${facet_subtype}')]/ancestor::li/descendant::span[@class='fa checkbox-fa']

imgFacetDropdownColor
    [Arguments]    ${color_name}
    [Documentation]    ${color_name}= Red or Pink
    [Return]    xpath=//*[@class='facet-color-label' and contains(.,'${color_name}')]/ancestor::li/descendant::img

divFacetDropdownCategory
    [Arguments]    ${category_name}
    [Documentation]    ${category_name}= Classic-Comfort or Carhartt Renta
    [Return]    xpath=//*[@class='js-facet-value' and contains(.,'${category_name}')]

buttonSortDropdown
    [Return]    css=button[data-id='sortOptions1']

spnSortType
    [Arguments]    ${sort_type}
    [Documentation]    ${sort_type}=Name (ascending) or Name (descending)
    [Return]    xpath=//*[@id='sort_form1']/descendant::span[@class='text' and \ contains(.,'${sort_type}')]

lnkServiceType
    [Arguments]    ${service_type}
    [Documentation]    ${service_type}=Garments or Facility Services
    [Return]    //*[@class='nav nav-tabs']/li[1]

lnkTabGarment
    [Documentation]    ${service_type}=Garments or Facility Services
    [Return]    //*[@class='nav nav-tabs']/li[1]

lnkTabFacilityServices
    [Documentation]    ${service_type}=Garments or Facility Services
    [Return]    //*[@class='nav nav-tabs']/li[2]

spnFacetText
    [Timeout]
    [Return]    css=.facet-text>span:nth-of-type(1)

lnkChangeAccount
    [Return]    css=.btn-link.js-in-change-account