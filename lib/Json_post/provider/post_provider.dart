import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Post_provider extends ChangeNotifier {
  List<dynamic> jsonList = [];

  Future<void> JsonPostString() async {
    String jsonString = await rootBundle.loadString("assets/json/post.json");
    jsonList = jsonDecode(jsonString);

    notifyListeners();

    print(jsonList);
  }
  List<dynamic> colors = [Colors.red, Colors.green, Colors.indigo];

  Color changeIndex() {
    Random random = Random();
    int index = random.nextInt(3);
    return colors[index];
  }
}
