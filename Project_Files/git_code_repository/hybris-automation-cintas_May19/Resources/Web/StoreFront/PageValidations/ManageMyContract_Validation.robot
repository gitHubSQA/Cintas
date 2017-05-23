*** Settings ***
Library           Collections
Library           DateTime
Library           ../../../../hybris-automation-shared/Libraries/DateUtils.py
Library           ../../../../hybris-automation-shared/Libraries/StringUtils.py
Resource          Common_Validation.robot
Resource          GlobalMessage_Validations.robot
Resource          ServiceRequest_Validations.robot
Resource          ../PageValidations/GlobalMessage_Validations.robot
Resource          ../PageActions/SelectAnAccount_Actions.robot
Resource          ../PageActions/MyServicesContract_Actions.robot
Resource          ../PageActions/MyServiceContractGarments_Actions.robot
Resource          ../PageActions/PDP_Actions.robot
Resource          ../PageActions/PLP_Actions.robot
Resource          ../PageActions/Dashboard_Actions.robot
Resource          ../PageActions/ServiceRequest_Actions.robot
Resource          ../PageActions/ServiceRequestDetails_Actions.robot
Resource          ../FunctionalKeywords/ServiceRequest_Keywords.robot
Resource          ../FunctionalKeywords/ManageMyContract_Keywords.robot

*** Keywords ***
#************** Manage MyContract Page Valdiation ******************************
Validate Contract Garments Page Components Access Right
    [Arguments]    ${impx_ur1_acc_type}
    Common_Actions.Wait For Loading
    # Tiles
    ${el1}=    MyServicesContract_Page.tileEmployeeUniform
    ${el2}=    MyServicesContract_Page.tileFacilityService
    ${el3}=    MyServicesContract_Page.tileDeepClean         # Only for contract editior.
    # Validation
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el3}
    # Button and Textbox
    ${el4}=    MyServicesContract_Page.txtSearch             # Only for contract editior and contract viewer
    ${el5}=    MyServicesContract_Page.btnSearch             # Only for contract editior and contract viewer
    ${el6}=    MyServicesContract_Page.btnAddUniformWearer   # Only for contract editior.
    # Validation
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el5}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el6}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el6}
    # Table Heading For Uniform
    ${el7}=    MyServicesContract_Page.divWearerLastName
    ${el8}=    MyServicesContract_Page.divWearerFirstName
    ${el9}=    MyServicesContract_Page.divWearerSortId
    # Vlidation
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el7}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el8}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el9}
    # For mutiple account id : TODO: when they will appear
#    ${el10}=    MyServicesContract_Page.divWearerAccountName     # Only avaiable if MST has multiple ST
#    ${el11}=    MyServicesContract_Page.divWearerAccountId       # Only avaiable if MST has multiple ST
    # Validation
#    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    # Validate Wearer or Facilities record
    ${exp_cntr_total} =    MyServicesContract_Actions.Get Total View Entry
    ${act_cntr_total} =    ManageMyContract_Keywords.Count Number of Wearer or Facility Products
    ${act_cntr_total} =    convert to string  ${act_cntr_total}
    run keyword and continue on failure  should be equal  ${exp_cntr_total}   ${act_cntr_total}

Validate Facility Service Page Components Access Right
    [Arguments]    ${impx_ur1_acc_type}
    Common_Actions.Wait For Loading
    # Tiles
    ${el1}=    MyServicesContract_Page.tileEmployeeUniform
    ${el2}=    MyServicesContract_Page.tileFacilityService
    ${el3}=    MyServicesContract_Page.tileDeepClean         # Only for contract editior.
    # Button and Textbox
    ${el4}=    MyServicesContract_Page.txtSearch             # Only for contract editior and contract viewer
    ${el5}=    MyServicesContract_Page.btnSearch             # Only for contract editior and contract viewer
    # Table heading for Facility
    ${el6}=    MyServicesContract_Page.divFacilityDescription
    ${el7}=    MyServicesContract_Page.divFacilityMaterialNo
    ${el8}=    MyServicesContract_Page.divFacilityFrequency
    ${el9}=    MyServicesContract_Page.divFacilityQuantity
    ${el10}=   MyServicesContract_Page.divFacilityAccountName    # Only avaiable if MST has multiple ST
    # Validate Wearer or Facilities record
    ${exp_cntr_total} =    MyServicesContract_Actions.Get Total View Entry
    ${act_cntr_total} =    ManageMyContract_Keywords.Count Number of Wearer or Facility Products
    run keyword and continue on failure  should be equal  ${exp_cntr_total}   ${act_cntr_total}

