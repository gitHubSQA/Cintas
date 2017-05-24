import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning


def disable_request_warning():
    requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
