import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Brain {
   getData(timeZone)async{
    String url = "https://timeapi.io/api/TimeZone/zone?timeZone=$timeZone";
    var data;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);

      }else {
        Fluttertoast.showToast(msg: jsonDecode(response.body));

      }
    } catch (e) {
        print(e);
    }
    return data;
  }
}