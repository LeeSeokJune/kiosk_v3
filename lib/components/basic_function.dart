dynamic str_to_list(str_data) {
  if (str_data.runtimeType != String) {
    return str_data;
  }
  return str_data.replaceAll('[', '').replaceAll(']', '').replaceAll("'", '').split(', ');
}

dynamic list_to_str(list_data) {
  if (list_data.runtimeType != List) {
    return list_data;
  }
  return list_data.toString().replaceAll('[', '').replaceAll(']', '');
}
