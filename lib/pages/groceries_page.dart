import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';

class GroceriesPage extends StatelessWidget {
  const GroceriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final groceryItem = groceryItems[index];
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
        },
      ),
    );
  }
}
