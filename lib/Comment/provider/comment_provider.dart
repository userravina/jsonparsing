import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jsonparsing/Comment/modal/comment_modal.dart';
import 'package:jsonparsing/User/modal/user_modal.dart';

class Commentprovider extends ChangeNotifier{


  List<Comments>  showList=[];
  Future<void> Commentjsondata()
  async {
    String? commentjson =await rootBundle.loadString("assets/json/comments.json");
    List jsonList = jsonDecode(commentjson);
    print(jsonList);
    showList = jsonList.map((e) => Comments.fromjson(e)).toList();
    notifyListeners();
  }
}