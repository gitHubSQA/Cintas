*** Settings ***
Library           Selenium2Library

*** Keywords ***
lnkBilling
    [Return]    css=.dashboard-section a[href='/cintasrentalsstorefront/invoice-summary']>img

lnkReport
    [Return]    css=.dashboard-section a[href='/cintasrentalsstorefront/']>img

lnkServiceRequest
    [Return]    css=.dashboard-section a[href='/cintasrentalsstorefront/service-request']>img

lnkManageCenter
    [Return]    css=.dashboard-section a[href='/cintasrentalsstorefront/service-request/generic']>img

lnkMyService
    [Return]    css=.dashboard-section a[href='/cintasrentalsstorefront/contract-garments']>img


lnkUserManagement
    [Return]    css=.dashboard-section a[href='/cintasrentalsstorefront/user-management']>img

btnViewNow
    [Return]    css=.btn-primary

btnActivitySearch
    [Return]    css=.js-btn-filter-by-activity-type

divNoActivityLog
    [Return]    css=.activity-log-no-result

divActivityType
    [Arguments]    ${activity_log_no}
    [Return]    css=.activity-log-section .cintas-table-row.cintas-table-highlighted-row:nth-of-type(${activity_log_no}) .col-type .col-sm-12.col-xs-8>div

divActivityDescription
    [Arguments]    ${activity_log_no}
    [Return]    css=.activity-log-section .cintas-table-row.cintas-table-highlighted-row:nth-of-type(${activity_log_no}) .col-description .col-sm-12.col-xs-8>div

divActivityEventDate
    [Arguments]    ${activity_log_no}
    [Return]    css=.activity-log-section .cintas-table-row.cintas-table-highlighted-row:nth-of-type(${activity_log_no}) .col-event-date .col-sm-12.col-xs-8>div

lnkActivityRow
    [Arguments]    ${activity_log_no}
    [Return]    css=.activity-log-section .cintas-table-row.cintas-table-highlighted-row:nth-of-type(${activity_log_no}) .col-event-date .col-sm-12.col-xs-8>div

spnNewActivityLogCount
    [Return]    css=.js-unseen-activity-count-data

btnAddNewRequest
    [Return]    css=.js-btn-add-new-request

divActivityTypeHeader
    [Return]    id=activityType

divActivityDateHeader
    [Return]    id=eventDate

linkHighlightedRow
    #css=.cintas-table-highlighted-row
    [Return]    //a[@class='cintas-table-row cintas-table-highlighted-row']

cbxActivityType
    [Return]    css=.dropdown-toggle

divSelectActivityItem
    [Arguments]    ${status}
    [Return]    xpath=//div[@class='dropdown-menu open']/descendant::span[contains(text(),'${status}')]

divActivityDescHeader
    [Return]    css=.dashboard-section .cintas-table-header.hidden-xs .col-description

divCintasTable
    [Return]    css=.activity-log-section .activity-log-list .cintas-table

divOldActivityType
    [Arguments]    ${activity_log_no}
    [Return]    css=.dashboard-section .cintas-table-row:nth-of-type(${activity_log_no}) .col-type .col-sm-12.col-xs-8>div

divOldActivityDescription
    [Arguments]    ${activity_log_no}
    [Return]    css=.dashboard-section .cintas-table-row:nth-of-type(${activity_log_no}) .col-description .col-sm-12.col-xs-8>div

spnOpenInvoiceTotal
    [Return]    id=invTotal

spnInvoiceTotalDue
    [Return]    id=invoiceTotalDue

lblOpenInvoice
    [Return]    css=.open-inv.row>div

lblDueInvoice
    [Return]    xpath=//*[@class='inv-section']/div[2]/div

btnPayNow
    [Return]    //*[@class='row bill-details']/div/a

divActivityLogList
    [Return]    css=.activity-log-list

# Notification Table
divNotificationTableCell
    [Arguments]    ${column_name}    ${row_number}
    [Return]    xpath=//*[@class='cintas-table-row'][${row_number}]/descendant::div[contains(text(),'${column_name}')]/following-sibling::div

divNotificationTableRow
    [Arguments]    ${cell_value}
    [Return]    xpath=//div[contains(text(),'${cell_value}')]/ancestor::*[@class='cintas-table-row']

divNotificationTableRowIndex
    [Arguments]    ${row_index}
    [Return]    xpath=//*[@class='cintas-table-row'][${row_index}]

lnkNotificationTableRowCount
    [Return]    xpath=//*[@class='cintas-table-row']

divHighLightedNotificationTableRowIndex
    [Arguments]    ${row_index}
    [Return]    xpath=//*[@class='cintas-table-row cintas-table-highlighted-row'][${row_index}]