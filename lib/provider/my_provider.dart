import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shot_app/model/chatmodel.dart';
import 'package:shot_app/model/usermodel.dart';

class MyProvider with ChangeNotifier {
  List<UserModel> userModelList = [];

  UserModel userModel;
  Future<void> getUserData() async {
    List<UserModel> newList = [];
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("User").get();
    userSnapShot.docs.forEach(
      (element) {
        userModel = UserModel(
          userId: element.data()["UserId"],
          userMajor: element.data()["UserMajor"],
          userAge: element.data()["UserAge"],
          userInterest: element.data()["UserInterest"],
          userSomeThing: element.data()["UserSomethingAbout"],
          userWhatAbout: element.data()["UserYouLooking"],
          userImage: element.data()["UserFacemaskPic"],
          userEmail: element.data()["UserEmail"],
          userGender: element.data()["UserGender"],
          userName: element.data()["UserName"],
        );
        newList.add(userModel);
      },
    );
    userModelList = newList;
    notifyListeners();
  }

  List<ChatModel> messageList = [];
  ChatModel message;

  Future<void> getChatData() async {
    List<ChatModel> newList = [];
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("Chats").get();
    userSnapShot.docs.forEach(
      (element) {
        message = ChatModel(message: element.data()["text"]);
        newList.add(message);
      },
    );
    messageList = newList;
    notifyListeners();
  }

  int get getmessageLength {
    return messageList.length;
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }

  int get getUserModelListLength {
    return userModelList.length;
  }

  List<UserModel> searchUserList(String query) {
    List<UserModel> searchShirt = userModelList.where((element) {
      return element.userName.toUpperCase().contains(query) ||
          element.userName.toLowerCase().contains(query) ||
          element.userEmail.toLowerCase().contains(query) ||
          element.userEmail.toUpperCase().contains(query);
    }).toList();
    return searchShirt;
  }
}