#************** PDP Page Valdiation ******************************
Validate PDP Components Access Right
    [Arguments]    ${impx_ur1_acc_type}  ${in_service_tile}  ${wf_add}
    Common_Actions.Wait For Loading
    ${el1}=    PDP_Page.txtProductQuantity
    ${el2}=    PDP_Page.txtPdpComment
    ${el3}=    PDP_Page.optTrimYes    #Only available for Garment '${in_service_tile}' == 'UNIFORM'
    ${el4}=    PDP_Page.optTrimNo     #Only available for Garment '${in_service_tile}' == 'UNIFORM'
    #------All buttons and links------------
    ${el5}=    PDP_Page.btnPdpAdd       # Only avialbe while you going to add that is '${wf_add}' == 'yes'
    ${el6}=    PDP_Page.btnPdpRemove    # Only avialbe while you going to add that is '${wf_add}' != 'yes'
    ${el7}=    PDP_Page.btnPdpUpdate    # Only avialbe while you going to add that is '${wf_add}' != 'yes'
    ${el8}=    PDP_Page.txtPdpComment
    ${el9}=    PDP_Page.lnkPdpBackResult
    # Common Elemente
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el9}
    #----Valdiation--------
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}

    Run keyword if    ('${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor') and '${in_service_tile}' == 'UNIFORM'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    Run keyword if    ('${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor') and '${in_service_tile}' == 'UNIFORM'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}

    Run keyword if    ('${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor') and '${wf_add}' == 'yes'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el5}

    Run keyword if    ('${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor') and '${wf_add}' != 'yes'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el6}
    Run keyword if    ('${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor') and '${wf_add}' != 'yes'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el7}

    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el8}

    # Should NOT avaialble for Contract Viewer and Wearer Viewer
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el1}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el2}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el3}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el4}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el5}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el6}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el7}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el8}
    # Validate Quantity Box is Editable or ${msg_unavilable_property}
    ${qty_value} =  set variable  8
    Run keyword unless    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'  PDP_Actions.Enter Quantity  ${qty_value}
    # Valdiate that user can not udpate facility variants
    Run keyword if  '${in_service_tile}'=='FACILITY' and '${wf_open_contract}'=='yes'  ManageMyContract_Validation.Validate Facility Service Variants Are Not Editable

# ------------ PDP attributes--------------------
Validate Product Attributes In PDP Old One
    [Arguments]  ${pdp_product_name}  ${pdp_product_color}  ${pdp_product_fit}  ${pdp_product_size}  ${pdp_product_sleeve}  ${pdp_product_qty}
    Common_Actions.Wait For Loading
    # Print Expected Product Attributes
    Log  ${pdp_product_name}
    Log  ${pdp_product_color}
    Log  ${pdp_product_fit}
    Log  ${pdp_product_size}
    Log  ${pdp_product_sleeve}
    Log  ${pdp_product_qty}
    # Read Actual Product Information in PDP page
    ${act_pdp_product_name} =    PDP_Actions.Get Product Name
    # Need Conversion from Number to Description
    ${act_pdp_product_style} =   PDP_Actions.Get Product Style
    ${act_pdp_product_color} =   PDP_Actions.Get Selected Color
    ${act_pdp_product_fit} =     PDP_Actions.Get Selected Fit
    ${act_pdp_product_size} =    PDP_Actions.Get Selected Size
    ${act_pdp_product_sleeve} =  PDP_Actions.Get Selected Sleeve
    # TODO later: depend on role
    ${act_pdp_product_qty_textbox} =  Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'  PDP_Actions.Get Quantity From Text Box
    ${act_pdp_product_qty_label} =    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   PDP_Actions.Get Quantity From label
    # Verification
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_name.lower()}    ${pdp_product_name.lower()}
    Run Keyword And Continue On Failure    should contain   ${act_pdp_product_color.lower()}   ${pdp_product_color.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_fit.lower()}     ${pdp_product_fit.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_size.lower()}    ${pdp_product_size.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_sleeve.lower()}  ${pdp_product_sleeve.lower()}
    # QTY
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_qty_textbox}  ${pdp_product_qty}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_qty_label}  ${pdp_product_qty}

