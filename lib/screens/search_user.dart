import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shot_app/model/usermodel.dart';
import 'package:shot_app/provider/my_provider.dart';
import 'package:shot_app/screens/admin_page.dart';
import 'package:shot_app/screens/search.dart';
import 'package:shot_app/widgets/search_screen_single_container.dart';

class SearchUser extends StatefulWidget {
  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    List<UserModel> myList = provider.getUserModelList;
    int myListLength = provider.getUserModelListLength;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => AdminPage(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(),
              );
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Color(0xfff8f8f8),
        title: Text(
          "Search Screen",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
          itemCount: myListLength,
          itemBuilder: (ctx, index) => SearchScreenSingleContainer(
            search: true,
            email: myList[index].userEmail,
            gender: myList[index].userGender,
            age: myList[index].userAge,
            image: myList[index].userImage,
            name: myList[index].userName,
          ),
        ),
      ),
    );
  }
}
