import 'dart:convert';
class HttpHelper{
  static const String _baseUrl= 'https://you-api-base-url.com';

  static get http => null;
  // Helper methode to make Get request
  static Future<Map<String, dynamic>> get (String endpoint)async {
    final response= await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }
// Helper methode to make Post request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data)async {
    final response= await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      heaers:{'Content-Type':'application/json'},
      body:json.encode(data),
    );
    return _handleResponse(response);
  }
  // Helper methode to make Put request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data)async {
    final response= await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      heaers:{'Content-Type':'application/json'},
      body:json.encode(data),
    );
    return _handleResponse(response);
  }
  // Helper methode to make Delete request
  static Future<Map<String, dynamic>> delete(String endpoint, dynamic data)async {
    final response= await http.delete(
        Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Handle the Http response

  static Future<Map<String, dynamic>> _handleResponse(response) {
    if (response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }



}