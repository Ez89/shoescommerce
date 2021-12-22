// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:shoescommerce/models/product_model.dart';
import 'package:shoescommerce/services/product_services.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
