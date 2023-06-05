import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonparsing/User/modal/user_modal.dart';

class User_provider extends ChangeNotifier {
  List<dynamic> userList = [];
  List<userModal> DataList=[];

  Future<void> JsonPostString() async {
    String jsonString = await rootBundle.loadString("assets/json/user.json");
    userList = jsonDecode(jsonString);

    notifyListeners();
    DataList = userList.map((e) => userModal.fromjson(e)).toList();
    print(userList);
  }
  List<dynamic> colors = [Colors.teal, Colors.pinkAccent, Colors.indigo, Colors.purple];

  Color changeIndex() {
    Random random = Random();
    int index = random.nextInt(4);
    return colors[index];
  }
}
