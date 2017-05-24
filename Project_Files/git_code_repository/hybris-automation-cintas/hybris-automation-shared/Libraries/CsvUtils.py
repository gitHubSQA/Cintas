import csv


def read_csv_file(filename):
    """ Returns a Dictionary of the entire csv file passed

    :param filename: path to the csv file to read.
    """
    f = open(filename, 'r')
    csvfile = csv.DictReader(f)
    f.close
    return [row for row in csvfile]


def get_row_in_csv_file(filename, key, value):
    """ Returns a Dictionary Row of the csv file passed

    :param filename: path and name of the csv file to read.
    :param key: column name used to find a specific row
    :param value: unique identifier from the key column
    """
    f = open(filename, 'r')
    csvfile = csv.DictReader(f)
    f.close
    for row in [row for row in csvfile]:
        if value == row.get(key):
            return row
    return None
