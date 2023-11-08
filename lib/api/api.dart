import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'late-women-grow.loca.lt';

Future<void> testRequest() async {
  Uri uri = 
    Uri(
      scheme: 'https', 
      host: url, 
      path: 'api/users/all'
    );
    var headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };
    
  try {
    http.Response response = await http.get(uri, headers: headers);
    print(response.body);
  } catch (e) {
    print("Error");
  }
}

Future<bool> loginUser(String email, String password) async {
  Uri uri = 
    Uri(
      scheme: 'https', 
      host: url, 
      path: 'api/users/login/'
    );
    var headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };
    var body = jsonEncode({
      "email": email,
      "password": password
    });

  try {
    http.Response response = await http.post(
      uri, 
      headers: headers, 
      body: body
    );
    // print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['email'] == email){
      return true; 
    } else {
      return false;
    }
  } catch (e) {
    // print("Error: $e");
    throw Exception('Error: $e');
  }
}