Validate Product Attributes In PDP
    [Arguments]  ${pdp_product_name}  ${pdp_product_color}  ${pdp_product_fit}  ${pdp_product_size}  ${pdp_product_sleeve}  ${pdp_product_qty}
    Common_Actions.Wait For Loading
    # Print Expected Product Attributes
    Log  ${pdp_product_name}
    Log  ${pdp_product_color}
    Log  ${pdp_product_fit}
    Log  ${pdp_product_size}
    Log  ${pdp_product_sleeve}
    Log  ${pdp_product_qty}
    # Read Actual Product Information in PDP page
    ${act_pdp_product_name} =    PDP_Actions.Get Product Name
    # Read Actual Product Information from title text in PDP page
    ${act_pdp_product_color} =    PDP_Actions.Get Selected Color
    ${act_pdp_product_fit} =    PDP_Actions.Get Selected Fit
    ${act_pdp_product_size} =    PDP_Actions.Get Selected Size
    ${act_pdp_product_sleeve} =    PDP_Actions.Get Selected Sleeve
    # Verification between preselected and label text
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_name.lower()}    ${pdp_product_name.lower()}
    Run Keyword And Continue On Failure    should contain   ${act_pdp_product_color.lower()}   ${pdp_product_color.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_fit.lower()}     ${pdp_product_fit.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_size.lower()}    ${pdp_product_size.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_sleeve.lower()}  ${pdp_product_sleeve.lower()}
    # Read Selected Product Information from swatch value in PDP page
    ${act_sel_swatch_product_color} =    PDP_Actions.Get Selected Color Swatch Data Name
    ${act_sel_swatch_product_fit} =    PDP_Actions.Get Selected Fit Swatch Description
    ${act_sel_swatch_product_size} =    PDP_Actions.Get Selected Size Swatch Description
    ${act_sel_swatch_product_sleeve} =    PDP_Actions.Get Selected Sleeve Swatch Description
    # Verification Title and selected swatch
    Run Keyword And Continue On Failure    should contain   ${act_pdp_product_color.lower()}   ${act_sel_swatch_product_color.lower()}
    Run Keyword And Continue On Failure    should be equal  ${act_pdp_product_fit.lower()}     ${act_sel_swatch_product_fit.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_size.lower()}    ${act_sel_swatch_product_size.lower()}
    Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_sleeve.lower()}  ${act_sel_swatch_product_sleeve.lower()}
    # QTY
    ${act_pdp_product_qty_textbox} =  Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'  PDP_Actions.Get Quantity From Text Box
    ${act_pdp_product_qty_label} =    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   PDP_Actions.Get Quantity From label
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_qty_textbox}  ${pdp_product_qty}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Should Be Equal  ${act_pdp_product_qty_label}  ${pdp_product_qty}


Validate Facility Service Variants Are Not Editable
    Common_Actions.Wait For Loading
    ${el1}=    PDP_Page.divProductColorSelectableVariantSwatch
    ${el2}=    PDP_Page.divProductSelectableFitSwatch
    ${el3}=    PDP_Page.divProductSelectableSizeSwatch
    ${el4}=    PDP_Page.divProductSelectableSleeveSwatch
    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el1}
    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el3}
    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el4}

