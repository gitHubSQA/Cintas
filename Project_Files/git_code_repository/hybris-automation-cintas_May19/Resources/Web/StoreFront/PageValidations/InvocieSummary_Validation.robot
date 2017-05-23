*** Settings ***
Library           Collections
Library           DateTime
Resource          ../PageActions/InvoiceSummary_Action.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../PageActions/Common_Actions.robot
Library           String

*** Keywords ***
Validate Open Invoice Total Amount
    [Arguments]    ${exp_total}
    ${actual_total}=    InvoiceSummary_Action.Get Open Invocie Total
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_total}    $${exp_total}

Validate Single User Billing Dashboard
    Common_Actions.Wait For Loading
    ${act_open_total}=    Dashboard_Actions.Get Open Invoice Total
    ${act_due_total}=    Dashboard_Actions.Get Due Invoice Total
    ${act_open_label}=    Dashboard_Actions.Get Open Invoice Total Label
    ${act_due_label}=    Dashboard_Actions.Get Due Invoice Label
    ${act_due_color}=    Dashboard_Actions.Get Due Invoice Label Color
    ${act_open_label}=    Convert To Lowercase    ${act_open_label}
    ${act_due_label}=    Convert To Lowercase    ${act_due_label}
    Run Keyword And Continue On Failure    Should Be Equal    ${act_open_label}    open invoice total
    Run Keyword And Continue On Failure    Should Be Equal    ${act_due_label}    invoice total due
    Run Keyword If    '${act_due_total}'!='0.00'    Run Keyword And Continue On Failure    Should Contain    ${act_due_color}    rgb(255, 0, 0)
    Common_Actions.Open Page    cintasrentalsstorefront/invoice-summary
    InvocieSummary_Validation.Validate Open Invoice Total Amount    ${act_open_total}
