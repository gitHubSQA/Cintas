*** Settings ***
Library           String
Library           Collections
Library           ../../../../hybris-automation-shared/Libraries/MathUtils.py
Resource          ../PageActions/SelectAnAccount_Actions.robot
Resource          ../PageActions/MyServicesContract_Actions.robot
Resource          ../PageActions/MyServiceContractGarments_Actions.robot
Resource          ../PageActions/MyServicesAddWearer_Actions.robot
Resource          ../PageActions/MyServicesAddWearerDetails_Actions.robot
Resource          ../PageActions/MyServicesAddWearerConfirm_Actions.robot
Resource          ../PageActions/PDP_Actions.robot
Resource          ../PageActions/PLP_Actions.robot
Resource          ../PageActions/Common_Actions.robot
Resource          ../PageActions/Dashboard_Actions.robot


*** Keywords ***
Change Account From PDP or PLP page
    [Arguments]    ${filter_text}   ${master_sold_to}
    PDP_Actions.Click On Change Account Link
    ManageMyContract_Keywords.Select An Account By MST  ${filter_text}    ${EMPTY}    ${master_sold_to}


Chagne Account from Contract or Garment Details Page
    [Arguments]    ${filter_text}   ${master_sold_to}
    MyServicesContract_Actions.Click On Change Account Link
    ManageMyContract_Keywords.Select An Account By MST  ${filter_text}    ${EMPTY}    ${master_sold_to}

Modify Account From Add Wearer Details Page
    [Arguments]    ${sold_to}
    MyServicesAddWearer_Actions.Click On Select Account
    ${locator} =    MyServicesAddWearer_Page.popupSelectAccountModal
    Wait Until Page Contains Element    ${locator}    ${DEFAULT_TIMEOUT}
    run keyword and continue on failure  Element Should Contain  ${locator}  Any garments that you may have already selected for this wearer will be removed. Would you like to proceed?
    MyServicesAddWearer_Actions.Click On Select Account Modal Yes Button
    ManageMyContract_Keywords.Select CST for Facility and Deep Clean  ${sold_to}

#===============================

Select An Account By MST
    [Arguments]    ${filter_text}    ${filter_state}    ${master_sold_to}
    # Missing Click Filter By Account
    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
    SelectAnAccount_Actions.Click Search
    SelectAnAccount_Actions.Click MST Select Button  ${master_sold_to}
    Common_Actions.Wait For Loading

Select An Account By CST
    [Arguments]    ${filter_text}    ${filter_state}    ${customer_sold_to}
    # Missing Click Filter By Account
    Run Keyword If    '${filter_text}' != '${EMPTY}'    SelectAnAccount_Actions.Enter Search Criteria    ${filter_text}
    Run Keyword If    '${filter_state}' != '${EMPTY}'    SelectAnAccount_Actions.Select State    ${filter_state}
    SelectAnAccount_Actions.Click Search
    SelectAnAccount_Actions.Click CST Select Button  ${customer_sold_to}
    Common_Actions.Wait For Loading

Select Services
    [Arguments]    ${service_type}
    ${service_type}=  Convert To Uppercase  ${service_type}
    Log    ${service_type}
    Run Keyword If    '${service_type}' == 'UNIFORM'    MyServicesContract_Actions.Click On Employee Uniform Tiles
    Run Keyword If    '${service_type}' == 'FACILITY'    MyServicesContract_Actions.Click On Facility Service Tiles
    Run Keyword If    '${service_type}' == 'DEEP'    MyServicesContract_Actions.Click On Deep Clean Tiles
    Common_Actions.Wait For Loading

Filter By Account All
    SelectAnAccount_Actions.Click Select All Accounts

Navigate to My Service
    Dashboard_Actions.Click My-Service

Search Contract
    [Arguments]    ${search_text}
    MyServicesContract_Actions.Enter Search Text  ${search_text}
    MyServicesContract_Actions.Click On Search Button


