import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/widgets/chat_list_view.dart';
import 'package:flutter_first_ui/components/user_app_bar.dart';
import 'package:flutter_first_ui/components/user_listviewbuilder.dart';
import 'package:flutter_first_ui/ui/chat_view/view_model/user_list_model.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/loading_view_model.dart';
import 'package:flutter_first_ui/ui/setting_view/setting_view.dart';
import 'package:flutter_first_ui/utils/api_path.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<UserListModel> chats = [];

  Future<void> fetchUserList() async {
    final loadingScreen = context.read<LoadingViewModel>();
    loadingScreen.updateLoading(loading: true);
    try {
      Response response = await Dio().get(ApiPath.userListUrl);
      final data = response.data['data'] as List<dynamic>;
      final parsed = data
          .map<UserListModel>(
              (json) => UserListModel.fromJson(json as Map<String, dynamic>))
          .toList();
      setState(() {
        chats = parsed;
        loadingScreen.updateLoading(loading: false);
      });
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    final loadingScreen = context.watch<LoadingViewModel>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: UserAppBar(
          title: "WhatsApp",
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
          bottom: TabBar(
            tabs: const [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
            labelColor: Theme.of(context).colorScheme.inversePrimary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        body: TabBarView(
          children: [
            loadingScreen.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ChatListView(chats: chats, onRefresh: fetchUserList),
            UserListviewbuilder(
              status: ["Status 1", "Status 2", "Status 3"],
              icon: Icons.account_circle,
            ),
            UserListviewbuilder(
              status: ["Call 1", "Call 2", "Call 3"],
              icon: Icons.call,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingView()),
            );
          },
          backgroundColor: const Color.fromARGB(255, 16, 83, 18),
          child: Icon(Icons.settings,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }
}
