import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({
    super.key,
    required this.groceryItem,
  });

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 20,
        height: 20,
        color: groceryItem.category.color,
      ),
      title: Text(
        groceryItem.name,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
