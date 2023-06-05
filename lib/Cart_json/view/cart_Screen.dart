import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  cartProvider? providerT;
  cartProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<cartProvider>(context, listen: false);
    providerT = Provider.of<cartProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Cart Data"),
        backgroundColor: Colors.brown,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                child: Icon(Icons.dataset),
                onTap: () {
                  providerF!.cartjsonParsing();
                },
              ))
        ],
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 30.h,
              width: 100.w,
              margin: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "id :- ${providerT!.showcartdata[index].id}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "userId :- ${providerT!.showcartdata[index].userId}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "date :- ${providerT!.showcartdata[index].date}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "__v :- ${providerT!.showcartdata[index].v}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: providerT!.cartDataList[index].productlist!
                            .map((e) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Product ID : ${e.productId}",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "Quantity : ${e.quantity}",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList()),
                  ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: providerT!.Changeindex(),
              ),
            );
          },
          itemCount: providerT!.cartDataList.length,
        ))
      ]),
    ));
  }
}
