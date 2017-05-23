*** Settings ***
Library           Selenium2Library

*** Keywords ***
imgLoading
    [Return]    css=.loading-overlay

spinnerLoading
    [Return]    css=.loading-overlay

brcBreadcrumbActiveSectionTitle
        [Return]    css=.breadcrumb-section .active