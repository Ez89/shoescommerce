// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  Future<bool> checkout(
      String token, List<CartModel> cart, double totalPrice) async {
    var url = Uri.parse('$baseUrl/checkout');
    var header = {
      'Content-Type': 'aplication/json',
      'Authorization': token,
    };

    var body = jsonEncode(
      {
        'address': 'Dago Pakar',
        'items': cart
            .map(
              (cart) => {
                'id': cart.product!.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 10,
      },
    );
    var response = await http.post(
      url,
      headers: header,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Transaksi gagal');
    }
  }
}
