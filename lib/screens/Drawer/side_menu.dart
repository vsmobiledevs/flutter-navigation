import 'package:flutter/material.dart';
import 'package:flutter_app/screens/BottomTabs/home.dart';
import 'package:flutter_app/screens/BottomTabs/bottom_tabs_nav.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
              ),
              accountEmail: Text(
                'jane.doe@example.com',
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              ),
              accountName: Text(
                'Jane Doe',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.house, size: 22,),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const BottomTabsNav(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.roofing, size: 22),
              title: const Text(
                'Houses',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(
                      title: 'Houses',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.apartment, size: 22),
              title: const Text(
                'Apartments',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(
                      title: 'Apartments',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.house_outlined, size: 22),
              title: const Text(
                'Townhomes',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(
                      title: 'Townhomes',
                    ),
                  ),
                );
              },
            ),
            const Divider(
              height: 10,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.favorite, size: 22),
              title: const Text(
                'Favorites',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage(
                      title: 'Favorites',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

