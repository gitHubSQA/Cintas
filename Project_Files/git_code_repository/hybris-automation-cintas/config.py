import os


def get_root_directory():
    root_dir = os.path.dirname(os.path.dirname(__file__))
    return root_dir
