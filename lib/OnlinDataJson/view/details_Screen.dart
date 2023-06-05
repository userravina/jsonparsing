import 'package:flutter/material.dart';
import 'package:jsonparsing/OnlinDataJson/modal/onlinjson_modal.dart';
import 'package:jsonparsing/OnlinDataJson/provider/json_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({Key? key}) : super(key: key);

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  Api_Provider? pt;
  Api_Provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Api_Provider>(context, listen: true);
    pf = Provider.of<Api_Provider>(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
          backgroundColor: pt!.colors[index],
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProducteModal> l1 = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 330,
                        width: double.infinity,
                        color: pt!.colors[index],
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              child: Image.asset(
                                "${pf!.Img[index].Img}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            color: Colors.grey[200]),
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.only(right: 280),
                              child: Text("Colors"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Color(0xff343f52))),
                                        child: Icon(
                                          Icons.circle,
                                          size: 30,
                                          color: pt!.colors[index],
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.circle,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.circle,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 10, right: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${l1[index].title}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 20,
                              width: double.infinity,
                              child: Text(
                                "₹ ${l1[index].price}",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.topCenter,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: pt!.colors[index]),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Icon(
                                              Icons.minimize,
                                              color: pt!.colors[index],
                                            )),
                                      ),
                                      SizedBox(width: 18),
                                      Text("1"),
                                      SizedBox(width: 18),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: pt!.colors[index]),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: pt!.colors[index]),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        alignment: Alignment.topCenter,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: pt!.colors[index]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add_shopping_cart,
                                            color: pt!.colors[index],
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    pf!.addList(index);
                                  },
                                  child: Ink(
                                    child: Container(
                                        height: 5.h,
                                        width: 75.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: pt!.colors[index],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            pf!.addList(index);
                                          },
                                          child: Text("Add To Cart",
                                              style: TextStyle(fontSize: 20)),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: pt!.colors[index],
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Text("");
              }
            },
            future: pt!.getdata(),
          )),
    );
  }
}
