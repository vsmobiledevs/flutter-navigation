import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/screens/TopTabs/calls_page.dart';
import 'package:flutter_app/screens/TopTabs/chats_page.dart';
import 'package:flutter_app/screens/TopTabs/status_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlue,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                unselectedLabelColor: Colors.lightBlue[100],
                labelColor: Colors.white,
                indicatorWeight: 2,
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'STATUS',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatsPage(),
            StatusPage(),
            CallsPage(),
          ],
        ),
      ),
    );
  }
}
