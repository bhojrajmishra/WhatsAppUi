import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';
import 'package:flutter_first_ui/ui/home_view/repository/user_list_repository.dart';
import 'package:flutter_first_ui/ui/home_view/services/home_services.dart';

class UserListRepositoryImpl implements UserListRepository {
  @override
  Future<List<UserListModel>> getUserList() async {
    return await HomeService.fetchUserList();
  }
}
