import datetime


def validate_date_in_range(test_date, start_date, end_date, date_format):
    """ Returns Boolean on whether or not date is between range

    :param testdate: date to evaluate
    :param start_date: start date to compare
    :param end_date: end date to compare
    :param date_format: date format dates being passed

    Examples:
    | validate_date_in_range | 06/30/2016 | 01/01/2016 | 10/15/2016 | %m/%d/%Y
    """
    start_date = datetime.datetime.strptime(start_date, date_format)
    end_date = datetime.datetime.strptime(end_date, date_format)
    test_date = datetime.datetime.strptime(test_date, date_format)
    if start_date <= test_date <= end_date:
        return True
    else:
        return False


def get_datetime_stamp():
    """ Returns a date time stamp variable
    """
    return '{:%y%m%d%H%M%S}'.format(datetime.datetime.now())


def sort_date_list(date_list, date_format):
    """ Returns a list of dates sorted from earliest to latest

    :param date_list: list of dates to sort
    :param date_format: date format dates being passed
    """
    dates = [datetime.datetime.strptime(ts, date_format) for ts in date_list]
    dates.sort()
    sorted_list = [datetime.datetime.strftime(ts, date_format) for ts in dates]
    return sorted_list


def increment_date_by_days(actual_date, date_format, inc_days):
    """ Returns a date with incremented by the number of days specified

    :param actual_date: date to increment
    :param date_format: date format dates being passed
    :param inc_days: number of days to add to the original date
    """
    inc_date = datetime.datetime.strptime(actual_date, date_format)
    inc_date = inc_date + datetime.timedelta(days=inc_days)
    inc_date = inc_date.strftime(date_format)
    return inc_date


def convert_date_format(actual_date, old_date_format, new_date_format):
    """ Returns a date in the new format specified
    """
    datetimeobject = datetime.datetime.strptime(actual_date, old_date_format)
    return datetimeobject.strftime(new_date_format)
