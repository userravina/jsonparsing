import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonparsing/Cart_json/modal/cart_modal.dart';

class cartProvider extends ChangeNotifier{

  List cartDataList = [];

  List<CartModal> showcartdata = [];

  Future<void> cartjsonParsing()
  async {
    String? CartString = await rootBundle.loadString('assets/json/Cart.json');
    cartDataList = jsonDecode(CartString);

    notifyListeners();
    showcartdata = cartDataList.map((e) => CartModal.fromjson(e)).toList();
    print(showcartdata);
  }

  List<dynamic> colors = [Color(0xffce5b51),Color(0xff34a16c),Color(0xff2c7971)];

  Color Changeindex()
  {
     Random random = Random();
     int index = random.nextInt(3);
     return colors[index];
  }
}