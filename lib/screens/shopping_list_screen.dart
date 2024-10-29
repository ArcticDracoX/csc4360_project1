import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<Map<String, dynamic>> _shoppingList = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem(String item) {
    setState(() {
      _shoppingList.add({'name': item, 'purchased': false});
    });
    _controller.clear();
  }

  void _clearPurchasedItems() {
    setState(() {
      _shoppingList.removeWhere((item) => item['purchased']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List', textAlign: TextAlign.center),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: _clearPurchasedItems,
            tooltip: 'Clear purchased items',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Add item to shopping list',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.add),
                ),
                onSubmitted: _addItem,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _shoppingList.length,
                itemBuilder: (context, index) {
                  final item = _shoppingList[index];
                  return Dismissible(
                    key: Key(item['name']),
                    background: Container(color: Colors.redAccent, child: const Icon(Icons.delete, color: Colors.white)),
                    onDismissed: (direction) {
                      setState(() {
                        _shoppingList.removeAt(index);
                      });
                    },
                    child: CheckboxListTile(
                      title: Text(item['name']),
                      value: item['purchased'],
                      onChanged: (bool? value) {
                        setState(() {
                          item['purchased'] = value!;
                        });
                      },
                      secondary: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _shoppingList.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
