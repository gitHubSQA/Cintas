*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/SelectAnAccount_Page.robot

*** Keywords ***
Click Select All Accounts
    ${locator} =    SelectAnAccount_Page.btnSelectAllAccounts
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Enter Search Criteria
    [Arguments]    ${search_text}
    ${locator} =    SelectAnAccount_Page.txtSearchAccounts
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${search_text}

Select State
    [Arguments]    ${search_text}
    ${el1} =    SelectAnAccount_Page.btnSelectState
    wait until element is visible    ${el1}   ${DEFAULT_TIMEOUT}
    Click Button    ${el1}
    ${el2} =    SelectAnAccount_Page.divSelectStateItem    ${search_text}
    wait until element is visible    ${el2}   ${DEFAULT_TIMEOUT}
    Click Button    ${el2}

Click Search
    ${locator} =    SelectAnAccount_Page.btnSearch
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Select
    ${locator} =    SelectAnAccount_Page.btnSelect
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Sold To Select
    [Arguments]    ${sold_to}
    ${locator} =    SelectAnAccount_Page.btnSoldToSelect    ${sold_to}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Check Sold To (ST) Checkbox
    [Arguments]    ${sold_to}
    ${locator} =    SelectAnAccount_Page.divSoldToCheckbox    ${sold_to}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Check Master Sold To (MST) Checkbox
    [Arguments]    ${master_sold_to}
    ${locator} =    SelectAnAccount_Page.divMasterSoldToCheckbox    ${master_sold_to}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click MST Select Button
    [Arguments]    ${mst}
    ${locator} =    SelectAnAccount_Page.btnSelectByMST  ${mst}
    wait until page contains element   ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}


Click CST Select Button
    [Arguments]    ${cst}
    ${locator} =    SelectAnAccount_Page.btnSelectByCST  ${cst}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Service CST Check Box
    [Arguments]    ${cst}
    ${locator} =  SelectAnAccount_Page.chKContractSoldToCheckbox     ${cst}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    click element  ${locator}

Check User CST Checkbox
    [Arguments]    ${sold_to}
    ${locator} =    SelectAnAccount_Page.chk_UserSoldToCheckbox   ${sold_to}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
#--------------------------------------------------------------------------
Check MST Checkbox
    [Arguments]    ${mst}
    ${locator} =    SelectAnAccount_Page.chk_MSTCheckbox  ${mst}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    click element  ${locator}

Check CST Checkbox
    [Arguments]    ${cst}
    ${locator} =    SelectAnAccount_Page.chk_CSTCheckbox  ${cst}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    click element  ${locator}