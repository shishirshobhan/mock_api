import 'package:http/http.dart' as http;
import 'dart:convert';

class Helper {

  Future updateData(String id, updatedName) async {
    await http
        .put(Uri.parse('https://62b7f6a903c36cb9b7c022e1.mockapi.io/api/v1/User/$id'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': updatedName,
      }),
    ).then((value) => print(value.statusCode));
  }

}