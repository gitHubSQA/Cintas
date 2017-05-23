*** Settings ***
Library           Selenium2Library

*** Keywords ***
txtSearch
    [Return]    id=searchbox

btnSearch
    [Return]    css=.search-section .js-btn-search

btnFilterByAccount
    [Return]    css=.search-section .js-btn-filter-by-account

btnManageMyRequest
    [Return]    css=.cintas-nav-tabs a[href='/cintasrentalsstorefront/service-request']

btnManageOtherUserRequest
    [Return]    css=.cintas-nav-tabs a[href='/cintasrentalsstorefront/service-request/approval']

btnCreateNewRequest
    [Return]    css= .cintas-nav-tabs a[href='/cintasrentalsstorefront/service-request/generic']

divServiceRequestId
    [Return]    id=serviceRequestId

divSubmitted
    [Return]    id=creationTime

divRejected
    [Return]    id=reviewDate

divLastName
    [Return]    id=lastName

divFirstName
    [Return]    id=firstName

divEmail
    [Return]    id=email

divSubject
    [Return]    css=.cintas-table-header.hidden-xs .col-subject

divSubjectTitle
    [Return]    xpath=//*[@id='requestSubject']/span[1]

divServiceRequestIdSort
    [Return]    css=#serviceRequestId > span.sort-wrapper > span

divSubmittedSort
    [Return]    css=#creationTime > span.sort-wrapper > span

divRejectedSort
    [Return]    css=#reviewDate > span.sort-wrapper > span

divLastNameSort
    [Return]    css=#lastName > span.sort-wrapper > span

divFirstNameSort
    [Return]    css=#firstName > span.sort-wrapper > span

divEmailSort
    [Return]    css=#email > span.sort-wrapper > span

divDescriptionSort
    [Return]    css=#requestText > span.sort-wrapper > span

cbxServiceRequestStatus
    [Return]    css=.dropdown-toggle

txtDatePicker
    [Return]    id=dateRangePicker

txtDateRangePickerStop
    [Return]    name=daterangepicker_end

txtDateRangePickerStart
    [Return]    name=daterangepicker_start

spnRemoveFilterIcon
    [Return]    css=.search-section .remove-icon

txtDateRangePickerApplyButton
    [Return]    css=.daterangepicker .applyBtn

txtDateRangePickerClearButton
    [Return]    css=.daterangepicker .applyBtn

divSelectStatusItem
    [Arguments]    ${status}
    [Return]    xpath=//div[@class='dropdown-menu open']/descendant::span[contains(text(),'${status}')]

divPageIndex
    [Arguments]    ${page_index}
    [Return]    css=.page-list-wrapper div[data-page-index='${page_index}']

divTotalViewEntry
    [Return]    xpath=//*[@class='pagination-section top']/descendant::strong[2]

divpaginationLeftArrow
    [Return]    css=.pagination-section.top .fa-chevron-left

divpaginationRightArrow
    [Return]    css=.pagination-section.top .fa-chevron-right

divServiceRequestTableCell
    [Arguments]    ${column_name}    ${row_number}
    [Return]    xpath=//a[@class='cintas-table-row js-btn-service-request-details'][1]/descendant::div[contains(text(),'${column_name}')]/following-sibling::div

divServiceRequestTableRow
    [Arguments]    ${cell_value}
    [Return]    xpath=//div[contains(text(),'${cell_value}')]/ancestor::a[@class='cintas-table-row js-btn-service-request-details']

lnkServiceRequestTableRowCount
    [Return]    //a[@class='cintas-table-row js-btn-service-request-details']

get_refLastName
    [Return]    id=lastName

get_refFirstName
    [Return]    id=firstName

get_refEmail
    [Return]    id=email

get_refServiceRequestId
    [Return]    id=serviceRequestId

get_refSubmitted
    [Return]    id=creationTime

get_refRejected
    [Return]    id=reviewDate

get_refmanageOtherUserRequest
    [Return]    css=.link-section a[href='/cintasrentalsstorefront/service-request/approval']

get_refDescription
    [Return]    id=requestText

get_refLastNameSort
    [Return]    css=#lastName > span.sort-wrapper > span

get_refFirstNameSort
    [Return]    css=#firstName > span.sort-wrapper > span

get_refEmailSort
    [Return]    css=#email > span.sort-wrapper > span

get_refServiceRequestIdSort
    [Return]    css=#serviceRequestId > span.sort-wrapper > span

get_refSubmittedSort
    [Return]    css=#creationTime > span.sort-wrapper > span

get_refRejectedSort
    [Return]    css=#reviewDate > span.sort-wrapper > span

get_refDescriptionSort
    [Return]    css=#requestText > span.sort-wrapper > span

divServiceRequestTableRowIndex
    [Arguments]    ${index}
    [Return]    xpath=//*[@class='cintas-table-row js-btn-service-request-details'][${index}]
