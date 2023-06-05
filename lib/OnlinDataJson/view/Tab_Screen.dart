import 'package:flutter/material.dart';
import 'package:jsonparsing/OnlinDataJson/view/onlinejson_Screen.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          actions: [
            Icon(Icons.search, color: Colors.black),
            SizedBox(width: 10,),
            InkWell(onTap: () {
              Navigator.pushNamed(context, 'cart',);
            },child: Icon(Icons.add_shopping_cart,color: Colors.black)),SizedBox(width: 10,),
          ],
          bottom: TabBar(

            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Jewellery",
              ),
              Tab(
                text: "Footwear",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ecommerceJson(),
          ecommerceJson(),
          ecommerceJson(),
        ]),
      ),
    ));
  }
}
