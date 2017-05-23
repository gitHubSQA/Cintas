*** Settings ***
Library           Selenium2Library

*** Keywords ***
btnSubmitRequest
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),' Submit Request')]

divSoldToName
    [Arguments]    ${item_number}    ${mst_number}    ${cst_number}
    #//*[@class='shoop-product-list-item'][2]/descendant::li[@class='mst-list-item'][2]/descendant::div[@class='cst-info'][1]/descendant::div[@class='col-mst-info']/div[1]
    [Return]    css=.shoop-product-list-item:nth-of-type(${item_number}) .mst-list-item:nth-of-type(${mst_number}) .cst-info:nth-of-type(${cst_number}) .col-mst-info div:nth-of-type(1)

divSoldToNumber
    [Arguments]    ${item_number}    ${mst_number}    ${cst_number}
    [Return]    css=.shoop-product-list-item:nth-of-type(${item_number}) .mst-list-item:nth-of-type(${mst_number}) .cst-info:nth-of-type(${cst_number}) .col-mst-info div:nth-of-type(2)
