import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {
      // 'Accept':'application/json',
      // 'Content-Type' :'application/x-www-form-urlencoded',
    };

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer$token',
      });
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    return jsonDecode(response.body);

  }
}
//'https://fakestoreapi.com/products'
// {
// 'title':'test',
// 'price':'13.5',
// 'description':'i dont know',
// 'image':'http://i.pravatar.cc',
// 'category':'electronic',
//}
