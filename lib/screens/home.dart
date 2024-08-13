import 'package:flutter/material.dart';
import 'package:flutter_first_ui/components/my_listTile.dart';
import 'package:flutter_first_ui/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> chats = ["Chat 1", "Chat 2", "Chat 3"];
  List<String> status = ["Status 1", "Status 2", "Status 3"];
  List<String> calls = ["Call 1", "Call 2", "Call 3"];
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
          backgroundColor: const Color.fromARGB(255, 16, 83, 18),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Secondscreen(
                                title: chats[index],
                              )),
                    );
                    print("Chat ${chats[index]}");
                  },
                  leading: const CircleAvatar(),
                  title: Text(chats[index],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text("This is a message"),
                  trailing: const Text("10:00 PM"),
                );
              },
            ),
            ListView.builder(
              itemCount: status.length,
              itemBuilder: (BuildContext context, index) {
                return MyListtile(
                    text: status[index], icon: Icons.account_circle);
              },
            ),
            ListView.builder(
              itemCount: calls.length,
              itemBuilder: (BuildContext context, index) {
                return MyListtile(text: calls[index], icon: Icons.call);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.message, color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 16, 83, 18),
        ),
      ),
    );
  }
}
