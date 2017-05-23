*** Settings ***
Library           Selenium2Library

*** Keywords ***

#----------------Ribbon---------------------------------
lnkWearerDetails
    [Return]    xpath=//*[@id='page-content-wrapper']/div/div[3]/div/div[2]/div[1]/a[1]

lnkSelectUniforms
    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Select Uniforms')]

lnkSReviewRequest
    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Review Request')]


#----------Wearer Information Form -----------------
txtWearerLastName
    [Return]    id=lastName

txtWearerFirstName
    [Return]    id=firstName

btnSelectAccount
    [Return]    css=.btn.btn-default.js-btn-selectaccount

txtWearersoldToId
    [Return]    id=soldToId

txtWearersoldToName
    [Return]    id=soldToName

# Mandatroy error message

lblWearerLastNameErrMsg
    [Return]    id=lastName-error

lblWearerFirstNameErrMsg
    [Return]    id=firstName-error

lblSelectAccountErrMsg
    [Return]    id=soldToName-error


#-------------- Optional Field--------

txtWearerAccountNumber
    [Return]    id=accountNumber

txtWearerEmail
    [Return]    id=email

txtWearerPhoneNumber
    [Return]    id=phoneNumber

txtWearerEmployeeId
    [Return]    id=employeeId

txtWearerAddComment
    [Return]    id=comment

#----------------Buttons---------------------------------
btnContinueButton
    [Return]    xpath=//*[@class='btn btn-primary' and contains(text(),'Continue')]

btnBackToWearerList
    [Return]    xpath=//*[@class='btn btn-default' and contains(text(),'Back to Wearer List')]

#----------------Modified Account---------------------------------
popupSelectAccountModal
    [Return]    id=selectAccountModal

btnSelectAccountModalYes
    [Return]    css=.btn.btn-primary.js-remove-products

btnSelectAccountModalNo
    [Return]    xpath=//*[@class='btn btn-default' and contains(text(),'No')]