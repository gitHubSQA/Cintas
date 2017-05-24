*** Settings ***
Library           ../../../config.py
Library           ../../Libraries/APIUtils.py
Library           ../../Libraries/EnvironmentUtils.py


*** Keywords ***
Declare Root Directory
    ${ROOT_DIR} =    get_root_directory
    Set Global Variable   ${INPUT_FILES}    ${ROOT_DIR}
    Run Keyword    disable_request_warning

Declare Root Directory Project Name
    [Arguments]    ${project_name}
    ${ROOT_DIR} =    get_root_directory
    ${ROOT_DIR} =    Catenate    SEPARATOR=    ${ROOT_DIR}    \\    ${project_name}
    Set Global Variable   ${INPUT_FILES}    ${ROOT_DIR}
    Run Keyword    disable_request_warning

Declare Root OS Directory Project Name
    [Arguments]    ${project_name}
    ${ROOT_DIR} =    get_root_directory
    ${OS_NAME} =     get_os_name
    Log    ${OS_NAME}
    ${seperator} =    Set Variable If    '${OS_NAME}' != 'nt'    /    \\
    ${ROOT_DIR} =    Catenate    SEPARATOR=    ${ROOT_DIR}    ${seperator}    ${project_name}
    Set Global Variable   ${INPUT_FILES}    ${ROOT_DIR}
    Run Keyword    disable_request_warning
