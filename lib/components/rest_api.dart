import 'package:dio/dio.dart';

var basic_url = 'http://52.79.233.120:8000/';
var dio = Dio();

Future test_api() async {
  final response = await dio.post(basic_url + 'test/', data: {'hihi': 'hihi'});
  print(response);
}

Future post_data({url, data}) async {
  final response = await dio.post(basic_url + url, data: data);
  return response.data;
}
