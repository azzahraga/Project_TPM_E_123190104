import 'dart:convert';

import 'package:furniture_app/models/Product.dart';
import 'package:http/http.dart' as http;

// Fetch our Products from API
Future<List<Product>> fetchProducts() async {
  const String apiUrl = "https://6293a12f089f87a57ac38c03.mockapi.io/products";

  // const String apiUrl = "https://629360c0089f87a57abf2768.mockapi.io/api/categories/product";
  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Product> products = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
