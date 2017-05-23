*** Settings ***
Library           Collections
Resource          ../../FunctionalKeywords/Login_Keywords.robot
Resource          ../../PageActions/Dashboard_Actions.robot
Resource          ../../../Common/Common_Keywords.robot
Resource          ../../../Common/Impex_Keywords.robot
Resource          ../../PageValidations/ShopOutSide_Validation.robot

*** Keywords ***
#-----------------------------------------------------------------------------------------------------------------
#-------------------------------------------- Main Template -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
Shop Out Program Template
    [Arguments]    ${tc_data}
    # Set test date for template
    eSRVC_ShopOutSide_Template.Set Template Test Data    ${tc_data}
    # Call User Request Impex If '${impx_ur_update}' == 'True'
    eSRVC_ShopOutSide_Template.Call Import Impex User Multiple Roles And Login Status    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}
    # Begin Test
    eSRVC_ShopOutSide_Template.Begin Test
    # Login to Front End
    eSRVC_ShopOutSide_Template.Login to Front End    ${in_customer_email}    ${in_customer_password}
    # check Menu content and category in PLP
    eSRVC_ShopOutSide_Template.Call Validate Shop Outside Top Nav Menu    ${vp_shoop_top_nav}
    # select product category
    eSRVC_ShopOutSide_Template.Call Select Category    ${wf_select_ctg}
    # Validate Shopt Tab
    eSRVC_ShopOutSide_Template.Call Validate Shoop Tab    ${vp_shoop_tab}
    # Validate Ribbon while you are in first time in PLP
    eSRVC_ShopOutSide_Template.Call Validate Ribbon in PLP    ${vp_Ribbon_plp}
    # Check no ribbon in PLP
    eSRVC_ShopOutSide_Template.Call Validate No Ribbon Exists    ${vp_no_ribbon_plp}
    # Open pdp Page
    eSRVC_ShopOutSide_Template.Call Click On Product Image    ${wf_open_pdp}
    #===============================    PDP Page    ====================
    # Validate Ribbon while you are in first time in PDP
    eSRVC_ShopOutSide_Template.Call Validate Ribbon in PDP    ${vp_ribbon_pdp}
    # Check no ribbon in PDP
    eSRVC_ShopOutSide_Template.Call Validate No Ribbon Exists    ${vp_no_ribbon_pdp}
    # Validate PdP components
    eSRVC_ShopOutSide_Template.Call Validate PDP Regular Components    ${vp_pdp_com}
    # Valdiate pdp regular components
    eSRVC_ShopOutSide_Template.Call Validate Product Attributes In PDP    ${vp_product_attr}
    # Add Product to agreement
    eSRVC_ShopOutSide_Template.Call Add Product To Agreement with Comment    ${wf_add_agmt}
    #============================    Manage page    ===========
    # Validate Ribbon while you are in manage
    eSRVC_ShopOutSide_Template.Call Validate Ribbon in Manage    ${vp_ribbon_mng}
    # Add product from manage page
    eSRVC_ShopOutSide_Template.Call Validate Add Product From Manage Page    ${vp_mng_add_pd}
    # Update product
    eSRVC_ShopOutSide_Template.Call Validate Update Product From Manage Page    ${vp_update_agmt}
    # Remove Product
    eSRVC_ShopOutSide_Template.Call Validate Remove Product From Manage Page    ${vp_remove_agmt}
    # Add product using top nav from manage page
    eSRVC_ShopOutSide_Template.Call Add Facility Product From Manage Page    ${wf_mng_add_pd3}
    # Continue from manage page
    eSRVC_ShopOutSide_Template.Call Click Continue Button    ${wf_mng_cont}
    #============================    Account page    ===========
    # Validate Ribbon while you are in manage
    eSRVC_ShopOutSide_Template.Call Validate Ribbon in Account    ${vp_riboon_acc}
    # Check Error Message
    eSRVC_ShopOutSide_Template.Call Validate Add Account Error Message    ${vp_error_msg}    # has some issue 2nd and 3rd product
    # Check add account for each product
    eSRVC_ShopOutSide_Template.Call Validate Add All Accounts For Each Product    ${vp_each_acc}
    #Check add account for all product
    eSRVC_ShopOutSide_Template.Call Validate Add Account For All Product    ${vp_all_acc}
    # Customize number of account for each producct
    # add different ST for each product
    eSRVC_ShopOutSide_Template.Call Add Diffeerent Account For Each Product    ${wf_acc_each_pd}
    # Continue from Select Account
    eSRVC_ShopOutSide_Template.Call Click On Continue Button    ${wf_acc_cont}
    #=============================    Request Review    ====================
    eSRVC_ShopOutSide_Template.Call Validate Ribbon in Review Request    ${vp_riboon_rew}
    # Validate product information in each page
    # CNTR-2346
    eSRVC_ShopOutSide_Template.Call Validate Product Account Number In Review Page    ${vp_acc_info}
    # Submit Shoop Request
    eSRVC_ShopOutSide_Template.Call Submit SHOOP Request
