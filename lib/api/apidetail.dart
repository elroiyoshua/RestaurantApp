import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_restaurant/model/restaurantdetail.dart';

class ApiDetailService {
  Future<DetailRestaurant> getData(String id) async {
    final response = await http
        .get(Uri.parse('https://restaurant-api.dicoding.dev/detail/${id}'));
    if (response.statusCode == 200) {
      return DetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
