*** Settings ***
Library           Selenium2Library
Resource          ../PageObjects/CreateNewRequest_Page.robot

*** Keywords ***
Enter Subject
    [Arguments]    ${subject}
    ${locator} =    CreateNewRequest_Page.txtSubject
    wait until element is visible    ${locator}
    Input Text    ${locator}    ${subject}

Enter Details
    [Arguments]    ${details}
    ${locator} =    CreateNewRequest_Page.txtRequest
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Input Text    ${locator}    ${details}

Click Submit Message
    ${locator} =    CreateNewRequest_Page.btnSubmitMessage
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    Click Button    ${locator}

Click Upload File
    ${locator} =    CreateNewRequest_Page.btnUploadFile
    Click element    ${locator}

Click Submit File
    ${locator} =    CreateNewRequest_Page.btnSubmitFile
    Click Button    ${locator}

Click Modal Close X
    ${locator} =    CreateNewRequest_Page.btnModalClose
    Click Button    ${locator}

Click Remove Attachment
    ${locator} =    CreateNewRequest_Page.spnRemoveAttachment
    Click Element    ${locator}

get Attached File Name
    ${locator} =    CreateNewRequest_Page.lnkAttachmentFileName
    wait until element is visible    ${locator}  ${DEFAULT_TIMEOUT}
    ${text}=    Get Text    ${locator}
    [Return]    ${text}

Select Attachment File
    [Arguments]    ${file_path}
    [Documentation]    ${INPUT_FILES}${UPLOAD_FILES_PATH}cntr195.txt
    ${locator} =    CreateNewRequest_Page.inpChooseFile
    Choose File    ${locator}    ${file_path}

get Upload File Modal Error Message
    [Documentation]    The file is greater than allowed max size.
    ...    The file does not have a valid extension.
    ...    Please choose a file.
    ${locator} =    CreateNewRequest_Page.lblUploadFileError
    ${text} =    Get Text    ${locator}
    [Return]    ${text}

Wait Until File Upload Completion
    ${locator} =    CreateNewRequest_Page.divProgressBar
    wait until element is visible    ${locator}    ${DEFAULT_TIMEOUT}