#************************************** END ****************************************************************
#-----------------------------------------------------------------------------------------------------------------
#----------------------------------------- Template Keywords -----------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------

Call Import Impex User multiple Roles and Login Status
    [Arguments]    ${impx_ur_update}    ${in_customer_email}    ${impx_ur_account_type}
    Run Keyword If    '${impx_ur_update}' == 'TRUE' or '${impx_ur_update}' == '1'    Impex_Keywords.Import Impex User multiple Roles and Login Status    ${in_customer_email}    ${impx_ur_account_type}    ${impx_first_login}

Begin Test
    Common_Keywords.Begin Web Test

Login to Front End
    [Arguments]    ${in_customer_email}    ${in_customer_password}
    Login_Keywords.Login Customer    ${in_customer_email}    ${in_customer_password}

Call Validate Shop Outside Top Nav Menu
    [Arguments]    ${vp_shoop_top_nav}
    ${vp_shoop_top_nav}=    Convert To Lowercase    ${vp_shoop_top_nav}
    Run Keyword If    '${vp_shoop_top_nav}' == 'yes'    ShopOutSide_Validation.Validate Shop Outside Top Nav Menu    ${ip_plp_url}    ${ip_garment_ctg}    ${ip_facility_ctg}    ${ip_deep_ctg}

Call Select Category
    [Arguments]    ${wf_select_ctg}
    ${wf_select_ctg}=    Convert To Lowercase    ${wf_select_ctg}
    Run Keyword If    '${wf_select_ctg}' == 'yes'    ShopOutSide_Keywords.Select ShOOP Category    Add Products & Services    ${ip_category}

Call Validate Shoop Tab
    [Arguments]    ${vp_shoop_tab}
    ${vp_shoop_tab}=    Convert To Lowercase    ${vp_shoop_tab}
    Run Keyword If    '${vp_shoop_tab}' == 'yes'    ShopOutSide_Validation.Validate Shoop Tab

Call Validate Ribbon in PLP
    [Arguments]    ${vp_Ribbon_plp}
    ${vp_Ribbon_plp}=    Convert To Lowercase    ${vp_Ribbon_plp}
    Run Keyword If    '${vp_Ribbon_plp}'=='yes'    Validate Ribbon Enable and Disable Status    enable    disable    disable    disable

Call Validate Ribbon in PDP
    [Arguments]    ${vp_ribbon_pdp}
    ${vp_ribbon_pdp}=    Convert To Lowercase    ${vp_ribbon_pdp}
    Run Keyword If    '${vp_ribbon_pdp}'=='yes'    Validate Ribbon Enable and Disable Status    enable    disable    disable    disable

Call Validate Ribbon in Manage
    [Arguments]    ${vp_ribbon_mng}
    ${vp_ribbon_mng}=    Convert To Lowercase    ${vp_ribbon_mng}
    Run Keyword If    '${vp_ribbon_mng}'=='yes'    Validate Ribbon Enable and Disable Status    enable    enable    disable    disable

Call Validate Ribbon in Account
    [Arguments]    ${vp_riboon_acc}
    ${vp_riboon_acc}=    Convert To Lowercase    ${vp_riboon_acc}
    Run Keyword If    '${vp_riboon_acc}'=='yes'    Validate Ribbon Enable and Disable Status    enable    enable    enable    disable

