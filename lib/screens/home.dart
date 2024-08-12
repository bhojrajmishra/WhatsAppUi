import 'package:flutter/material.dart';
import 'package:flutter_first_ui/screens/secondScreen.dart';

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
          title: Text(
            "WhatsApp",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 16, 83, 18),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
          bottom: TabBar(
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
                      MaterialPageRoute(builder: (context) => Secondscreen()),
                    );
                    print("Chat ${chats[index]}");
                  },
                  leading: CircleAvatar(),
                  title: Text(chats[index],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("This is a message"),
                  trailing: Text("10:00 PM"),
                );
              },
            ),
            ListView.builder(
              itemCount: status.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(status[index]),
                );
              },
            ),
            ListView.builder(
              itemCount: calls.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: Icon(Icons.call),
                  title: Text(calls[index]),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message, color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 16, 83, 18),
        ),
      ),
    );
  }
}
