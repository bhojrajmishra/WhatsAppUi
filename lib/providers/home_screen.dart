import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first_ui/utils/constants.dart';

class HomeScreenModel extends ChangeNotifier {
  List<dynamic> chats = [];
  bool isLoading = false;

  Future<void> fetchUserList() async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await Dio().get(ApiPath.userListUrl);
      chats = response.data['data'];
    } catch (e) {
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