Call Validate No Ribbon Exists
    [Arguments]    ${vp_no_ribbon_plp}
    ${vp_no_ribbon_plp}=    Convert To Lowercase    ${vp_no_ribbon_plp}
    Run Keyword If    '${vp_no_ribbon_plp}'=='yes'    ShopOutSide_Validation.Validate No Ribbon Visible

Call Click On Product Image
    [Arguments]    ${wf_open_pdp}
    ${wf_open_pdp}=    Convert To Lowercase    ${wf_open_pdp}
    Run Keyword If    '${wf_open_pdp}'=='yes'    PLP_Actions.Click On Product Image    ${ip_product}

Call Validate PDP Regular Components
    [Arguments]    ${vp_pdp_com}
    ${vp_pdp_com}=    Convert To Lowercase    ${vp_pdp_com}
    Run Keyword If    '${vp_pdp_com}'=='yes'    ShopOutSide_Validation.Validate PDP Regular Components

Call Validate Product Attributes In PDP
    [Arguments]    ${vp_product_attr}
    ${vp_product_attr}=    Convert To Lowercase    ${vp_product_attr}
    Run Keyword If    '${vp_product_attr}'=='yes'    ShopOutSide_Validation.Validate Product Attributes In PDP    ${ip_pd_name}    ${ip_product}    ${ip_pd_color}

Call Add Product To Agreement with Comment
    [Arguments]    ${wf_add_agmt}
    ${wf_add_agmt}=    Convert To Lowercase    ${wf_add_agmt}
    Run Keyword If    '${wf_add_agmt}'=='yes'    ShopOutSide_Keywords.Add Product To Agreement with Comment    ${pdp_comment}

Call Validate Add Product From Manage Page
    [Arguments]    ${vp_mng_add_pd}
    ${vp_mng_add_pd}=    Convert To Lowercase    ${vp_mng_add_pd}
    Run Keyword If    '${vp_mng_add_pd}'=='yes'    ShopOutSide_Validation.Validate Add Product From Manage Page    ${ip_product2}

#Call Validate Update Product From Manage Page
#    [Arguments]    ${vp_update_agmt}
#    ${vp_update_agmt}=    Convert To Lowercase    ${vp_update_agmt}
#    Run keyword if    '${vp_update_agmt}'=='yes'    ShopOutSide_Validation.Validate Update Product From Manage Page    ${ip_product2_name}
#
#Call Validate Remove Product From Manage Page
#    [Arguments]    ${vp_remove_agmt}
#    ${vp_remove_agmt}=    Convert To Lowercase    ${vp_remove_agmt}
#    Run Keyword And Return If    '${vp_remove_agmt}'=='yes'    ShopOutSide_Validation.Validate Remove Product From Manage Page    ${ip_product2_name}

# Updating Tempalte

Call Validate Update Product From Manage Page
    [Arguments]    ${vp_update_agmt}
    ${vp_update_agmt}=    Convert To Lowercase    ${vp_update_agmt}
    Run keyword if    '${vp_update_agmt}'=='yes'    ShopOutSide_Validation.Validate Update Product From Manage Page By Index    ${ip_Index}

Call Validate Remove Product From Manage Page
    [Arguments]    ${vp_remove_agmt}
    ${vp_remove_agmt}=    Convert To Lowercase    ${vp_remove_agmt}
    Run Keyword And Return If    '${vp_remove_agmt}'=='yes'    ShopOutSide_Validation.Validate Remove Product From Manage Page By Index    ${ip_Index}

Call Add Facility Product From Manage Page
    [Arguments]    ${wf_mng_add_pd3}
    ${wf_mng_add_pd3}=    Convert To Lowercase    ${wf_mng_add_pd3}
    Run Keyword If    '${wf_mng_add_pd3}'=='yes'    ShopOutSide_Keywords.Add Facility Product From Manage Page    ${ip_product3}

Call Click Continue Button
    [Arguments]    ${wf_mng_cont}
    ${wf_mng_cont}=    Convert To Lowercase    ${wf_mng_cont}
    Run Keyword If    '${wf_mng_cont}'=='yes'    ShoopManageProduct_Actions.Click Continue Button

