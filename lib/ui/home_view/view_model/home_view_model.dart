import 'package:flutter/material.dart';
import 'package:flutter_first_ui/base/base_view_model.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';
import 'package:flutter_first_ui/ui/home_view/services/home_services.dart';

class HomeViewModel extends BaseViewModel {
  final HomeService _homeService = HomeService();
  List<UserListModel> chats = [];
  Future<void> fetchUserList() async {
    updateLoading(loading: true);
    notifyListeners();
    try {
      chats = await _homeService.fetchUserList();
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      updateLoading(loading: false);
      notifyListeners();
    }
  }
}
