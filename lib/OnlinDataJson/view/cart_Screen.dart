import 'package:flutter/material.dart';
import 'package:jsonparsing/OnlinDataJson/modal/onlinjson_modal.dart';
import 'package:jsonparsing/OnlinDataJson/provider/json_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  Api_Provider? pt;
  Api_Provider? pf;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // Provider.of<Api_Provider>(context,listen: false).getdata();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<Api_Provider>(context, listen: false);
    pt = Provider.of<Api_Provider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${pt!.cartList.length}  Items In Cart",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pt!.cartList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 15.h,
                        width: 20.w,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(
                                height: 8.h,
                                width: 15.w,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                            AssetImage("${pt!.Img[index].Img}"),
                                        fit: BoxFit.fill))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 5, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 9.h,
                                    width: 50.w,
                                    child: Column(children: [
                                      Text(
                                        "${pt!.cartList[index].title}",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(alignment: Alignment.topLeft,
                                        child: Text(
                                          "₹${pt!.cartList[index].price}",
                                          style: TextStyle(fontSize: 12.5),
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                                SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                       pt!.delete(index);
                                    },
                                    icon: Icon(
                                      Icons.close_rounded,
                                      size: 20,
                                      color: Colors.black,
                                    )),
                                Spacer(),
                                // Row(
                                //   mainAxisSize: MainAxisSize.min,
                                //   children: [
                                //     IconButton(
                                //         onPressed: () {
                                //           // providerF!.decrease(index);
                                //         },
                                //         icon: Icon(
                                //           Icons.remove_circle_outline_outlined,
                                //           color: Colors.black,
                                //         )),
                                //     Container(
                                //         height: 18,
                                //         width: 18,
                                //         alignment: Alignment.center,
                                //         child: Text(
                                //           "{providerT!.cartlist[index].qa}",
                                //           style: TextStyle(
                                //               fontSize: 15,
                                //               color: Colors.black),
                                //         )),
                                //     IconButton(
                                //         onPressed: () {
                                //           // providerF!.increase(index);
                                //         },
                                //         icon: Icon(
                                //           Icons.add_circle_outline_outlined,
                                //           color: Colors.black,
                                //         )),
                                //   ],
                                // )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Total",
                //       style: TextStyle(fontSize: 20, color: Colors.black),
                //     ),
                //     Text("₹ ${pt!.cartList[0].price! * pt!.cartList[1].price!}.00",
                //         style: TextStyle(fontSize: 20, color: Colors.black))
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Divider(color: Colors.black),
                Row(
                  children: [
                    Text("Order instructions", style: TextStyle(fontSize: 15)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 70,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
