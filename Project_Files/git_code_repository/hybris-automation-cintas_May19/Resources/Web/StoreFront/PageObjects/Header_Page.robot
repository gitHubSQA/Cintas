*** Settings ***
Library           Selenium2Library

*** Keywords ***
lnkBilling
    [Return]    css=div.header-links a[href='/cintasrentalsstorefront/invoice-summary']

lnkOpenAccountMenu
    [Return]    css=div.header-links div.header-link-item:last-child>div

lnkMenuBiling
    [Return]    css=div.header-links a[title='Billing']

lnkMenuAccountSettings
    [Return]    css=div.header-links a[title='Account Settings']

lnkMenuCredits
    [Return]    css=div.header-links a[title='Credits']

lnkMenuStatements
    [Return]    css=div.header-links a[title='Statements']

lnkMenuPaymentPreferences
    [Return]    id=header-logout-manageMyWallet

lnkMenuSignOut
    [Return]    id=header-logout-link

lnkHomeCintasLogo
    [Return]    css=div.main-header a[href='/cintasrentalsstorefront']

divOpenApprovalsCount
    [Return]    css=.header-approval-number

divDropdownTopNavMainLabel
    [Arguments]    ${label_text}
    [Documentation]    ${label_text}='Add Products & Services' or 'My Services'
    [Return]    xpath=//*[@class='top-nav-label' and contains(text(),'${label_text}')]

divDropdownTopNavSubLabel
    [Arguments]    ${sub_label_text}
    [Documentation]    ${sub_label_text}='Requests' or 'Classic-Comfort'
    #.dropdown a[title='Classic-Comfort']
    [Return]    css=.dropdown a[title='${sub_label_text}']

divDropdownHeader
    [Arguments]    ${header_name}
    [Documentation]    ${header_name}=Garments,Facility Services,Deep Clean
    [Return]    xpath=//*[@class='dropdown-header' and contains(text(),'${header_name}')]

mnu_AddProductAndServices
    [Return]    xpath=//*[@id='page-content-wrapper']/header/div[1]/div[2]/div/ul/li[3]/div/div/div
#    xpath=//*[@class='top-prime-nav']/descendant::div[@class='top-nav-label'][2]

# Approvals Menu
lnk_OpenApprovals
#    [Return]    xpath=//a[@href='/cintasrentalsstorefront/service-request']/span[1]
    [Return]    css=.dropdown.header-link-item>div>a>span:nth-child(1)
lbl_ApprovalNumber
    [Return]    css=.header-approval-number

lnk_ApprovalsUserRequests
    [Return]    css=div.header-links a[href='/cintasrentalsstorefront/user-management?approveUser=true']

lnk_ApprovalsServiceRequests
    [Return]    css=div.header-links a[href='/cintasrentalsstorefront/service-request/approval']


lnk_siteLogo
    [Return]    css=.simple-banner-component>a>img