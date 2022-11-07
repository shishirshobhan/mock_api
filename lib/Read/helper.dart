import 'package:http/http.dart' as http;
import 'dart:convert';
class Helper {
  Future<List> getData() async {
    var url =
    Uri.parse('https://62b7f6a903c36cb9b7c022e1.mockapi.io/api/v1/User');
   http.Response response= await http.get(url);
   return jsonDecode(response.body);
  }
}
