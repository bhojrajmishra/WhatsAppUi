import 'package:flutter/material.dart';
import 'package:flutter_first_ui/base/base_view_model.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';
import 'package:flutter_first_ui/ui/home_view/repository/user_list_repository_impl.dart';

class HomeViewModel extends BaseViewModel {
  List<UserListModel> chats = [];

  Future<void> fetchUserList() async {
    updateLoading(loading: true);
    notifyListeners();
    try {
      chats = await UserListRepositoryImpl().getUserList();
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      updateLoading(loading: false);
      notifyListeners();
    }
  }
}
