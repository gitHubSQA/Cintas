*** Settings ***
Library           Selenium2Library

*** Keywords ***
btnSelectAllAccounts
    [Return]    xpath=//*[@id='mstAccountsContent']/div[7]/div[2]/div[1]/button
#    #css=button.check-box-enabled-select-all
#    [Return]    xpath=//*[@id='mstAccountsContent']/div[6]/div[2]/div[1]/button


txtSearchAccounts
    [Return]    id=searchmstbox

btnSelectState
    [Return]    css=div.js-states-data button[data-id='stateIso']

divSelectStateItem
    [Arguments]    ${state}
    [Return]    xpath=//div[contains(@class,'js-states-data')]/descendant::span[contains(text(),'${state}')]

btnSearch
    [Return]    css=div.btn-search > button

btnSelect
    [Return]    css=div.js-pagination-data button.check-box-enabled-select

btnSelectByMST
    [Arguments]    ${mst}
    [Return]    css=button[data-mst-id='${mst}']

btnSelectByCST
    [Arguments]    ${cst}
    [Return]    css=button[button[data-cst-ids='${cst}']

btnSoldToSelect
    [Arguments]    ${sold_to}
    [Return]    xpath=//div[contains(@class,'single-sold-to-select')]/descendant::li[@class='mst-list-item']/div[@class='row']/descendant::div[contains(text(),'${sold_to}')]/../../../../../descendant::button[contains(@class,'js-btn-selectsoldto')]

divSoldToCheckbox_old
    [Arguments]    ${sold_to}
    [Return]    xpath=//div[contains(@class,'multiple-sold-to-select')]/descendant::div[contains(text(),'${sold_to}')]/../../../div[contains(@class,'check-box-enabled')]

divSoldToCheckbox
    [Arguments]    ${sold_to}
    [Return]    css=.shoop-product-list-item:nth-of-type(1) #mstAccountsModal input.check-box-enabled-cst[data-cst-id='${sold_to}']+span

divMasterSoldToCheckbox
    [Arguments]    ${master_sold_to}
    [Return]    css=.shoop-product-list-item:nth-of-type(1) #mstAccountsModal input.check-box-enabled-mst[data-mst-id='${master_sold_to}']+span

chKContractSoldToCheckbox
    [Arguments]    ${cst}
    [Return]    css=input[data-cst-id='${cst}']+span

chk_UserSoldToCheckbox
    [Arguments]    ${sold_to}
    [Return]    css=#mstAccountsModal input.check-box-enabled-cst[data-cst-id='${sold_to}']+span

chk_MSTCheckbox
    [Arguments]    ${mst}
    [Return]    css=#mstAccountsModal input.check-box-enabled-mst[data-mst-id='${mst}']+span

chk_CSTCheckbox
    [Arguments]    ${cst}
    [Return]    css=#mstAccountsModal input.check-box-enabled-cst[data-cst-id='${cst}']+span


chk_MSTCheckbox1
    [Arguments]    ${mst}
    [Return]    css=#mstAccountsModal input.check-box-enabled-mst[data-mst-id='${mst}']

chk_CSTCheckbox1
    [Arguments]    ${cst}
    [Return]    css=#mstAccountsModal input.check-box-enabled-cst[data-cst-id='${cst}']


