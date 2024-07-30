// lib/models/cart_model.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'product.dart';

class CartModel extends ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  CartModel() {
    _loadFromPrefs();
  }

  void addItem(Product product) {
    _items.add(product);
    _saveToPrefs();
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    _saveToPrefs();
    notifyListeners();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? itemsString = prefs.getString('cart_items');
    if (itemsString != null) {
      List<dynamic> decoded = json.decode(itemsString);
      _items = decoded.map((item) => Product.fromMap(item)).toList();
      notifyListeners();
    }
  }

  void _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> itemsMap = _items.map((item) => item.toMap()).toList();
    prefs.setString('cart_items', json.encode(itemsMap));
  }
}
