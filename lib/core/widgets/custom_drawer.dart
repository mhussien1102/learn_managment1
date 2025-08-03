import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(leading: Icon(Icons.home), title: Text('Home')),
          ListTile(leading: Icon(Icons.category), title: Text('Categories')),
          ListTile(leading: Icon(Icons.person), title: Text('Profile')),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
        ],
      ),
    );
  }
}
