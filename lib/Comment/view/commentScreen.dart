import 'package:flutter/material.dart';
import 'package:jsonparsing/Comment/provider/comment_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  Commentprovider? pt;
  Commentprovider? pf;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Commentprovider>(context,listen: false).Commentjsondata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Commentprovider>(context, listen: true);
    pf = Provider.of<Commentprovider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Comment data"),
            backgroundColor: Colors.pink,
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    child: Icon(Icons.dataset),
                    onTap: () {
                      pf!.Commentjsondata();
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
                                "total :- ${pt!.showList[index].total}",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade400
                      ),
                    );
                  },
                  itemCount: pt!.showList.length,
                ))
          ]),
        ));
  }
}
