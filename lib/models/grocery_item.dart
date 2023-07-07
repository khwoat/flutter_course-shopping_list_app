import 'package:shopping_list_app/models/category.dart';

class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final Category category;

  GroceryItem.fromJson(this.id, this.category, dynamic json)
      : name = json['name'],
        quantity = json['quantity'];

  Map<String, Object> toPostJson() {
    Map<String, Object> map = {};
    map['name'] = name;
    map['quantity'] = quantity;
    map['category'] = category.title;
    return map;
  }
}
