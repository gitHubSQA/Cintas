# --------------Test Setup------------------------------------#
SELENIUM_TIME_OUT = '120'
SELENIUM_SPEED = '0.45'
LOG_LEVEL = 'DEBUG'         # TRACE, DEBUG, INFO (default), WARN and NONE

# ----- Suite set-up and teardown data required for data preparation and cleanup---------------#
hAC_SELENIUM_TIME_OUT = '60'
hAC_SELENIUM_SPEED = '0.60'
hAC_LOG_LEVEL = 'TRACE'  # TRACE, DEBUG, INFO (default), WARN and NONE

# --------Variables--------
DEFAULT_TIMEOUT = '60s'

# --------Location where tests will run-----------
# TEST_LOCATION = 'LOCAL'
# TEST_LOCATION = 'SAUCELABS'
TEST_LOCATION = 'GRID'

# Hac credentials
HAC_USERNAME = 'admin'
HAC_PASSWORD = 'nimda'

# -----------------------Project Name and Environment-------------------#
PROJECT_NAME = 'hybris-automation-cintas'
AUT_LOCATION = 'UAT'         # UAT, QA1, QA2, DEV, CINTAS_QA, CINTAS_PROD
BROWSER = 'chrome'          # chrome, ff, ie, opera, safari
DATA_SOURCE = 'TestDataPathhyb.py'   #'TestDataPath.py'

