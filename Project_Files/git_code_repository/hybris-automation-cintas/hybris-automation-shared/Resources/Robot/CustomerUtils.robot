*** Settings ***
Resource          ../../Resources/Excel/ExcelUtils.robot
Variables         ../../Configurations/TestDataPaths.py
Library           Selenium2Library
Library           Collections
Library           FakerLibrary
Library           String


*** Variables ***
@{TITLES} =  mrs  miss  ms  mr  dr  rev
${INPUT_FILES}


*** Keywords ***
Create Random Customer Data
    [Arguments]  ${customer_country}
    ${length} =  get length  ${TITLES}
    ${length} =  evaluate  ${length} - 1
    ${title_random_index} =  FakerLibrary.Random Int  min=0  max=${length}
    ${title}  get from list  ${TITLES}  ${title_random_index}
    ${gender}  set variable if  ${title_random_index} < 3  FEMALE  MALE
    ${first_name} =  FakerLibrary.First Name
    ${last_name} =  FakerLibrary.Last Name
    ${email} =  FakerLibrary.Email
    ${company} =  FakerLibrary.Company
    ${excel_doc_count} =  ExcelUtils.Get Excel Document Sheet Row Count  ${INPUT_FILES}${ADDRESS_DATA_PATH}  ${customer_country}
    ${address_random_index} =  FakerLibrary.Random Int  min=1  max=${excel_doc_count}
    ${address_data} =  ExcelUtils.Get Data From Excel Document  ${INPUT_FILES}${ADDRESS_DATA_PATH}  ${customer_country}  addressId  ${address_random_index}
    log  ${address_data}
    ${customer} =  Create Dictionary
    Set to Dictionary  ${customer}  firstName  ${first_name}  lastName  ${last_name}  email  ${email}  title  ${title}  company  ${company}
    ...  gender  ${gender}  country  ${address_data.country}  address1  ${address_data.address1}  address2  ${address_data.address2}
    ...  city  ${address_data.city}  region  ${address_data.region}  regionAbbreviation  ${address_data.regionAbbreviation}
    ...  postalCode  ${address_data.postalCode}  countryIso  ${address_data.countryIso}  regionIso  ${address_data.regionIso}
    ...  phoneNumber  ${address_data.phoneNumber}  language  ${address_data.language}  currency  ${address_data.currency}
    [Return]  ${customer}
