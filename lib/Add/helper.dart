import 'package:http/http.dart' as http;
import 'dart:convert';

class Helper {

  Future addData(String newName) async {
    await http
        .post(Uri.parse('https://62b7f6a903c36cb9b7c022e1.mockapi.io/api/v1/User'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': newName,
      }),
    ).then((value) => print(value.statusCode));
  }


}