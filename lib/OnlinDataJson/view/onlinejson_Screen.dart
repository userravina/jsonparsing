import 'package:flutter/material.dart';
import 'package:jsonparsing/OnlinDataJson/modal/onlinjson_modal.dart';
import 'package:jsonparsing/OnlinDataJson/provider/json_provider.dart';
import 'package:jsonparsing/utils/api_helper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ecommerceJson extends StatefulWidget {
  const ecommerceJson({Key? key}) : super(key: key);

  @override
  State<ecommerceJson> createState() => _ecommerceJsonState();
}

Api_helper api_helper = Api_helper();

class _ecommerceJsonState extends State<ecommerceJson> {

  Api_Provider? pt;
  Api_Provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Api_Provider>(context, listen: true);
    pf = Provider.of<Api_Provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(future: pt!.getdata(),builder: (context, snapshot) {
        if(snapshot.hasError)
          {
            return Text("${snapshot.hasError}");
          }
        else if(snapshot.hasData)
          {
            List<ProducteModal> l1 = snapshot.data!;
            pt!.l1=l1;
            return  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        "Women & men",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return  GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'detail',arguments: index,);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 20.h,
                                margin: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 15.h,
                                        margin: EdgeInsets.all(10),
                                        width: 37.w,
                                        decoration: BoxDecoration(
                                            color: pt!.colors[index],
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              height: 13.h,
                                              width: 25.w,
                                              child: Image.asset(
                                                "${pt!.Img[index].Img}",
                                                height: 3.h,
                                                width: 10.w,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text("₹ ${l1[index].price}"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: l1.length),
                ),
              ],
            );
          }
        return Center(child: CircularProgressIndicator(color: Colors.black,));
      },)
    ));
  }
}