Search and Open Contract
    [Arguments]    ${search_text}
    MyServicesContract_Actions.Enter Search Text  ${search_text}
    MyServicesContract_Actions.Click On Search Button
    MyServicesContract_Actions.Click My Service Table Row  ${search_text}

Change Uniform or Product Atrributes
    [Arguments]    ${index}
    ManageMyContract_Keywords.Read Contract Uniform or Product Attributes Value  ${index}
    MyServiceContractGarments_Actions.Click On Change Button of Product Item  ${index}

View Uniform or Product Atrributes
    [Arguments]    ${index}
    ManageMyContract_Keywords.Read Contract Uniform or Product Attributes Value  ${index}
    MyServiceContractGarments_Actions.Click On View Button of Product Item  ${index}

Select CST for Facility and Deep Clean
    [Arguments]    ${cst}
    Run Keyword If    '${cst}' != '${EMPTY}'  SelectAnAccount_Actions.Click Service CST Check Box  ${cst}
    SelectAnAccount_Actions.Click Select

Read Pre-select Uniform Attributes
    [Arguments]    ${index}
    PDP_Actions.Click On Add To Agreement
    ${locator} =    PDP_Page.btnPdpAdd
    Wait Until Page Contains Element    ${locator}    ${DEFAULT_TIMEOUT}
    Click Element    ${locator}


#===============================PDP PAGE ===============================================

Read Pre-select Uniform or Product Attributes in PDP
    ${product_name}=    PDP_Actions.Get Product Name
    ${product_style}=   PDP_Actions.Get Product Style
    ${product_color}=   PDP_Actions.Get Selected Color
    ${product_fit}=     PDP_Actions.Get Selected Fit
    ${product_size}=    PDP_Actions.Get Selected Size
    ${product_sleeve}=  PDP_Actions.Get Selected Sleeve
    ${product_qty}=     PDP_Actions.Get Quantity From Text Box

#---------------------- Add Product ---------------------------------------
Add Uniform or Product By Attributes Description
    [Arguments]    ${service_to_view}  ${sold_to}  ${in_product}  ${color}  ${fit_desc}  ${size_desc}  ${sleeve_desc}  ${trim_option}  ${qty}  ${comment}
    Run Keyword If    '${service_to_view}' == 'UNIFORM'  MyServiceContractGarments_Actions.Click On Add Uniform Button
    ...  ELSE  MyServicesContract_Actions.Click On Add New Product Button
    Run Keyword If    '${service_to_view}' != 'UNIFORM'  run keyword and ignore error  ManageMyContract_Keywords.Select CST for Facility and Deep Clean  ${sold_to}
    PLP_Actions.Click On Product Image    ${in_product}
    Run Keyword If    '${color}' != '${EMPTY}'  PDP_Actions.Select Color  ${color}
    Run Keyword If    '${fit_desc}' != '${EMPTY}'  PDP_Actions.Select Fit  ${fit_desc}
    Run Keyword If    '${size_desc}' != '${EMPTY}'  PDP_Actions.Select Size  ${size_desc}
    Run Keyword If    '${sleeve_desc}' != '${EMPTY}'  PDP_Actions.Select Sleeve  ${sleeve_desc}
    Run Keyword If    '${trim_option}' != '${EMPTY}'  PDP_Actions.Select Trim Option  ${trim_option}
    Run Keyword If    '${qty}' != '${EMPTY}'  PDP_Actions.Enter Quantity  ${qty}
    Run Keyword If    '${comment}' != '${EMPTY}'  PDP_Actions.Enter Comment  ${comment}
    PDP_Actions.Click On Add To Agreement

