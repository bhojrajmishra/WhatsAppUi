import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';

abstract class UserListRepository {
  Future<List<UserListModel>> getUserList();
}