##************** Employee Garments Page Valdiation ******************************
Validate Employee Garments Page Components Access Right
    [Arguments]    ${impx_ur1_acc_type}
    log  ${impx_ur1_acc_type}
    ${no_item} =  MyServiceContractGarments_Actions.Get Number Of Wearer Garments List Item
    ${el1}=    MyServiceContractGarments_Page.btnRemoveUniformWearerButton   # Contract Editor
    ${el2}=    MyServiceContractGarments_Page.btnAddUniformButton    # Contract and wearer editor
    ${el6}=    MyServiceContractGarments_Page.lnkBackToResult   # For all roles
    # Availability of components
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor'    Run Keyword And Continue On Failure    Page Should Contain Element    ${el1}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el2}
    Run Keyword And Continue On Failure    Page Should Contain Element    ${el6}
   # Should not display this componets
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-editor' or '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'    Run Keyword And Continue On Failure    Page Should Not Contain Element   ${el1}
    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el2}
    #Validation for each item
    : FOR    ${index}   IN RANGE    1    ${no_item} + 1
    \    ${el3}=    MyServiceContractGarments_Page.btnChangeProductByIndex  ${index}  # Contract and wearer editor
    \    ${el4}=    MyServiceContractGarments_Page.icnRemoveUniformByIndex  ${index}  # Contract and wearer editor
    \    ${el5}=    MyServiceContractGarments_Page.btnViewProductByIndex  ${index}   # Only for viewer
    \    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el3}
    \    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el4}
    \    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${el5}
    \    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el3}
    \    Run keyword if    '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el4}
    \    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor'   Run Keyword And Continue On Failure    Page Should Not Contain Element    ${el5}
    \    Log  ${index}


# Dashboard page: Mange My Tiles
Validate My Contract page Access Right
    [Arguments]    ${impx_ur1_acc_type}
    ${my_service_tile} =  Dashboard_Page.lnkMyService
    ${select_acc_modal} =  MyServicesContract_Page.mdlSelectAnAccount
    ${page_uri} =  set variable  cintasrentalsstorefront/contract-garments
    ${error_msg} =  set variable  We're sorry, you do not have the necessary rights to view this page
    # Validate avilability of My Service tile
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor' or '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element    ${my_service_tile}
    Run keyword unless    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor' or '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should not Contain Element    ${my_service_tile}
    # Validate contract-garments page access role
    Common_Actions.Open Page    ${page_uri}
    Run keyword unless    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor' or '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Common_Validation.Validate Global Message    ${error_msg}
    Run keyword if    '${impx_ur1_acc_type}'=='contract-editor' or '${impx_ur1_acc_type}'=='wearer-editor' or '${impx_ur1_acc_type}'=='wearer-viewer' or '${impx_ur1_acc_type}'=='contract-viewer'   Run Keyword And Continue On Failure    Page Should Contain Element   ${select_acc_modal}

#******************************** Add wearer details page ************************
Validate Wearer Name In Detail Page
    [Arguments]    ${first_name}  ${last_name}
    ${exp_weaer_name} =   Catenate  ${first_name}  ${last_name}
    ${act_weaer_name} =   MyServicesAddWearerDetails_Actions.Get Wearer Name
    run keyword and continue on failure  should be equal  ${exp_weaer_name.upper()}  ${act_weaer_name.upper()}