Call Validate Add Account Error Message
    [Arguments]    ${vp_error_msg}
    ${vp_error_msg}=    Convert To Lowercase    ${vp_error_msg}
    Run Keyword If    '${vp_error_msg}'=='yes'    ShopOutSide_Validation.Validate Add Account Error Message

Call Validate Add All Accounts For Each Product
    [Arguments]    ${vp_each_acc}
    ${vp_each_acc}=    Convert To Lowercase    ${vp_each_acc}
    run keyword if    '${vp_each_acc}'=='yes'    ShopOutSide_Validation.Validate Add All Accounts for Each Product

Call Validate Add Account For All Product
    [Arguments]    ${vp_all_acc}
    ${vp_all_acc}=    Convert To Lowercase    ${vp_all_acc}
    Run Keyword If    '${vp_all_acc}'=='yes'    ShopOutSide_Validation.Validate Add Account For All Product

Call Click On Continue Button
    [Arguments]    ${wf_acc_cont}
    ${wf_acc_cont}=    Convert To Lowercase    ${wf_acc_cont}
    Run Keyword If    '${wf_acc_cont}'=='yes'    ShoopSelectAccount_Actions.Click On Continue Button

Call Validate Ribbon in Review Request
    [Arguments]    ${vp_riboon_rew}
    ${vp_riboon_acc}=    Convert To Lowercase    ${vp_riboon_acc}
    Run Keyword If    '${vp_riboon_rew}'=='yes'    Validate Ribbon Enable and Disable Status    enable    enable    enable    enable

Call Submit SHOOP Request
    ${wf_rvw_sumit}=    Convert To Lowercase    ${wf_rvw_sumit}
    Run Keyword If    '${wf_rvw_sumit}'=='yes'    ShopOutSide_Keywords.Submit SHOOP Request

Call Add Diffeerent Account For Each Product
    [Arguments]    ${wf_acc_each_pd}
    Run Keyword If    '${wf_acc_each_pd}'=='yes'    ShopOutSide_Keywords.Add Diffeerent Account For Each Product    ${ip_product1_acc}    ${ip_product2_acc}    ${ip_product3_acc}

Call Validate Product Account Number In Review Page
    [Arguments]    ${vp_acc_info}
    Run Keyword If    '${vp_acc_info}'=='yes'    ShopOutSide_Validation.Validate Product Account Number In Review Page    ${ip_product1_acc}    ${ip_product2_acc}    ${ip_product3_acc}
#-----------------------------------------------------------------------------------------------------------------
#--------------------------------- Template Test Data ------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------

