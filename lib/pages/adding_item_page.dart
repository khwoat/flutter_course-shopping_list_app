import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_categories.dart';

class AddingItemPage extends StatelessWidget {
  const AddingItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Form(
          child: Column(
            children: [
              // Name input field
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length >= 50) {
                    return 'Must be between 1 and 50 characters!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Quantity input field and Categories dropdown
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text(
                          'Quantity',
                        ),
                      ),
                      initialValue: '1',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid, positive numbers!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      onChanged: (value) {},
                      items: categories.entries.map((category) {
                        return DropdownMenuItem(
                          value: category.value.title,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: category.value.color,
                              ),
                              const SizedBox(width: 5),
                              Text(category.value.title),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Reset and Add button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
