import 'package:flutter/material.dart';
import 'package:flutter_app/screens/BottomTabs/favorite.dart';
import 'package:flutter_app/screens/BottomTabs/home.dart';
import 'package:flutter_app/screens/BottomTabs/profile.dart';
import 'package:flutter_app/screens/Drawer/side_menu.dart';

class BottomTabsNav extends StatefulWidget {
  const BottomTabsNav({Key? key}) : super(key: key);

  @override
  _BottomTabsNavState createState() => _BottomTabsNavState();
}

class _BottomTabsNavState extends State<BottomTabsNav> {
  int _selectedIndex = 0;
  var imagesVisible = true;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: _selectedIndex == 0 ? null : AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        title: _selectedIndex == 1 ? const Text("Favorite") : const Text("Profile"),
        elevation: 0,
        leading:  Builder(
          builder: (context) => IconButton(
            icon:  const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
