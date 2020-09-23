import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shot_app/model/usermodel.dart';
import 'package:shot_app/provider/my_provider.dart';
import 'package:shot_app/widgets/search_screen_single_container.dart';

class Search extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    MyProvider providerProvider = Provider.of<MyProvider>(context);
    List<UserModel> searchCategory = providerProvider.searchUserList(query);

    return GridView.count(
      crossAxisCount: 1,
      crossAxisSpacing: 10,
      childAspectRatio: 3.0,
      mainAxisSpacing: 10,
      children: searchCategory
          .map(
            (e) => SearchScreenSingleContainer(
              image: e.userImage,
              name: e.userName,
              age: e.userAge,
              email: e.userEmail,
              gender: e.userGender,
              search: true,
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    MyProvider providerProvider = Provider.of<MyProvider>(context);
    List<UserModel> searchCategory = providerProvider.searchUserList(query);

    return GridView.count(
      crossAxisCount: 1,
      crossAxisSpacing: 10,
      childAspectRatio: 3.0,
      mainAxisSpacing: 10,
      children: searchCategory
          .map(
            (e) => SearchScreenSingleContainer(
              image: e.userImage,
              name: e.userName,
              age: e.userAge,
              email: e.userEmail,
              gender: e.userGender,
              search: true,
            ),
          )
          .toList(),
    );
  }
}