Add Uniform or Product By Attributes ID
    [Arguments]    ${service_to_view}  ${sold_to}  ${in_product}  ${color_id}  ${fit_id}  ${size_id}  ${sleeve_id}  ${trim_option}  ${qty}  ${comment}
    Run Keyword If    '${service_to_view}' == 'UNIFORM'  MyServiceContractGarments_Actions.Click On Add Uniform Button
    ...  ELSE  MyServicesContract_Actions.Click On Add New Product Button
    Run Keyword If    '${service_to_view}' != 'UNIFORM'  run keyword and ignore error  ManageMyContract_Keywords.Select CST for Facility and Deep Clean  ${sold_to}
    Common_Actions.Wait For Loading
    PLP_Actions.Click On Product Image    ${in_product}
    Common_Actions.Wait For Loading
    Run Keyword If    '${color_id}' != '${EMPTY}'  PDP_Actions.Select Color By ID  ${color_id}
    Common_Actions.Wait For Loading
    Run Keyword If    '${fit_id}' != '${EMPTY}'  PDP_Actions.Select Fit By ID  ${fit_id}
    Common_Actions.Wait For Loading
    Run Keyword If    '${size_id}' != '${EMPTY}'  PDP_Actions.Select Size By ID  ${size_id}
    Common_Actions.Wait For Loading
    Run Keyword If    '${sleeve_id}' != '${EMPTY}'  PDP_Actions.Select Sleeve By ID  ${sleeve_id}
    Common_Actions.Wait For Loading
    Run Keyword If    '${trim_option}' != '${EMPTY}'  PDP_Actions.Select Trim Option  ${trim_option}
    Common_Actions.Wait For Loading
    Run Keyword If    '${qty}' != '${EMPTY}'  PDP_Actions.Enter Quantity  ${qty}
    Run Keyword If    '${comment}' != '${EMPTY}'  PDP_Actions.Enter Comment  ${comment}
    PDP_Actions.Click On Add To Agreement

Click On Add Uniform or Product Button
    [Arguments]    ${service_to_view}
    Run Keyword If    '${service_to_view}' == 'UNIFORM'  MyServiceContractGarments_Actions.Click On Add Uniform Button
    ...  ELSE  MyServicesContract_Actions.Click On Add New Product Button


#---------------------- Update Product ---------------------------------------
Update Uniform or Product By Attributes Description
    [Arguments]    ${color}  ${fit_desc}  ${size_desc}  ${sleeve_desc}  ${trim_option}  ${qty}  ${comment}
    Run Keyword If    '${color}' != '${EMPTY}'  PDP_Actions.Select Color  ${color}
    Run Keyword If    '${fit_desc}' != '${EMPTY}'  PDP_Actions.Select Fit  ${fit_desc}
    Run Keyword If    '${size_desc}' != '${EMPTY}'  PDP_Actions.Select Size  ${size_desc}
    Run Keyword If    '${sleeve_desc}' != '${EMPTY}'  PDP_Actions.Select Sleeve  ${sleeve_desc}
    Run Keyword If    '${trim_option}' != '${EMPTY}'  PDP_Actions.Select Trim Option  ${trim_option}
    Run Keyword If    '${qty}' != '${EMPTY}'  PDP_Actions.Enter Quantity  ${qty}
    Run Keyword If    '${comment}' != '${EMPTY}'  PDP_Actions.Enter Comment  ${comment}
    PDP_Actions.Click On Update Agreement

Update Uniform or Product By Attributes ID
    [Arguments]    ${color_id}  ${fit_id}  ${size_id}  ${sleeve_id}  ${trim_option}  ${qty}  ${comment}
    Common_Actions.Wait For Loading
    Run Keyword If    '${color_id}' != '${EMPTY}'  PDP_Actions.Select Color By ID  ${color_id}
    Common_Actions.Wait For Loading
    Run Keyword If    '${fit_id}' != '${EMPTY}'  PDP_Actions.Select Fit By ID  ${fit_id}
    Common_Actions.Wait For Loading
    Run Keyword If    '${size_id}' != '${EMPTY}'  PDP_Actions.Select Size By ID  ${size_id}
    Run Keyword If    '${sleeve_id}' != '${EMPTY}'  PDP_Actions.Select Sleeve By ID  ${sleeve_id}
    Run Keyword If    '${trim_option}' != '${EMPTY}'  PDP_Actions.Select Trim Option  ${trim_option}
    Run Keyword If    '${qty}' != '${EMPTY}'  PDP_Actions.Enter Quantity  ${qty}
    Run Keyword If    '${comment}' != '${EMPTY}'  PDP_Actions.Enter Comment  ${comment}
    PDP_Actions.Click On Update Agreement

