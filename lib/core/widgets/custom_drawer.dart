import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../utils/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Store'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.ecommerce);
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Teacher'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.teacher);
            },
          ),
          ListTile(leading: Icon(Icons.person), title: Text('Profile')),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
        ],
      ),
    );
  }
}
