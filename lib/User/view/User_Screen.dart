import 'package:flutter/material.dart';
import 'package:jsonparsing/User/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class User_Screen extends StatefulWidget {
  const User_Screen({Key? key}) : super(key: key);

  @override
  State<User_Screen> createState() => _User_ScreenState();
}

class _User_ScreenState extends State<User_Screen> {
  User_provider? pt;
  User_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<User_provider>(context, listen: true);
    pf = Provider.of<User_provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        backgroundColor: Colors.pink,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                child: Icon(Icons.dataset),
                onTap: () {
                  pf!.JsonPostString();
                },
              ))
        ],
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 70.h,
              width: 100.w,
              margin: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "id :- ${pt!.DataList[index].id}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "name :- ${pt!.DataList[index].name}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "username :- ${pt!.DataList[index].username}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "email :- ${pt!.DataList[index].email}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Row(
                            children: [
                              Text("address :- ",style: TextStyle(color: Colors.white, fontSize: 15),),
                              Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Text(
                                  "street :- ${pt!.DataList[index].addressModal!.street}",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90, top: 10),
                          child: Text(
                            "suite :- ${pt!.DataList[index].addressModal!.suite}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90, top: 10),
                          child: Text(
                            "city :- ${pt!.DataList[index].addressModal!.city}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90, top: 10),
                          child: Text(
                            "zipcode :- ${pt!.DataList[index].addressModal!.zipcode}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "lat :- ${pt!.DataList[index].addressModal!.geo!.lat}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "lng :- ${pt!.DataList[index].addressModal!.geo!.lng}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "phone :- ${pt!.DataList[index].phone}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "website :- ${pt!.DataList[index].website}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Row(
                            children: [
                              Text("company :- ",style: TextStyle(color: Colors.white, fontSize: 15),),
                              Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Text(
                                  "name :- ${pt!.DataList[index].companyModal!.name}",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90, top: 10),
                          child: Text(
                            "catchPhrase :- ${pt!.DataList[index].companyModal!.catchPhrase}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90, top: 10),
                          child: Text(
                            "bs :- ${pt!.DataList[index].companyModal!.bs}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: pt!.changeIndex(),
              ),
            );
          },
          itemCount: pt!.userList.length,
        ))
      ]),
    ));
  }
}
