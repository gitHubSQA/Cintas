*** Settings ***
Library           Selenium2Library
Library  String
Resource          ../PageObjects/MyServicesAddWearer_Page.robot

*** Keywords ***
#----------------Ribbon (TODO) ---------------------------------
#lnkWearerDetails
#    [Return]    xpath=//*[@id='page-content-wrapper']/div/div[3]/div/div[2]/div[1]/a[1]
#
#lnkSelectUniforms
#    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Select Uniforms')]
#
#lnkSReviewRequest
#    [Return]    xpath=//*[contains(@class,'btn-arrow-right') and contains(.,'Review Request')]


#----------Wearer Information Form -----------------
Enter First Name
    [Arguments]    ${first_name}
    ${locator} =    MyServicesAddWearer_Page.txtWearerFirstName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${first_name}

Enter Last Name
    [Arguments]    ${last_name}
    ${locator} =    MyServicesAddWearer_Page.txtWearerLastName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${last_name}

Click On Select Account
    ${locator} =    MyServicesAddWearer_Page.btnSelectAccount
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

# Read user Mandatory values
Get First Name
    ${locator} =    MyServicesAddWearer_Page.txtWearerFirstName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${first_name} =  Selenium2Library.Get Element Attribute    ${locator}@value
    [Return]   ${first_name}

Get Last Name
    ${locator} =    MyServicesAddWearer_Page.txtWearerLastName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${last_name} =  Selenium2Library.Get Element Attribute    ${locator}@value
    [Return]    ${last_name}


Get Wearer SoldTo ID
    ${locator} =    MyServicesAddWearer_Page.txtWearersoldToId
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${sold_tos} =  Selenium2Library.Get Element Attribute    ${locator}@value
    [Return]    ${sold_tos}


Get Wearer SoldTo Name
    ${locator} =    MyServicesAddWearer_Page.txtWearersoldToName
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${soldTos_name} =  Selenium2Library.Get Element Attribute    ${locator}@value
    [Return]    ${soldTos_name}

# Mandatory Field error

Get First Name Error Message
    ${locator} =    MyServicesAddWearer_Page.lblWearerFirstNameErrMsg
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

Get Last Name Error Message
    ${locator} =    MyServicesAddWearer_Page.lblWearerLastNameErrMsg
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

Get Get Account Error Message
    ${locator} =    MyServicesAddWearer_Page.lblSelectAccountErrMsg
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    ${sold_tos} =  Get Text    ${locator}
    [Return]    ${sold_tos}

#-------------- Optional Field--------

Enter Wearer Account Number
    [Arguments]    ${account_number}
    ${locator} =    MyServicesAddWearer_Page.txtWearerAccountNumber
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${account_number}

Enter Wearer Email
    [Arguments]    ${email}
    ${locator} =    MyServicesAddWearer_Page.txtWearerEmail
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${email}

Enter Wearer Phone Number
    [Arguments]    ${phone_number}
    ${locator} =    MyServicesAddWearer_Page.txtWearerPhoneNumber
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${phone_number}


Enter Wearer Employee ID
    [Arguments]    ${emp_id}
    ${locator} =    MyServicesAddWearer_Page.txtWearerEmployeeId
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${emp_id}


Enter Wearer Comment
    [Arguments]    ${comment}
    ${locator} =    MyServicesAddWearer_Page.txtWearerAddComment
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${comment}

#----------------Buttons---------------------------------
Click On Continue Button
    ${locator} =    MyServicesAddWearer_Page.btnContinueButton
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Back To Wearer List Button
    ${locator} =    MyServicesAddWearer_Page.btnBackToWearerList
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

#----------------Modified Account---------------------------------

Click On Select Account Modal Yes Button
    ${locator} =    MyServicesAddWearer_Page.btnSelectAccountModalYes
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}

Click On Select Account Modal No Button
    ${locator} =    MyServicesAddWearer_Page.btnSelectAccountModalNo
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