#---------------- Add Wearer madatory field value error message validation----------------------------------------------
Validate Add Wearer Mandatory Field Error Message
    [Arguments]    ${first_name}  ${last_name}   ${account}
    Run Keyword If    '${first_name}' != '${EMPTY}'   MyServicesAddWearer_Actions.Enter First Name  ${first_name}
    Run Keyword If    '${last_name}' != '${EMPTY}'   MyServicesAddWearer_Actions.Enter Last Name   ${last_name}
    Run Keyword If    '${account}' != '${EMPTY}'   MyServicesAddWearer_Actions.Click On Select Account
    Run Keyword If    '${account}' != '${EMPTY}'  ManageMyContract_Keywords.Select CST for Facility and Deep Clean   ${account}
    # Validation
    MyServicesAddWearer_Actions.Click On Continue Button
    Run Keyword If    '${first_name}' == '${EMPTY}'   run keyword and continue on failure    ManageMyContract_Validation.Validate Add Wearer First Name Error Message    First name cannot be empty.
    Run Keyword If    '${last_name}' == '${EMPTY}'   run keyword and continue on failure     ManageMyContract_Validation.Validate Add Wearer Last Name Error Message    Last name cannot be empty.
    Run Keyword If    '${account}' == '${EMPTY}'  run keyword and continue on failure       ManageMyContract_Validation.Validate Add Wearer Account Name Error Message   Account cannot be empty.


Validate Add Wearer First Name Error Message
    [Arguments]    ${fn_err_msg}
    ${act_err_msg} =   MyServicesAddWearer_Actions.Get First Name Error Message
    run keyword and continue on failure  should be equal  ${fn_err_msg.lower()}  ${act_err_msg.lower()}

Validate Add Wearer Last Name Error Message
    [Arguments]    ${ln_err_msg}
    ${act_err_msg} =   MyServicesAddWearer_Actions.Get Last Name Error Message
    run keyword and continue on failure  should be equal  ${ln_err_msg.lower()}  ${act_err_msg.lower()}

Validate Add Wearer Account Name Error Message
    [Arguments]    ${acc_err_msg}
    ${act_err_msg} =   MyServicesAddWearer_Actions.Get Get Account Error Message
    run keyword and continue on failure  should be equal  ${acc_err_msg.lower()}  ${act_err_msg.lower()}

Validate System Displays Selected Account
    [Arguments]    ${sold_tos}  ${soldTos_name}
    ${act_sold_tos} =   MyServicesAddWearer_Actions.Get Wearer SoldTo ID
    ${act_soldTos_name} =   MyServicesAddWearer_Actions.Get Wearer SoldTo Name
    run keyword and continue on failure  should be equal  ${sold_tos.lower()}  ${act_sold_tos.lower()}
    run keyword and continue on failure  should be equal  ${soldTos_name.lower()}   ${act_soldTos_name.lower()}

#--------------------------------------------------------------
Validate Wearer Mandatory Field Values Session
    [Arguments]    ${first_name}  ${last_name}  ${sold_tos}  ${soldTos_name}
    Common_Actions.Open Page    cintasrentalsstorefront/contract-garments/add-wearer
    ManageMyContract_Validation.Validate Inputted Wearer Mandatory Field Values     ${first_name}  ${last_name}  ${sold_tos}  ${soldTos_name}
    Common_Actions.Open Page    cintasrentalsstorefront/contract-garments
    Common_Actions.Open Page    cintasrentalsstorefront/contract-garments/add-wearer
    ManageMyContract_Validation.Validate Inputted Wearer Mandatory Field Values   ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}

Validate Wearer Modify Account Functionality
    [Arguments]    ${sold_to}
    ${in_no_pd_item} =  BuiltIn.Set Variable  0
    Common_Actions.Open Page    cintasrentalsstorefront/contract-garments/add-wearer
    ManageMyContract_Keywords.Modify Account From Add Wearer Details Page  ${sold_to}
    MyServicesAddWearer_Actions.Click On Continue Button
    run keyword and continue on failure  ManageMyContract_Validation.Validate Number Of Wearer Garments List Item   ${in_no_pd_item}


