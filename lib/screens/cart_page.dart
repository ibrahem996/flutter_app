// lib/screens/cart_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  cart.items[index].imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(cart.items[index].name, style: Theme.of(context).textTheme.bodyLarge),
                subtitle: Text('R\$ ${cart.items[index].price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyLarge),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    cart.removeItem(cart.items[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
