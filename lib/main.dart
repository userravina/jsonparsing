import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonparsing/Cart_json/provider/cart_provider.dart';
import 'package:jsonparsing/Cart_json/view/cart_Screen.dart';
import 'package:jsonparsing/Comment/provider/comment_provider.dart';
import 'package:jsonparsing/Comment/view/commentScreen.dart';
import 'package:jsonparsing/Json_post/provider/post_provider.dart';
import 'package:jsonparsing/Json_post/view/json_home.dart';
import 'package:jsonparsing/OnlinDataJson/provider/json_provider.dart';
import 'package:jsonparsing/OnlinDataJson/view/Tab_Screen.dart';
import 'package:jsonparsing/OnlinDataJson/view/cart_Screen.dart';
import 'package:jsonparsing/OnlinDataJson/view/details_Screen.dart';
import 'package:jsonparsing/OnlinDataJson/view/onlinejson_Screen.dart';
import 'package:jsonparsing/User/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
    builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Post_provider(),
          ),
          ChangeNotifierProvider(create: (context) => User_provider(),),
          ChangeNotifierProvider(create: (context) => cartProvider(),),
          ChangeNotifierProvider(create: (context) => Commentprovider(),),
          ChangeNotifierProvider(create: (context) => Api_Provider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            // '/': (context) => Post_Screen(),
            // '/': (context) => User_Screen(),
            // '/': (context) => CartScreen(),
            // '/':(context) => CommentScreen(),

            '/':(context) => Tabbar(),
            'detail':(context) => Detailscreen(),
            'cart':(context) => cart(),
          },
        ),
      );
    },
  ));
}