Validate Inputted Wearer Mandatory Field Values
    [Arguments]    ${first_name}  ${last_name}  ${sold_tos}  ${soldTos_name}
    ${act_first_name} =  MyServicesAddWearer_Actions.Get First Name
    ${act_last_name} =   MyServicesAddWearer_Actions.Get Last Name
    ${act_sold_tos} =   MyServicesAddWearer_Actions.Get Wearer SoldTo ID
    ${act_soldTos_name} =  MyServicesAddWearer_Actions.Get Wearer SoldTo Name
    run keyword and continue on failure  should be equal  ${first_name.lower()}  ${act_first_name.lower()}
    run keyword and continue on failure  should be equal  ${last_name.lower()}  ${act_last_name.lower()}
    run keyword and continue on failure  should be equal  ${sold_tos.lower()}  ${act_sold_tos.lower()}
    Run keyword unless  '${soldTos_name}' == '${EMPTY}'  run keyword and continue on failure  should be equal  ${soldTos_name.lower()}   ${act_soldTos_name.lower()}

#******************************** Add wearer Confirmation page ************************
Validate Wearer Name In Confirmation Page
    [Arguments]    ${first_name}  ${last_name}
    ${act_first_name} =   MyServicesAddWearerConfirm_Actions.Get Wearer First Name
    ${act_last_name} =    MyServicesAddWearerConfirm_Actions.Get Wearer Last Name
    #Validation
    run keyword and continue on failure  should be equal  ${first_name.upper()}  ${act_first_name.upper()}
    run keyword and continue on failure  should be equal  ${last_name.upper()}   ${act_last_name.upper()}

Validate Wearer Optinal Info In Confirmation Page
    [Arguments]  ${email}  ${phone_number}  ${emp_id}  ${comment}
    Log  ${email}
    Log  ${phone_number}
    Log  ${emp_id}
    Log  ${comment}
    # Optional Field
    ${act_email}=  Run keyword unless  '${email}' == '${EMPTY}'   MyServicesAddWearerConfirm_Actions.Get Wearer Email Address
    ${act_phone_number}=  Run keyword unless  '${phone_number}' == '${EMPTY}'  MyServicesAddWearerConfirm_Actions.Get Wearer Phone Number
    ${act_emp_id}=  Run keyword unless  '${emp_id}' == '${EMPTY}'   MyServicesAddWearerConfirm_Actions.Get Wearer Employee ID
    ${act_comment}=  Run keyword unless  '${comment}' == '${EMPTY}'  MyServicesAddWearerConfirm_Actions.Get Wearer Comment
    # Validate Optional Field
    Run keyword unless  '${email}' == '${EMPTY}'  run keyword and continue on failure  should be equal   ${email.upper()}  ${act_email.upper()}
    Run keyword unless  '${phone_number}' == '${EMPTY}'  run keyword and continue on failure  should be equal  ${phone_number}  ${act_phone_number}
    Run keyword unless  '${emp_id}' == '${EMPTY}'   run keyword and continue on failure  should be equal     ${emp_id.upper()}    ${act_emp_id.upper()}
    Run keyword unless  '${comment}' == '${EMPTY}'  run keyword and continue on failure  should be equal     ${comment.upper()}   ${act_comment.upper()}

Validate Number Of Wearer Garments List Item
    [Arguments]    ${exp_no_item}
    log  ${exp_no_item}
    ${act_no_item} =  MyServiceContractGarments_Actions.Get Number Of Wearer Garments List Item
    run keyword and continue on failure  should be equal  ${exp_no_item}  ${act_no_item}

#---------------- Valdiation for Searching and sorting ---------------------
# Searching

# Facet Filter Clearing
Validate Clear Search Filter Functionality
    [Arguments]    ${search_text}
    ${total_entry} =    MyServicesContract_Actions.Get Total View Entry
    ManageMyContract_Keywords.Search Wearer or Facility   ${search_text}
    # Read Facet Filter Text
    ${filter_text} =  MyServicesContract_Actions.Get My Service Filter Text
    run keyword and continue on failure  Should Contain   ${search_text}  ${filter_text}
    # Read total entry after filtering
    ${total_entry_after_filter} =    MyServicesContract_Actions.Get Total View Entry
    # Validate Filter Search Result Should be less than or equal to no search result
    run keyword and continue on failure  should be true  ${total_entry} >= ${total_entry_after_filter}
    # Remove Filter by clicking x button
    MyServicesContract_Actions.Click On Remove Filter Search X Button
    ${total_entry_after_filter_remove} =    MyServicesContract_Actions.Get Total View Entry
    run keyword and continue on failure  should be true  ${total_entry} == ${total_entry_after_filter_remove}


