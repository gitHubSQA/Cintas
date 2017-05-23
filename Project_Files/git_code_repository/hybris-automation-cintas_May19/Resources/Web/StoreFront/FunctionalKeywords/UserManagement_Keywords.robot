*** Settings ***
Resource          ../PageActions/SelectAnAccount_Actions.robot

*** Keywords ***
#Filter By Account By Search
#    [Arguments]    ${filter_text}    ${filter_state}    ${filter_sold_to}
#    # Missing Click Filter By Account
#    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
#    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
#    SelectAnAccount_Actions.Click Search
#    # Need to modify - Pass a list and select all Sold To's from the that list
#    Run Keyword If    '${filter_sold_to}' != '${EMPTY}'    SelectAnAccount_Actions.Check Sold To Checkbox    ${filter_sold_to}
#    SelectAnAccount_Actions.Click Select
#
#Filter By Account All
#    SelectAnAccount_Actions.Click Select All Accounts
#
#Select An Account By MST
#    [Arguments]    ${filter_text}    ${filter_state}    ${master_sold_to}
#    # Missing Click Filter By Account
#    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
#    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
#    SelectAnAccount_Actions.Click Search
#    SelectAnAccount_Actions.Click MST Select Button  ${master_sold_to}
#
#Slect An Account By CST
#    [Arguments]    ${filter_text}    ${filter_state}    ${customer_sold_to}
#    # Missing Click Filter By Account
#    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
#    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
#    SelectAnAccount_Actions.Click Search
#    SelectAnAccount_Actions.Click CST Select Button  ${customer_sold_to}