Remove Uniform or Product
    [Arguments]  ${comment}
    Common_Actions.Wait For Loading
    Run Keyword If  '${comment}' != '${EMPTY}'  PDP_Actions.Enter Comment  ${comment}
    PDP_Actions.Click On Remove Agreement

#-------------- Copy wearer-------------------------
Copy From Existing Wearer
    [Arguments]    ${name}
    # message with regular expression
    ${msg1} =   set variable   Successfully copied
    MyServicesAddWearerDetails_Actions.Click On Copy From Existing Wearer Button
    MyServicesAddWearerDetails_Actions.Enter First OR Last Name  ${name}
    MyServicesAddWearerDetails_Actions.Click On Search Button
    Common_Actions.Wait For Loading
    Sleep  6s
    #MyServicesAddWearerDetails_Actions.Click Wearer Table Row  ${name}
    MyServicesAddWearerDetails_Actions.Click Wearer Table Row By Index  1
    # Valdiate the confirmation message
    Common_Validation.Validate Global Message   ${msg1}

#------------ contract garments Page ---------------
Remove Unifrom Wearer
    MyServiceContractGarments_Actions.Click On Remove Uniform Wearer Button
    MyServiceContractGarments_Actions.Click On Remove Wearer Confirmation Yes Button

Remove Product By Clicking X Button
    [Arguments]    ${index}
    MyServiceContractGarments_Actions.Click On Remove X Button of Product Item      ${index}
    MyServiceContractGarments_Actions.Click On Remove Product Confirmation Yes Button

Read Contract Uniform or Product Attributes Value
    [Arguments]    ${index}
    ${product_name} =  MyServiceContractGarments_Actions.Get Name of Product Item  ${index}
    Set Test Variable  ${product_name}
    ${product_style} =  MyServiceContractGarments_Actions.Get Style of Product Item  ${index}
    Set Test Variable  ${product_style}
    ${product_sku} =  MyServiceContractGarments_Actions.Get SKU of Product Item  ${index}
    Set Test Variable    ${product_sku}
    ${product_color} =  MyServiceContractGarments_Actions.Get Color of Product Item  ${index}
    Set Test Variable    ${product_color}
    ${product_fit}=  MyServiceContractGarments_Actions.Get Fit of Product Item  ${index}
    Set Test Variable    ${product_fit}
    ${product_size1} =   MyServiceContractGarments_Actions.Get Size1 of Product Item  ${index}
    Set Test Variable   ${product_size1}
    ${product_size2} =  MyServiceContractGarments_Actions.Get Size2 of Product Item  ${index}
    Set Test Variable    ${product_size2}
    ${product_qty} =  MyServiceContractGarments_Actions.Get Quantity of Product Item  ${index}
    Set Test Variable  ${product_qty}

#**************** My Services Add Wearer Page  *******************************
Enter Wearer Mandatory Information
    [Arguments]    ${first_name}  ${last_name}   ${cst}
    MyServicesAddWearer_Actions.Enter First Name  ${first_name}
    MyServicesAddWearer_Actions.Enter Last Name   ${last_name}
    MyServicesAddWearer_Actions.Click On Select Account
    ManageMyContract_Keywords.Select CST for Facility and Deep Clean   ${cst}

