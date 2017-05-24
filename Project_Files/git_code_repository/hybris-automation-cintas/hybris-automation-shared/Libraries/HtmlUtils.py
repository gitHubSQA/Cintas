from bs4 import BeautifulSoup


def get_node_value_by_name(html_resp, node_type, name_value):
    soup = BeautifulSoup(html_resp, 'html.parser')
    input_tag = soup.find(node_type, attrs={"name": name_value})
    return input_tag['value']
