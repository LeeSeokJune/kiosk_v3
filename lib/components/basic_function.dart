dynamic str_to_list(String str_data) {
  return str_data.replaceAll('[', '').replaceAll(']', '').replaceAll("'", '').split(', ');
}
