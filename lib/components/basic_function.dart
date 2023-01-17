dynamic str_to_list(str_data) {
  if (str_data.runtimeType != String) {
    return str_data;
  }
  return str_data.replaceAll('[', '').replaceAll(']', '').replaceAll("'", '').split(', ');
}
