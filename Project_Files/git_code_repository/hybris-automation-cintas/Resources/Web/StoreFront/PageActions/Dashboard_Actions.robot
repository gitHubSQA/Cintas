*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/Dashboard_Page.robot

*** Keywords ***
Click View Now Button
    ${locator} =    Dashboard_Page.btnViewNow
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Billing
    ${locator} =    Dashboard_Page.lnkBilling
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Report
    ${locator} =    Dashboard_Page.lnkReport
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Service Request
    ${locator} =    Dashboard_Page.lnkServiceRequest
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click My-Service
    ${locator} =    Dashboard_Page.lnkMyService
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click User Management
    ${locator} =    Dashboard_Page.lnkUserManagement
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get No Activity Message
    ${locator} =    Dashboard_Page.divNoActivityLog
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${msg}=    Get Text    ${locator}
    [Return]    ${msg}

Get Activity Type
    [Arguments]    ${activity_log_no}
    ${locator} =    Dashboard_Page.divActivityType    ${activity_log_no}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${type}=    Get Text    ${locator}
    [Return]    ${type}

Get Activity Description
    [Arguments]    ${activity_log_no}
    ${locator} =    Dashboard_Page.divActivityDescription    ${activity_log_no}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${des}=    Get Text    ${locator}
    [Return]    ${des}

Get Activity Event Date
    [Arguments]    ${activity_log_no}
    ${locator} =    Dashboard_Page.divActivityEventDate    ${activity_log_no}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${date}=    Get Text    ${locator}
    [Return]    ${date}

Click Activity Row
    [Arguments]    ${activity_log_no}
    ${locator} =    Dashboard_Page.lnkActivityRow    ${activity_log_no}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Activity Href
    [Arguments]    ${activity_log_no}
    [Timeout]    ${href}
    ${locator} =    Dashboard_Page.lnkActivityRow    ${activity_log_no}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${href}=    Selenium2Library.Get Element Attribute    ${locator}@href

Click Add Request New Button
    ${locator} =    Dashboard_Page.btnAddNewRequest
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Activity Search Button
    ${locator} =    Dashboard_Page.btnActivitySearch
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Type Header
    ${locator} =    Dashboard_Page.divActivityTypeHeader
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click Date Header
    ${locator} =    Dashboard_Page.divActivityDateHeader
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Highlighted Row
    ${locator} =    Dashboard_Page.linkHighlightedRow
    ${no_highlighted_rows}=    Get Matching Xpath Count    ${locator}
    [Return]    ${no_highlighted_rows}

Select Activity
    [Arguments]    ${type}
    ${el1} =    Dashboard_Page.cbxActivityType
    wait until element is visible    ${el1}    ${DEFAULT_TIMEOUT}
    Click Element    ${el1}
    ${el2} =    Dashboard_Page.divSelectActivityItem    ${type}
    wait until element is visible    ${el2}    ${DEFAULT_TIMEOUT}
    Click Element    ${el2}

Get New Activity Log Count
    ${locator} =    Dashboard_Page.spnNewActivityLogCount
    wait until page contains element    ${locator}    ${DEFAULT_TIMEOUT}
    ${no_new_log}=    Get Text    ${locator}
    [Return]    ${no_new_log}

Get Old Activity Type
    [Arguments]    ${activity_log_no}
    ${locator} =    Dashboard_Page.divOldActivityType    ${activity_log_no}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${type}=    Get Text    ${locator}
    [Return]    ${type}

Get Old Activity Description
    [Arguments]    ${activity_log_no}
    ${locator} =    Dashboard_Page.divOldActivityDescription    ${activity_log_no}
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${des}=    Get Text    ${locator}
    [Return]    ${des}

Serach Activity Log
    [Arguments]    ${type}
    Dashboard_Actions.Select Activity    ${type}
    Dashboard_Actions.Click Activity Search Button

Get Open Invoice Total
    ${locator} =    Dashboard_Page.spnOpenInvoiceTotal
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${open_total} =    Get Text    ${locator}
    [Return]    ${open_total}

Get Due Invoice Total
    ${locator} =    Dashboard_Page.spnInvoiceTotalDue
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${due_total} =    Get Text    ${locator}
    [Return]    ${due_total}

Get Open Invoice Total Label
    ${locator} =    Dashboard_Page.lblOpenInvoice
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${open_label} =   Get Text    ${locator}
    [Return]    ${open_label}

Get Due Invoice Label
    ${locator} =    Dashboard_Page.lblDueInvoice
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${due_label} =    Get Text    ${locator}
    [Return]    ${due_label}

Get Due Invoice Label Color
    ${due_color} =    Execute Javascript    return $(".dashboard-inv-section .due-inv").css("color")
    #rgb(255, 0, 0)
    [Return]    ${due_color}

Click Pay Now Button
    ${locator} =    Dashboard_Page.btnPayNow
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Message Center
    ${locator} =    Dashboard_Page.lnkManageCenter
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

# Notificaiton Table Operation.

Get Notificatiaon Table Cell Value
    [Arguments]    ${column_name}    ${row_number}
    ${locator} =    Dashboard_Page.divNotificationTableCell   ${column_name}    ${row_number}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Click Notificatiaon Table Row
    [Arguments]    ${unique_cell_value}
    ${locator} =    Dashboard_Page.divNotificationTableRow  ${unique_cell_value}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Get Notificatiaon Table Row Count
    ${locator} =    Dashboard_Page.lnkNotificationTableRowCount
    ${total_rows} =    Get Matching Xpath Count    ${locator}
    [Return]    ${total_rows}

Click Notificatiaon Table Row By Index
    [Arguments]    ${row_index}
    ${locator} =    Dashboard_Page.divNotificationTableRowIndex  ${row_index}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click High Lighted Notificatiaon Table Row By Index
    [Arguments]    ${row_index}
    ${locator} =    Dashboard_Page.divHighLightedNotificationTableRowIndex  ${row_index}
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Element    ${locator}
