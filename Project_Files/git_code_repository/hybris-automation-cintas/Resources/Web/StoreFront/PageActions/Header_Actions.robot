*** Settings ***
Library           Selenium2Library
Library           Dialogs
Library           ../../../../hybris-automation-shared/Libraries/StringUtils.py
Resource          ../PageObjects/Header_Page.robot

*** Keywords ***
Click Billing
    ${locator} =    Header_Page.lnkBilling
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Account Menu
    ${locator} =    Header_Page.lnkOpenAccountMenu
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Mouse Over    ${locator}

Click Menu Billing
    Header_Actions.Click Account Menu
    ${locator} =    Header_Page.lnkMenuBiling
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Account Settings
    Header_Actions.Click Account Menu
    ${locator} =    Header_Page.lnkMenuAccountSettings
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Menu Credits
    Header_Actions.Click Account Menu
    ${locator} =    Header_Page.lnkMenuCredits
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Menu Statements
    Header_Actions.Click Account Menu
    ${locator} =    Header_Page.lnkMenuStatements
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Menu Payment Preference
    Header_Actions.Click Account Menu
    ${locator} =    Header_Page.lnkMenuPaymentPreferences
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Menu Sign out
    Header_Actions.Click Account Menu
    Comment    ${locator} =    Header_Page.lnkMenuSignOut
    Click Element    id=header-logout-link

Click My Service Menu
    ${locator} =    Header_Page.divDropdownTopNavMainLabel    My Services
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Dropdown Top Nav Main Menu
    [Arguments]    ${label_text}
    ${locator} =    Header_Page.divDropdownTopNavMainLabel    ${label_text}
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


Click Add Products And Service Menu
#    ${locator1} =    Header_Page.lnk_siteLogo
#    wait until element is visible    ${locator1}   ${DEFAULT_TIMEOUT}
#    Click Element    ${locator1}
    execute javascript  $('.simple-banner-component>a>img').click()
    ${locator} =    Header_Page.mnu_AddProductAndServices
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Dropdown Top Nav Sub Menu
    [Arguments]    ${sub_label_text}
    ${locator} =    Header_Page.divDropdownTopNavSubLabel    ${sub_label_text}
    Wait Until Element Is Visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

# ----- Approver Menu -------------
Click Approvals
#    ${locator1} =    Header_Page.lnk_siteLogo
#    wait until element is visible    ${locator1}   ${DEFAULT_TIMEOUT}
#    Click Element    ${locator1}
    execute javascript  $('.simple-banner-component>a>img').click()
    ${locator2} =    Header_Page.lnk_OpenApprovals
    wait until element is visible    ${locator2}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator2}

#Click Approvals
#    execute javascript  $('.dropdown.header-link-item>div>a>span:nth-child(1)').click()

Click Approvals User Requests
    Header_Actions.Click Approvals
    ${locator} =    Header_Page.lnk_ApprovalsUserRequests
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element   ${locator}

Click Approvals Service Requests
    Header_Actions.Click Approvals
    ${locator} =    Header_Page.lnk_ApprovalsServiceRequests
    wait until element is visible    ${locator}   ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Pending User Request Number
    Header_Actions.Click Approvals
    ${locator} =    Header_Page.lnk_ApprovalsUserRequests
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    ${number} =  get int from string  ${text}
    [Return]  ${number}

Get Pending Servcie Request Number
    Header_Actions.Click Approvals
    ${locator} =    Header_Page.lnk_ApprovalsServiceRequests
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    ${number} =  get int from string  ${text}
    [Return]  ${number}

#Get Total Approval Number
#    ${locator} =
#    wait until element is visible  ${locator}
#    ${text} =  get text  ${locator}
#    ${number} =  get int from string  ${text}
#    [Return]  ${number}

Get Total Approval Number
    ${locator} =  Header_Page.lbl_ApprovalNumber
    wait until element is visible  ${locator}
    ${text} =  get text  ${locator}
    ${number} =  get int from string  ${text}
    [Return]  ${number}