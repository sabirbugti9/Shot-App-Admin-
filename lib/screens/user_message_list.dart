import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shot_app/model/chatmodel.dart';
import 'package:shot_app/provider/my_provider.dart';

import 'package:shot_app/screens/admin_page.dart';
import 'package:shot_app/screens/detail_user.dart';

class UserMessageList extends StatefulWidget {
  @override
  _UserMessageListState createState() => _UserMessageListState();
}

class _UserMessageListState extends State<UserMessageList> {
  Widget _buildSingleContainer(
      {Color color, String startText, String endText}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(
              endText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int myListLength = provider.getmessageLength;
    List<ChatModel> myList = provider.messageList;
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => AdminPage(),
          ),
        );
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xfff8f8f8),
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Color(0xfff8f8f8),
            title: Text(
              "Messages",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => DetailUser(),
                    ),
                  );
                });
              },
            ),
          ),
          body: ListView.builder(
            itemCount: myListLength,
            itemBuilder: (ctx, index) => _buildSingleContainer(
              endText: myList[index].message,
              startText: "Message",
            ),
          )),
    );
  }
}
