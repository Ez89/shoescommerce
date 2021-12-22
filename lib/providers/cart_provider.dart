import 'package:flutter/material.dart';

import 'package:shoescommerce/models/cart_model.dart';
import 'package:shoescommerce/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cart = [];

  List<CartModel> get cart => _cart;

  set cart(List<CartModel> cart) {
    _cart = cart;
    notifyListeners();
  }

  /* Function untuk pengecekan apakah barang
   sudah ada di card atau belum */
  productExist(ProductModel product) {
    if (_cart.indexWhere((element) => element.product!.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  //Function untuk menambahkan product
  addCart(ProductModel product) {
    // jika product sudah ada maka yang ditambahkan hanya jumlahnya
    if (productExist(product)) {
      int index =
          _cart.indexWhere((element) => element.product!.id == product.id);
      _cart[index].quantity++;
    } else {
      _cart.add(
        CartModel(
          id: _cart.length,
          product: product,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  // Function untuk menghapus cart produk
  removeProduct(int id) {
    _cart.removeAt(id);
    notifyListeners();
  }

  // Function untuk menambahkan jumlah product
  addQuantity(int id) {
    _cart[id].quantity++;
    notifyListeners();
  }

  /* Function untuk mengurangi jumlah product,
  dan akan cart akan dihapus ketika product -= 0 */
  minQuantity(int id) {
    _cart[id].quantity--;
    notifyListeners();
    if (_cart[id].quantity == 0) {
      _cart.removeAt(id);
    }
  }

  // Function untuk menghitung total product
  totalItem() {
    int total = 0;
    for (var item in _cart) {
      total += item.quantity;
    }
    return total;
  }

  // Function untuk menjumlahkan total harga product (harga dikalikan jumlah)
  totalPrice() {
    double total = 0;
    for (var item in _cart) {
      total += (item.quantity * item.product!.price);
    }
    return total;
  }
}
