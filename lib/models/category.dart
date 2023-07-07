import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_categories.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class Category {
  const Category(
    this.title,
    this.color,
  );

  final String title;
  final Color? color;

  Category.fromTitle(
    this.title,
  ) : color = categories.entries
            .firstWhere((e) => e.value.title == title)
            .value
            .color;

  Map<String, Object> toJson() {
    Map<String, Object> map = {};
    map['title'] = title;
    map['color'] = color.toString();
    return map;
  }
}
