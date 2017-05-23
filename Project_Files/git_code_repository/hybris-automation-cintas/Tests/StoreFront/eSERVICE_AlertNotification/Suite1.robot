*** Settings ***
Suite Setup       Directories.Declare Root OS Directory Project Name    ${PROJECT_NAME}
Test Teardown     Common_Keywords.End Web Test
Library           Selenium2Library
Library           String
Library           Collections
Resource          ../../../Resources/Web/StoreFront/FunctionalKeywords/Login_Keywords.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_AlertNotification/eSRVC_AlertNotification_Template.robot
Resource          ../../../Resources/Web/Common/Common_Keywords.robot
Resource          ../../../hybris-automation-shared/Resources/Common/Directories.robot
Resource          ../../../Resources/Web/StoreFront/Templates/eSRVC_ServiceRequest/eSRVC_CreateServiceRequest_Template.robot
Resource          ../../../Resources/Web/StoreFront/PageValidations/CreateNewRequest_Validations.robot
Resource          ../../../Resources/Web/StoreFront/PageActions/CreateNewRequest_Actions.robot
Resource          ../../../Resources/Web/StoreFront/FunctionalKeywords/ShopOutSide_Keywords.robot
Resource          ../../../Resources/Web/StoreFront/PageObjects/PLP_Page.robot
Resource          ../../../Resources/Web/StoreFront/PageObjects/ShoopRibbon_Page.robot

*** Variables ***
@{MONTHS}         Jan    Feb    Mar    Apr    May    Jun    Jul
...               Aug    Sep    Nov    Dec

*** Test Cases ***
TC_01: Test
    [Tags]    TEST1    INC
    Comment    Open Browser    https://ps-cintas-qa1.mtl.fra.hybris.com:9002/cintasrentalsstorefront/login    chrome
    Comment    Log    Anamul
    Open Browser    https://cintasqa.mycintas.com/cintasrentalsstorefront/login    chrome
    Comment    ${first_login}=    Set Variable    ${EMPTY}
    Comment    ${first_login}=    Convert To Lowercase    ${first_login}
    Comment    ${first_login}=    Set Variable If    '${first_login}'=='yes'    ${True}    ${False}
    Comment    log    ${first_login}
    Comment    ${impx_sr_creation_time}=    Set Variable    01.11.2016 11:38:09
    Comment    @{date_time}=    Split String    ${impx_sr_creation_time}
    Comment    @{Date}=    Split String    @{date_time}[0]    separator=.
    Comment    ${submitted_date}=    Catenate    SEPARATOR=/    @{Date}[1]    @{Date}[0]    @{Date}[2]
    Comment    Open Browser    http://nineelevenmemorialstg.prod.acquia-sites.com/join/individual/review    chrome
    Comment    Click Element    css=.option
    Comment    Click Element    id=edit-membership-review-membership-terms
    Comment    Open Browser    https://ps-cintas-qa1.mtl.fra.hybris.com:9002/cintasrentalsstorefront/login    chrome
    Comment    ${passed}=    Set Variable    ${False}
    Comment    Run Keyword If    ${passed}    Log    A
    ...    ELSE    Log    B
    Comment    ${date}=    Get Current Date    result_format=%d,%Y
    Comment    ${yy}    ${mm}    ${dd}    Get Time    year,month,day
    Comment    ${today}=    Catenate    Nov    ${dd},    ${yy}
    ${day_year}=    Get Current Date    result_format=%b
    Comment    ${abc}    Set Variable    500
    #    $${abc}
    ${day_year}=    Get Current Date    result_format=%b %d, %Y

TC_02: Test2
    [Tags]    TEST2    INC
    Comment    Open Browser    https://ps-cintas-qa1.mtl.fra.hybris.com:9002/cintasrentalsstorefront/login    chrome
    Comment    #anam
    Comment    : FOR    ${i}    IN RANGE    1    10
    Comment    \    log    ${i}
    Comment    \    ${passed} =    Run Keyword And Return Status    Should Be Equal    ${i}    ${3}
    Comment    \    Exit For Loop If    ${passed}
    ${i}    Set Variable    ${2}
    log    ${i+5}
    log    ${i}+5

TC_03: ShOOP
    [Tags]    efdds    INC
    Common_Keywords.Begin Web Test
    Login_Keywords.Login Customer    dev50003421@test.com    12341234
    Select ShOOP Category    Add Products & Services    Carhartt-Rental
    Click On Product Image    000341-5
    Click On Add To Agreement
    Comment    ${locator}    lnkChooseBar
    Comment    Click Element    ${locator}
    Comment    Pause Execution
    Comment    ${el1}=    lnkManageBar
    Comment    Click Element    ${el1}
    Comment    Pause Execution
    Comment    ${el2}=    lnkSelectAccountBar
    Comment    Click Element    ${el2}
    Comment    Pause Execution
    Comment    ${el3}=    lnkReviewRequestBar
    Comment    Click Element    ${el3}
    Comment    Click Element    css=button[data-facet-code='size']
    Comment    Pause Execution
    Comment    Click Element    css=button[data-facet-code='color']
    Comment    Comment    sleep    3s
    Comment    Comment    Select ShOOP Category    Add Products & Services    Mop-Services
    Comment    Pause Execution

