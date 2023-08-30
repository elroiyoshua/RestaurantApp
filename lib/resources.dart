import 'dart:convert';

class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(name: json['name']);
  }
}

class MenuCategory {
  final List<MenuItem> items;

  MenuCategory({required this.items});

  factory MenuCategory.fromJsonList(List<dynamic> list) {
    final items = list.map((item) => MenuItem.fromJson(item)).toList();
    return MenuCategory(items: items);
  }
}

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final MenuCategory foods;
  final MenuCategory drinks;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.foods,
    required this.drinks,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    final foodsData = json['menus']['foods'] as List<dynamic>;
    final drinksData = json['menus']['drinks'] as List<dynamic>;

    final foods = MenuCategory.fromJsonList(foodsData.cast<Map<String, dynamic>>());
    final drinks = MenuCategory.fromJsonList(drinksData.cast<Map<String, dynamic>>());

    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: (json['rating'] as num).toDouble(),
      foods: foods,
      drinks: drinks,
    );
  }
}

List<Restaurant> parseResto(String? json) {
  if (json == null) {
    return [];
  }
  final List<dynamic> parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
