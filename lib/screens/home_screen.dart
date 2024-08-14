import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/user_list_tile.dart';
import 'package:flutter_first_ui/screens/chat_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter_first_ui/utils/constraints.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> chats = [];
  List<String> status = ["Status 1", "Status 2", "Status 3"];
  List<String> calls = ["Call 1", "Call 2", "Call 3"];
  bool isloading = false;

  Future<void> getData() async {
    setState(() {
      isloading = true;
    });
    try {
      Response response = await Dio().get(ApiPath.getData);
      debugPrint(response.data.toString());

      setState(
        () {
          chats = response.data['data'];
          isloading = false;
        },
      );
    } catch (e) {
      isloading = false;
      setState(() {});
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                getData();
              },
              child: isloading
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
                                        title:
                                            chats[index]['email'] ?? "No email",
                                      )),
                            );
                            debugPrint("Chat ${chats[index]}");
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                chats[index]['avatar'] ?? "No image"),
                          ),
                          title: Text(
                              chats[index]['email'] ??
                                  "No email", //fall back vale if email is null
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              chats[index]['first_name'] ??
                                  "No first name", //fall back vale if email is null
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text(chats[index]['id'].toString()),
                        );
                      },
                    ),
            ),
            ListView.builder(
              itemCount: status.length,
              itemBuilder: (BuildContext context, index) {
                return UserListTile(
                    text: status[index], icon: Icons.account_circle);
              },
            ),
            ListView.builder(
              itemCount: calls.length,
              itemBuilder: (BuildContext context, index) {
                return UserListTile(text: calls[index], icon: Icons.call);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getData,
          backgroundColor: const Color.fromARGB(255, 16, 83, 18),
          child: Icon(Icons.message,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }
}
