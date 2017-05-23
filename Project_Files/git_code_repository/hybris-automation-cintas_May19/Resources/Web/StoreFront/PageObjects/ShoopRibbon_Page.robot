*** Settings ***
Library           Selenium2Library

*** Keywords ***
lnkChooseBar
    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Choose')]

lnkManageBar
    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Manage')]

lnkSelectAccountBar
    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Select Account')]

lnkReviewRequestBar
    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Review Request')]

divRibbon
    [Return]    css=.progression-bar
