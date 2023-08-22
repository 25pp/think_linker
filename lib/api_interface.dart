import 'dart:convert';
import 'dart:developer';
import 'api_model.dart';
import 'package:http/http.dart' as http;


class ApiInterface {
  Future<ApiModel> getUsers() async {
    try {
      var url = Uri.parse("https://dummyjson.com/users/1");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return ApiModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      log("response log ${e.toString()}");
    }
    return ApiModel();
  }
}