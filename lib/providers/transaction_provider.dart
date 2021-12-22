// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:shoescommerce/models/cart_model.dart';
import 'package:shoescommerce/services/transaction_service.dart';

class TransactonProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> cart, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, cart, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
