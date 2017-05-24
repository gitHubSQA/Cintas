*** Settings ***
Library           FakerLibrary
Library           String
Library           ../../Libraries/StringUtils.py


*** Keywords ***
Get Random Email
    ${fname} =    FakerLibrary.First Name
    ${lname} =    FakerLibrary.Last Name
    ${fname_lower} =	Convert To Lowercase	${fname}
    ${lname_lower} =	Convert To Lowercase	${lname}
    ${temp_email} =    Set Variable    ${fname_lower}.${lname_lower}.hybris@mailinator.com
    ${email} =    convert_email_to_random    ${temp_email}
    [Return]    ${email}
