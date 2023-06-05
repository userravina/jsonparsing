import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonparsing/OnlinDataJson/modal/onlinjson_modal.dart';
import 'package:jsonparsing/utils/api_helper.dart';

class Api_Provider extends ChangeNotifier {

  List<ProducteModal> Img = [
    ProducteModal(Img: "assets/images/e1.png"),
    ProducteModal(Img: "assets/images/e2.png"),
    ProducteModal(Img: "assets/images/e3.png"),
    ProducteModal(Img: "assets/images/e4.png"),
    ProducteModal(Img: "assets/images/e5.png"),
    ProducteModal(Img: "assets/images/e6.png"),
    ProducteModal(Img: "assets/images/e7.png"),
    ProducteModal(Img: "assets/images/e8.png"),
    ProducteModal(Img: "assets/images/e9.png"),
    ProducteModal(Img: "assets/images/e10.png"),
    ProducteModal(Img: "assets/images/e11.png"),
    ProducteModal(Img: "assets/images/e12.png"),
    ProducteModal(Img: "assets/images/e13.png"),
    ProducteModal(Img: "assets/images/e14.png"),
    ProducteModal(Img: "assets/images/e15.png"),
    ProducteModal(Img: "assets/images/e16.png"),
    ProducteModal(Img: "assets/images/e17.png"),
    ProducteModal(Img: "assets/images/e18.png"),
    ProducteModal(Img: "assets/images/e19.png"),
    ProducteModal(Img: "assets/images/20.png"),
  ];

  Future<List<ProducteModal>> getdata() async {
   Api_helper api_helper = Api_helper();
   return await api_helper.getdatajson();
  }

  List<dynamic> colors = [
    Color(0xff343f52),
    Color(0xffa8a4a6),
    Color(0xffab9177),
    Color(0xff282d41),
    Color(0xc599b4b1),
    Color(0xc599a5b4),
    Color(0xff859aa2),
    Color(0xffd19478),
    Colors.black38,
    Colors.brown.shade200,
    Color(0xff51d5e2),
    Colors.purple.shade300,
    Color(0xff686d26),
    Color(0xffb5b5b9),
    Color(0xff32154d),
    Color(0xff333335),
    Color(0xff1c2c45),
    Colors.white30,
    Color(0xffc62338),
    Color(0xff572c57),
  ];

  Color changeIndex() {
    Random random = Random();
    int index = random.nextInt(4);
    return colors[index];
  }

  // proccess cart

  List<ProducteModal> cartList=[];
  List<ProducteModal> l1=[];

  void addList(int index)
  {
    cartList.add(l1[index]);
    print(cartList.length);
    notifyListeners();
  }

  void delete(int index) {
    cartList.removeAt(index);
    notifyListeners();

  }
}
