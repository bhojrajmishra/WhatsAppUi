import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/chat_view/widgets/chat_list_view.dart';
import 'package:flutter_first_ui/components/user_app_bar.dart';
import 'package:flutter_first_ui/components/user_listview_builder.dart';
import 'package:flutter_first_ui/ui/home_view/view_model/home_view_model.dart';
import 'package:flutter_first_ui/ui/setting_view/setting_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().fetchUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return TabBarView(
              children: [
                viewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ChatListView(
                        chats: viewModel.chats,
                        onRefresh: viewModel.fetchUserList,
                      ),
                const UserListviewbuilder(
                  status: ["Status 1", "Status 2", "Status 3"],
                  icon: Icons.account_circle,
                ),
                const UserListviewbuilder(
                  status: ["Call 1", "Call 2", "Call 3"],
                  icon: Icons.call,
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingView()),
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
