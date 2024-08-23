import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';
import 'package:flutter_first_ui/ui/home_view/services/home_services.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService _homeService = HomeService();
  List<UserListModel> chats = [];
  bool isLoading = false;

  Future<void> fetchUserList() async {
    isLoading = true;
    notifyListeners();
    try {
      chats = await _homeService.fetchUserList();
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
