import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shot_app/provider/my_provider.dart';
import 'package:shot_app/screens/add_user.dart';
import 'package:shot_app/screens/detail_user.dart';
import 'package:shot_app/screens/remove_user.dart';
import 'package:shot_app/screens/search_user.dart';
import 'package:shot_app/screens/user_message_list.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  MyProvider provider;

  Widget _buildSingleContainer(
      {String name, String image, bool isCount, int total}) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Container(
            height: 186,
            child: Card(
              child: Center(
                child: Container(
                  height: 50,
                  child: isCount == false
                      ? Image(
                          image: AssetImage("images/$image.png"),
                        )
                      : Text(
                          total.toString(),
                          style: TextStyle(fontSize: 35),
                        ),
                ),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  int totalUser, totalChat;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);
    provider.getUserData();
    provider.getChatData();
    setState(() {
      totalChat = provider.getmessageLength;
      totalUser = provider.getUserModelListLength + 1;
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xfff8f8f8),
        title: Text(
          "Admin Page",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 25,
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 6.0 / 7.0,
          crossAxisSpacing: 20,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => SearchUser(),
                  ),
                );
              },
              child: _buildSingleContainer(
                name: "Search User",
                isCount: false,
                image: "search",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => AddUser(),
                  ),
                );
              },
              child: _buildSingleContainer(
                name: "Add User",
                isCount: false,
                image: "add",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => RemoveUser(),
                  ),
                );
              },
              child: _buildSingleContainer(
                name: "Total Users Chat",
                isCount: true,
                image: "message",
                total: totalChat,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => UserMessageList(),
                  ),
                );
              },
              child: _buildSingleContainer(
                name: "User Message Detail",
                isCount: false,
                image: "message",
              ),
            ),
            _buildSingleContainer(
              name: "Total User",
              isCount: true,
              total: totalUser,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => DetailUser(),
                  ),
                );
              },
              child: _buildSingleContainer(
                name: "Detail User",
                isCount: false,
                image: "detail",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
