import 'package:flutter/material.dart';
import 'package:shot_app/screens/admin_page.dart';
import 'package:shot_app/widgets/search_screen_single_container.dart';

class RemoveUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        backgroundColor: Color(0xfff8f8f8),
        title: Text(
          "Remove Screen",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: ListView(
          children: [
            SearchScreenSingleContainer(
              isRemove: true,
              search: false,
            ),
            SearchScreenSingleContainer(
              isRemove: true,
              search: false,
            ),
            SearchScreenSingleContainer(
              isRemove: true,
              search: false,
            ),
            SearchScreenSingleContainer(
              isRemove: true,
              search: false,
            ),
            SearchScreenSingleContainer(
              isRemove: true,
              search: false,
            ),
            SearchScreenSingleContainer(
              isRemove: true,
              search: false,
            ),
          ],
        ),
      ),
    );
  }
}
