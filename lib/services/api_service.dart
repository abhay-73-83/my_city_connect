import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/service_model.dart';

class ApiService {
  // We use dummyjson products to simulate services
  static const String apiUrl = 'https://dummyjson.com/products?limit=20';

  Future<List<ServiceModel>> fetchServices() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> products = data['products'];
        
        return products.map((json) => ServiceModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load services. Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: Please check your internet connection.');
    }
  }
}
