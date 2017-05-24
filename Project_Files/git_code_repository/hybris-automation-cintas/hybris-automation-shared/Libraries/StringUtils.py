import datetime
import re


def convert_email_to_random(email_address):
    dt = "{:%m%d%H%M%S}".format(datetime.datetime.now())
    email = email_address.replace('@', format(dt) + '@')
    email = email[-50:]
    email = email.lstrip('.')
    return email


def convert_list_to_uppercase(list_to_convert):
    return [element.upper() for element in list_to_convert]


def convert_list_to_lowercase(list_to_convert):
    return [element.lower() for element in list_to_convert]


def convert_dollar_amount(amount):
    value = amount.replace('$', '')
    value = value.replace('-', '')
    value = value.replace(',', '')
    value = value.strip()
    result = format(float(value), '.2f')
    return result


def get_float_from_string(text):
    text = text.replace(',', '')
    return re.findall("\d+\.\d+", text)[0]


def get_int_from_string(text):
    return re.findall("\d+", text)[0]
