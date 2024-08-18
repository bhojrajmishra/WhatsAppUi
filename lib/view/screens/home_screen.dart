import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first_ui/model/user_list.dart';
import 'package:flutter_first_ui/view/components/user_listviewbuilder.dart';
import 'package:flutter_first_ui/view/screens/chat_screen.dart';
import 'package:flutter_first_ui/view/screens/setting_screen.dart';
import 'package:flutter_first_ui/utils/api_path.dart';
import 'package:flutter_first_ui/viewmodel/providers/loading_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserList> chats = [];
  Future<void> fetchUserList() async {
    final loadingScreen = context.read<LoadingScreen>();
    loadingScreen.updateLoading(loading: true);
    try {
      Response response = await Dio().get(ApiPath.userListUrl);
      debugPrint('Response data: ${response.data}');
      final data = response.data['data'] as List<dynamic>;
      final parsed = data
          .map<UserList>(
              (json) => UserList.fromJson(json as Map<String, dynamic>))
          .toList(); //converts each JSON object into a UserList instance
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
    final loadingScreen = context.watch<LoadingScreen>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "WhatsApp",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
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
            RefreshIndicator(
              onRefresh: () async {
                fetchUserList();
              },
              child: loadingScreen.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                        title: chats[index].email,
                                      )),
                            );
                            debugPrint("Chat ${chats[index]}");
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(chats[index].avatar),
                          ),
                          title: Text(chats[index].email,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(chats[index].firstName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text(chats[index].id.toString()),
                        );
                      },
                    ),
            ),
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
              MaterialPageRoute(builder: (context) => SettingScreen()),
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
