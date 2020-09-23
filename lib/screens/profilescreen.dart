import 'package:flutter/material.dart';

import 'package:shot_app/screens/admin_page.dart';

class ProfileScreen extends StatefulWidget {
  final String name,
      email,
      gender,
      age,
      interest,
      somethingabout,
      image,
      major,
      whatforlooking;
  ProfileScreen({
    this.image,
    this.major,
    this.age,
    this.email,
    this.gender,
    this.name,
    this.interest,
    this.somethingabout,
    this.whatforlooking,
  });
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  Widget _buildContainerPart() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSingleContainer(
            endText: widget.name,
            startText: "Name",
          ),
          _buildSingleContainer(
            endText: widget.email,
            startText: "Email",
          ),
          _buildSingleContainer(
            endText: widget.gender,
            startText: "Gender",
          ),
          _buildSingleContainer(
            endText: widget.age,
            startText: "Age",
          ),
          _buildSingleContainer(
            endText: widget.interest,
            startText: "Interest",
          ),
          _buildSingleContainer(
            endText: widget.somethingabout,
            startText: "Something His About",
          ),
          _buildSingleContainer(
            endText: widget.major,
            startText: "Major",
          ),
          _buildSingleContainer(
            endText: widget.whatforlooking,
            startText: "What You For Looking",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              "User Detail",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: ListView(
            children: [
              Container(
                height: 710,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 65,
                            backgroundImage: NetworkImage(
                              widget.image,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 510,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              child: _buildContainerPart(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
