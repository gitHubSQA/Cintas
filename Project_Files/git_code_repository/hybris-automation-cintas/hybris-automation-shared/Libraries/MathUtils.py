import math
from random import randint


def roundup(x):
    return int(math.ceil(int(x) / 10.0)) * 10


def get_random_number_zero_padding(start_range, end_range):
    digits = int(math.log10(float(end_range))) + 1
    return str(randint(int(start_range), int(end_range))).rjust((int(digits)), "0")


def multiply_dollar_values(numb1, numb2):
    result = float(numb1) * float(numb2)
    result = format(result, '.2f')
    return result


def add_dollar_values(numb1, numb2):
    result = float(numb1) + float(numb2)
    result = format(result, '.2f')
    return result
