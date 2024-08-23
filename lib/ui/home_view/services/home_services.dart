import 'package:dio/dio.dart';
import 'package:flutter_first_ui/ui/chat_view/models/user_list_model.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<List<UserListModel>> fetchUserList() async {
    try {
      Response response = await _dio.get(ApiPath.userListUrl);
      final List<dynamic> data = response.data['data'];
      return data.map((json) => UserListModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch user list: $e');
    }
  }
}
