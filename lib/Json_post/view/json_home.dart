import 'package:flutter/material.dart';
import 'package:jsonparsing/Json_post/provider/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Post_Screen extends StatefulWidget {
  const Post_Screen({Key? key}) : super(key: key);

  @override
  State<Post_Screen> createState() => _Post_ScreenState();
}

Post_provider? pt;
Post_provider? pf;

class _Post_ScreenState extends State<Post_Screen> {
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Post_provider>(context, listen: true);
    pf = Provider.of<Post_provider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text(
            "Post Data",
            style: TextStyle(color: Colors.white),
          ),
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
          backgroundColor: Colors.indigo),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 33.h,
              width: 100.w,
              margin: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "userId:-${pt!.jsonList[index]['userId']}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Id:-${pt!.jsonList[index]['id']}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "title:-${pt!.jsonList[index]['title']}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "body:-${pt!.jsonList[index]['body']}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: pt!.changeIndex(),
              ),
            );
          },
          itemCount: pt!.jsonList.length,
        ))
      ]),
    ));
  }
}
