import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jyothi_labs_ecommerce/Model/products_model.dart';

class ProductsController extends ChangeNotifier {
  List<Products1>? _products;
  List<Products1>? get products => _products;

  void getProducts() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      var products1 = Products.fromJson(jsonDecode(response.body));
      _products = products1.products;
      _productCounts.addAll(List.generate(_products!.length, (i) => 0));
      notifyListeners();
    }
  }

  final List<int> _productCounts = [];
  List<int> get productCounts => _productCounts;

  int getTotalProductCount() {
    int total = 0;
    for (int count in _productCounts) {
      total += count;
    }
    return total;
  }

  void incrementCount(int count) {
    _productCounts[count]++;
    notifyListeners();
  }

  void decrementCount(int count) {
    if (_productCounts[count] > 0) {
      _productCounts[count]--;
      notifyListeners();
    }
  }
}