Validate Wearer or Facility Search Result
    [Arguments]    ${column_name}   ${search_text}   ${data_type}
    Run Keyword If    '${data_type}' == 'TEXT'    ManageMyContract_Validation.Validate Wearer or Facility Text Search Result  ${column_name}   ${search_text}
    Run Keyword If    '${data_type}' == 'NUMBER'    ManageMyContract_Validation.Validate Wearer or Facility Number Search Result   ${column_name}   ${search_text}

Validate Wearer or Facility Text Search Result
    [Arguments]    ${column_name}   ${search_text}
    @{filter_list} =    ManageMyContract_Keywords.Get All Wearer or Facility Column Values    ${column_name}
    @{filter_list_lower} =   convert_list_to_lowercase    ${filter_list}
    ${search_text_lower} =   Convert To Lowercase    ${search_text}
    : FOR    ${sr}    IN    @{filter_list_lower}
    \    run keyword and continue on failure    should contain    ${sr}    ${search_text_lower}    msg=Error - '${sr}' - did not contain text '${search_text_lower}'

Validate Wearer or Facility Number Search Result
    [Arguments]    ${column_name}   ${search_text}
    @{cntr_list} =    ManageMyContract_Keywords.Get All Wearer or Facility Column Values    ${column_name}
    : FOR    ${sr}    IN    @{cntr_list}
    \    run keyword and continue on failure    should contain    ${sr}    ${search_text}    msg=Error - '${sr}' - did not contain text '${search_text}'

Validate No Record for Wearer or Facility
    [Arguments]    ${service_type}
    ${service_type}=  Convert To Uppercase  ${service_type}
    Log    ${service_type}
    ${emp_no_record_msg} =   set variable   We're sorry, there is no solution contract or garments available for this customer.
    ${fs_no_record_msg} =   set variable   We're sorry, there is no facility service available for this customer.
    Run Keyword If    '${service_type}' == 'UNIFORM'    Validate Wearer or Facility No Record Message  ${emp_no_record_msg}
    Run Keyword If    '${service_type}' == 'FACILITY'   Validate Wearer or Facility No Record Message  ${fs_no_record_msg}


#**********************************************************************************
# Sorting
Validate Sort Asc And Dec For Wearer or Facility
    [Arguments]    ${column_name}
    @{actual_list} =    ManageMyContract_Keywords.Get All Wearer or Facility Column Values    ${column_name}
    ManageMyContract_Keywords.Sort Wearer or Facility By Asc    ${column_name}
    @{actual_list_asc} =    ManageMyContract_Keywords.Get All Wearer or Facility Column Values  ${column_name}
    @{expected_list_asc} =    Copy list    ${actual_list}
    Sort list    ${expected_list_asc}
    Log Many     @{expected_list_asc}
    run keyword and continue on failure    Lists should be equal    ${expected_list_asc}    ${actual_list_asc}
    # Click Search to return to page 1
    ManageMyContract_Keywords.Sort Wearer or Facility By Dsc    ${column_name}
    @{actual_list_dsc} =    ManageMyContract_Keywords.Get All Wearer or Facility Column Values    ${column_name}
    @{expected_list_dsc} =    Copy list    ${actual_list}
    Sort list    ${expected_list_dsc}
    Reverse List    ${expected_list_dsc}
    Log Many     @{expected_list_dsc}
    run keyword and continue on failure    Lists should be equal    ${expected_list_dsc}    ${actual_list_dsc}