Set Template Test Data
    [Arguments]    ${tc_data}
    ${testcase_name} =    Pop From Dictionary    ${tc_data}    testcase_name    default=${EMPTY}
    Set Test Variable    ${testcase_name}
    ${testcase_description} =    Pop From Dictionary    ${tc_data}    testcase_description    default=${EMPTY}
    Set Test Variable    ${testcase_description}
    # impex for user update
    ${impx_ur_update} =    Pop From Dictionary    ${tc_data}    impx_ur_update    default=FALSE
    Set Test Variable    ${impx_ur_update}
    ${impx_ur_account_type} =    Pop From Dictionary    ${tc_data}    impx_ur_account_type    default=${EMPTY}
    Set Test Variable    ${impx_ur_account_type}
    # Set user login status
    ${impx_first_login}=    Set Variable    ${False}
    Set Test Variable    ${impx_first_login}
    # Email and Password
    ${in_customer_email} =    Pop From Dictionary    ${tc_data}    in_customer_email    default=${EMPTY}
    Set Test Variable    ${in_customer_email}
    ${in_customer_password} =    Pop From Dictionary    ${tc_data}    in_customer_password    default=${EMPTY}
    Set Test Variable    ${in_customer_password}
    # Validate Shoop Top Nav
    ${vp_shoop_top_nav}=    Pop From Dictionary    ${tc_data}    vp_shoop_top_nav    default=${EMPTY}
    Set Test Variable    ${vp_shoop_top_nav}
    # PLP URL
    ${ip_plp_url}=    Pop From Dictionary    ${tc_data}    ip_plp_url    default=${EMPTY}
    Set Test Variable    ${ip_plp_url}
    # garment Category
    ${ip_garment_ctg}=    Pop From Dictionary    ${tc_data}    ip_garment_ctg    default=${EMPTY}
    Set Test Variable    ${ip_garment_ctg}
    # Facility Category
    ${ip_facility_ctg}=    Pop From Dictionary    ${tc_data}    ip_facility_ctg    default=${EMPTY}
    Set Test Variable    ${ip_facility_ctg}
    # Deep Clean Category
    ${ip_deep_ctg}=    Pop From Dictionary    ${tc_data}    ip_deep_ctg    default=${EMPTY}
    Set Test Variable    ${ip_deep_ctg}
    # Select categories
    ${wf_select_ctg}=    Pop From Dictionary    ${tc_data}    wf_select_ctg    default=${EMPTY}
    Set Test Variable    ${wf_select_ctg}
    # categories name
    ${ip_category}=    Pop From Dictionary    ${tc_data}    ip_category    default=${EMPTY}
    Set Test Variable    ${ip_category}
    # Shoop Tab
    ${vp_shoop_tab}=    Pop From Dictionary    ${tc_data}    vp_shoop_tab    default=${EMPTY}
    Set Test Variable    ${vp_shoop_tab}
    # ribbon_plp
    ${vp_Ribbon_plp}=    Pop From Dictionary    ${tc_data}    vp_Ribbon_plp    default=${EMPTY}
    Set Test Variable    ${vp_Ribbon_plp}
    # ribbon pdp
    ${vp_ribbon_pdp}=    Pop From Dictionary    ${tc_data}    vp_ribbon_pdp    default=${EMPTY}
    Set Test Variable    ${vp_ribbon_pdp}
    # ribbon manage
    ${vp_ribbon_mng}=    Pop From Dictionary    ${tc_data}    vp_ribbon_mng    default=${EMPTY}
    Set Test Variable    ${vp_ribbon_mng}
    # ribbon account
    ${vp_riboon_acc}=    Pop From Dictionary    ${tc_data}    vp_riboon_acc    default=${EMPTY}
    Set Test Variable    ${vp_riboon_acc}
    # no ribbon
    ${vp_no_ribbon_plp}=    Pop From Dictionary    ${tc_data}    vp_no_ribbon_plp    default=${EMPTY}
    Set Test Variable    ${vp_no_ribbon_plp}
    # no ribbon
    ${vp_no_ribbon_pdp}=    Pop From Dictionary    ${tc_data}    vp_no_ribbon_pdp    default=${EMPTY}
    Set Test Variable    ${vp_no_ribbon_pdp}
    # Open product PDP
    ${wf_open_pdp}=    Pop From Dictionary    ${tc_data}    wf_open_pdp    default=${EMPTY}
    Set Test Variable    ${wf_open_pdp}
    # Product info
    ${ip_product}=    Pop From Dictionary    ${tc_data}    ip_product    default=${EMPTY}
    Set Test Variable    ${ip_product}
    # Product attributes
    ${vp_product_attr}=    Pop From Dictionary    ${tc_data}    vp_product_attr    default=${EMPTY}
    Set Test Variable    ${vp_product_attr}
    # Product Name
    ${ip_pd_name}=    Pop From Dictionary    ${tc_data}    ip_pd_name    default=${EMPTY}
    Set Test Variable    ${ip_pd_name}
    # Product Color
    ${ip_pd_color}=    Pop From Dictionary    ${tc_data}    ip_pd_color    default=${EMPTY}
    Set Test Variable    ${ip_pd_color}
    # PDP component
    ${vp_pdp_com}=    Pop From Dictionary    ${tc_data}    vp_pdp_com    default=${EMPTY}
    Set Test Variable    ${vp_pdp_com}
    # PDP add agreement
    ${wf_add_agmt}=    Pop From Dictionary    ${tc_data}    wf_add_agmt    default=${EMPTY}
    Set Test Variable    ${wf_add_agmt}
    # pdp Comment
    Set Test Variable    ${pdp_comment}    PDP Agreement Text
    # add product in manage page
    ${vp_mng_add_pd}=    Pop From Dictionary    ${tc_data}    vp_mng_add_pd    default=${EMPTY}
    Set Test Variable    ${vp_mng_add_pd}
    # 2nd Product style
    ${ip_product2}=    Pop From Dictionary    ${tc_data}    ip_product2    default=${EMPTY}
    Set Test Variable    ${ip_product2}
    # 2nd Product Name
    ${ip_product2_name}=    Pop From Dictionary    ${tc_data}    ip_product2_name    default=${EMPTY}
    Set Test Variable    ${ip_product2_name}
    # position of product in Manage page
    ${ip_Index}=    Pop From Dictionary    ${tc_data}    ip_Index    default=${EMPTY}
    Set Test Variable    ${ip_Index}
    # 3rd Product style
    ${ip_product3}=    Pop From Dictionary    ${tc_data}    ip_product3    default=${EMPTY}
    Set Test Variable    ${ip_product3}
    # Update agreement
    ${vp_update_agmt}=    Pop From Dictionary    ${tc_data}    vp_update_agmt    default=${EMPTY}
    Set Test Variable    ${vp_update_agmt}
    # Remove product from manage
    ${vp_remove_agmt}    Pop From Dictionary    ${tc_data}    vp_remove_agmt    default=${EMPTY}
    Set Test Variable    ${vp_remove_agmt}
    # Add 3rd Product
    ${wf_mng_add_pd3}=    Pop From Dictionary    ${tc_data}    wf_mng_add_pd3    default=${EMPTY}
    Set Test Variable    ${wf_mng_add_pd3}
    # Continue from manage
    ${wf_mng_cont}=    Pop From Dictionary    ${tc_data}    wf_mng_cont    default=${EMPTY}
    Set Test Variable    ${wf_mng_cont}
    # ===================    select Account Page    ==================
    # Acc error msg
    ${vp_error_msg}=    Pop From Dictionary    ${tc_data}    vp_error_msg    default=${EMPTY}
    Set Test Variable    ${vp_error_msg}
    # Each product acc
    ${vp_each_acc}=    Pop From Dictionary    ${tc_data}    vp_each_acc    default=${EMPTY}
    Set Test Variable    ${vp_each_acc}
    # all product acc
    ${vp_all_acc}=    Pop From Dictionary    ${tc_data}    vp_all_acc    default=${EMPTY}
    Set Test Variable    ${vp_all_acc}
    # Select Different Accounts
    ${wf_acc_each_pd}=    Pop From Dictionary    ${tc_data}    wf_acc_each_pd    default=${EMPTY}
    ${wf_acc_each_pd}=    Convert To Lowercase    ${wf_acc_each_pd}
    Set Test Variable    ${wf_acc_each_pd}
    # Product1 acc
    ${ip_product1_acc}=    Pop From Dictionary    ${tc_data}    ip_product1_acc    default=${EMPTY}
    Set Test Variable    ${ip_product1_acc}
    # Product2 acc
    ${ip_product2_acc}=    Pop From Dictionary    ${tc_data}    ip_product2_acc    default=${EMPTY}
    Set Test Variable    ${ip_product2_acc}
    # Product3 acc
    ${ip_product3_acc}=    Pop From Dictionary    ${tc_data}    ip_product3_acc    default=${EMPTY}
    Set Test Variable    ${ip_product3_acc}
    # Continue from acc page
    ${wf_acc_cont}=    Pop From Dictionary    ${tc_data}    wf_acc_cont    default=${EMPTY}
    Set Test Variable    ${wf_acc_cont}
    # ===================    Review Rrequest Page    ==================
    #ribbon request rivew
    ${vp_riboon_rew}=    Pop From Dictionary    ${tc_data}    vp_riboon_rew    default=${EMPTY}
    Set Test Variable    ${vp_riboon_rew}
    # validate account info
    ${vp_acc_info}=    Pop From Dictionary    ${tc_data}    vp_acc_info    default=${EMPTY}
    ${vp_acc_info}=    Convert To Lowercase    ${vp_acc_info}
    Set Test Variable    ${vp_acc_info}
    #ribbon request rivew
    ${wf_rvw_sumit}=    Pop From Dictionary    ${tc_data}    wf_rvw_sumit    default=${EMPTY}
    Set Test Variable    ${wf_rvw_sumit}


