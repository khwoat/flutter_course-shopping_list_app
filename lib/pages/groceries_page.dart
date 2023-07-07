import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/pages/adding_item_page.dart';
import 'package:shopping_list_app/widgets/grocery_list_item.dart';

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({super.key});

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage>
    with SingleTickerProviderStateMixin {
  final List<GroceryItem> _groceryItems = [];

  /// Push to adding item page
  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const AddingItemPage(),
      ),
    );

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void removeItem(GroceryItem groceryItem) {
    setState(() {
      _groceryItems.remove(groceryItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: (_groceryItems.isNotEmpty)
          ? ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (context, index) {
                final groceryItem = _groceryItems[index];
                return Dismissible(
                  key: ValueKey(groceryItem.id),
                  onDismissed: (direction) {
                    removeItem(groceryItem);
                  },
                  child: GroceryListItem(
                    groceryItem: groceryItem,
                  ),
                );
              },
            )
          : Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Uh oh, nothing here. Let\'s create one!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
    );
  }
}
