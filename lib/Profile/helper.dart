import 'package:http/http.dart' as http ;

class Helper {

  Future dataDelete(String id) async {
    final response = await http
        .delete(Uri.parse('https://62b7f6a903c36cb9b7c022e1.mockapi.io/api/v1/User/$id'));
    print(response.statusCode);

    if (response.statusCode == 200) {
      print('DELETE COMPLETE');
    } else {
      print('Cannot Delete');
    }
  }

}