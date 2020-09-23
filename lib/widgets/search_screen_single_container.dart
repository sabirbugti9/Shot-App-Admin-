import 'package:flutter/material.dart';

class SearchScreenSingleContainer extends StatefulWidget {
  final bool isRemove;
  final bool search;
  final String image, name, email, gender,age;
  SearchScreenSingleContainer({
    this.isRemove,
    this.age,
    this.search,
    this.email,
    this.gender,
    this.image,
    this.name,
  });
  @override
  _SearchScreenSingleContainerState createState() =>
      _SearchScreenSingleContainerState();
}

TextStyle myStyle = TextStyle(fontSize: 18);

class _SearchScreenSingleContainerState
    extends State<SearchScreenSingleContainer> {
  double height, width;
  Widget _buildImage() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: height * 0.1,
      width: width * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.image),
        ),
      ),
    );
  }

  Widget _buildNameAndClosePart() {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
            style: myStyle,
          ),
          widget.search == false
              ? Container(
                  height: 30,
                  child: Image(
                    image: widget.isRemove == false
                        ? AssetImage("images/disable.png")
                        : AssetImage("images/remove.png"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildColorAndSizePart() {
    return Container(
      width: width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.email,
            style: myStyle,
          ),
          Text(
            widget.gender,
            style: myStyle,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: height * 0.1 + 60,
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildImage(),
                Container(
                  height: height * 0.1,
                  width: width * 0.7,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildNameAndClosePart(),
                        Text(widget.age),
                        _buildColorAndSizePart(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
