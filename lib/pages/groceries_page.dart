import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/pages/adding_item_page.dart';

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({super.key});

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {
  /// Push to adding item page
  void _pushAddingItemPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddingItemPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _pushAddingItemPage,
            icon: const Icon(Icons.add),
          ),
        ],
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
