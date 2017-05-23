*** Settings ***
Library           Selenium2Library

*** Keywords ***
txtSubject
    [Return]    id=serviceSubject

txtRequest
    [Return]    id=serviceRequest

btnSubmitMessage
    [Return]    css=button.js-btn-submit-request

btnUploadFile
    [Return]    css=a.js-btn-upload-file

btnSubmitFile
    [Return]    id=btnUpload

btnModalClose
    [Return]    css=div#uploadFileModal button.close

spnRemoveAttachment
    [Return]    css=div#attachmentList span.js-remove-attachment

lnkAttachmentFileName
    [Return]    css=div#attachmentList>div>a

inpChooseFile
    [Return]    id=file

lblUploadFileError
    [Return]    id=file-error

divProgressBar
    [Return]    css=.progress.hidden