Enter Wearer Optional Information
    [Arguments]    ${account_number}  ${email}  ${phone_number}  ${emp_id}  ${comment}
    Run keyword unless  '${account_number}' == '${EMPTY}'  MyServicesAddWearer_Actions.Enter Wearer Account Number  ${account_number}
    Run keyword unless  '${email}' == '${EMPTY}'  MyServicesAddWearer_Actions.Enter Wearer Email  ${email}
    Run keyword unless  '${phone_number}' == '${EMPTY}'  MyServicesAddWearer_Actions.Enter Wearer Phone Number  ${phone_number}
    Run keyword unless  '${emp_id}' == '${EMPTY}'  MyServicesAddWearer_Actions.Enter Wearer Employee ID   ${emp_id}
    Run keyword unless  '${comment}' == '${EMPTY}'  MyServicesAddWearer_Actions.Enter Wearer Comment   ${comment}


#********************* Keywords For Sarching and Sorting ******************************
#-------------------- Searching ----------------------------
Search Wearer or Facility
    [Arguments]    ${search_text}
    Run Keyword If    '${search_text}' != '${EMPTY}'    MyServicesContract_Actions.Enter Search Text    ${search_text}
    MyServicesContract_Actions.Click On Search Button
    Common_Actions.Wait For Loading

Get All Wearer or Facility Column Values
    [Arguments]    ${column_name}
    ${cntr_total} =    MyServicesContract_Actions.Get Total View Entry
    ${cntr_total} =    roundup    ${cntr_total}
    ${cntr_total} =    Evaluate    ${cntr_total} / 10
    @{cntr_values} =    Create List
    : FOR    ${INDEX}    IN RANGE    1    ${cntr_total} + 1
    \    @{page_values} =    MyServicesContract_Actions.Get My Service Table Column Values    ${INDEX}    ${column_name}
    \    ${cntr_values} =    Combine Lists    ${cntr_values}    ${page_values}
    [Return]    @{cntr_values}

Count Number of Wearer or Facility Products
    ${cntr_total} =    MyServicesContract_Actions.Get Total View Entry
    ${cntr_total} =    roundup    ${cntr_total}
    ${cntr_total} =    Evaluate    ${cntr_total} / 10
    ${total_count} =   Set variable  ${0}
    : FOR    ${INDEX}    IN RANGE    1    ${cntr_total} + 1
    \    MyServicesContract_Actions.Click Page Index    ${INDEX}
    \    ${contract_per_page} =   MyServicesContract_Actions.Get My Service Table Row Count
    \    ${total_count} =    Evaluate    ${total_count}+${contract_per_page}
    [Return]    ${total_count}

#-------------------- Sorting ----------------------------
Sort Wearer or Facility By Asc
    [Arguments]    ${sort_column}
    log  ${sort_column}
    Run Keyword If    '${sort_column}' != 'Last Name' and '${sort_column}' != 'Description'   ManageMyContract_Keywords.Sort Wearer or Facility By Column    ${sort_column}

Sort Wearer or Facility By Dsc
    [Arguments]    ${sort_column}
    ManageMyContract_Keywords.Sort Wearer or Facility By Column    ${sort_column}


Sort Wearer or Facility By Column
    [Arguments]    ${sort_column}
    # Uniform
    Run Keyword If    '${sort_column}' == 'Last Name'            MyServicesContract_Actions.Click Last Name
    Run Keyword If    '${sort_column}' == 'First Name'           MyServicesContract_Actions.Click First Name
    Run Keyword If    '${sort_column}' == 'Sort ID'              MyServicesContract_Actions.Click Sort ID
    Run Keyword If    '${sort_column}' == 'Account Name'         MyServicesContract_Actions.Click Wearer Account Name
    Run Keyword If    '${sort_column}' == 'Account No.'           MyServicesContract_Actions.Click Wearer Account ID
    # FACILITY SERVICES
    Run Keyword If    '${sort_column}' == 'Description'          MyServicesContract_Actions.Click Facility Description
    Run Keyword If    '${sort_column}' == 'Qty.'                  MyServicesContract_Actions.Click Facility Quantity