Validate Wearer or Facility No Record Message
    [Arguments]    ${exp_msg}
    ${act_msg} =  MyServicesContract_Actions.Get My Service No Search Result Message
    run keyword and continue on failure  should be equal  ${exp_msg}  ${act_msg}  	ignore_case=True

#------------------------ CHANGE ACCOUNT in Garment contract, facility contract, PDP or PLP pages ---------------------------------------
Validate Change Account From PDP or PLP page
    [Arguments]    ${wf_select_account}   ${in_service_tile}   ${in_acc_number}
    ${pdp_or_plp_page_locator} =  PLP_Page.lnkChangeAccount
    Run Keyword If   '${wf_select_account}' == 'yes'  Page Should Contain Element   ${pdp_or_plp_page_locator}
    ...  ELSE  Page Should Not Contain Element  ${pdp_or_plp_page_locator}
    Run Keyword If   '${wf_select_account}' == 'yes'  ManageMyContract_Keywords.Change Account From PDP or PLP page  ${in_acc_number}  ${in_acc_number}
    Common_Actions.Wait For Loading
    ${page_url} =  get location
    Run Keyword If    '${in_service_tile}' == 'FACILITY' and '${wf_select_account}' == 'yes'  Run Keyword And Continue On Failure  should contain  ${page_url}  cintasrentalsstorefront/facility-services-contract
    Run Keyword If    '${in_service_tile}' == 'UNIFORM' and '${wf_select_account}' == 'yes'  Run Keyword And Continue On Failure  should contain   ${page_url}  cintasrentalsstorefront/contract-garments

Validate Change Account From Contract or Garment Details Page
    [Arguments]    ${wf_select_account}   ${in_service_tile}
    ${mc_or_gd_page_locator} =  MyServicesContract_Page.lnkChangeAccount
    Run Keyword If   '${wf_select_account}' == 'yes'  Page Should Contain Element   ${mc_or_gd_page_locator}
    ...  ELSE  Page Should Not Contain Element  ${mc_or_gd_page_locator}
    Run Keyword If   '${wf_select_account}' == 'yes'   ManageMyContract_Keywords.Chagne Account from Contract or Garment Details Page  ${in_acc_number}   ${in_acc_number}
    Common_Actions.Wait For Loading
    ${page_url} =  get location
    Run Keyword If    '${in_service_tile}' == 'FACILITY' and '${wf_select_account}' == 'yes'  Run Keyword And Continue On Failure  should contain  ${page_url}  cintasrentalsstorefront/facility-services-contract
    Run Keyword If    '${in_service_tile}' == 'UNIFORM' and '${wf_select_account}' == 'yes'  Run Keyword And Continue On Failure  should contain   ${page_url}  cintasrentalsstorefront/contract-garments

Validate Change Account For Contract
    [Arguments]    ${page_location}  ${acc_info}
    [Documentation]   ${page_location}:  should be: PDP or PLP or CONTRACT (e.g., garment or facility contract page) or DETAILS (garment details page)
    log  ${page_location}
    Run Keyword If    '${page_location}' == 'PDP' or '${page_location}' == 'PLP'  Validate Change Account From PDP or PLP page   ${wf_select_account}   ${in_service_tile}   ${in_change_acc}
    Run Keyword If    '${page_location}' == 'CONTRACT' or '${page_location}' == 'DETAILS'  Validate Change Account From Contract or Garment Details Page     ${wf_select_account}   ${in_service_tile}   ${in_change_acc}
    run keyword unless  '${acc_info}'=='${EMPTY}'  ManageMyContract_Validation.Valdiate Selected Contract Account Address  ${acc_info}

Valdiate Selected Contract Account Address
    [Arguments]    ${acc_address}
    ${act_acc_address} =  MyServicesContract_Actions.Get Selected Contract Account Address
    Run Keyword And Continue On Failure  should contain  ${act_acc_address}  ${acc_address}
