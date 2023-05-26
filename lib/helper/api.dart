import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url,@required String? token}) async {
    Map<String, String> headers = {
      // 'Accept':'application/json',
      // 'Content-Type' :'application/x-www-form-urlencoded',
    };
    // headers.addAll({
    //   'Content-Type':'application/x-www-form-urlencoded'
    //   //OR 'Content-Type':'application/from-data'
    // });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer$token',
      });
     } // IF THERE IS A TOKEN (like in registration) PUT IT
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if (response.statusCode == 200) {
      //print('status is ok');
     // print('${jsonDecode(response.body)}');
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
    headers.addAll({
      'Content-Type':'application/x-www-form-urlencoded'
      //OR 'Content-Type':'application/from-data'
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer$token',
      });
    } // IF THERE IS A TOKEN (like in registration) PUT IT

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body: ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
        @required dynamic body,
        @required String? token}) async {
    Map<String, String> headers = {
      // 'Accept':'application/json',
      // 'Content-Type' :'application/x-www-form-urlencoded',
    };
    headers.addAll({
      'Content-Type':'application/x-www-form-urlencoded'
      //OR 'Content-Type':'application/from-data'
    });
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
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body: ${jsonDecode(response.body)}');
    }
  }
}
// // {
// title':'test',
// 'price':'13.5',
// 'description':'i dont know',
// 'image':'http://i.pravatar.cc',
// 'category':'electronic',
//}
