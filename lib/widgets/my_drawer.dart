import 'package:flutter/material.dart';
import 'package:thewall/data/auth_services/authServices.dart';
import 'package:thewall/view/profile/profile_screen.dart';
import 'package:thewall/widgets/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final AuthService authService = AuthService();

  gotoProfile(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // header
              DrawerHeader(
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  )),

              // home list tile
              MyListTile(
                title: 'Home',
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              // profile list tile
              MyListTile(
                  title: "Profile",
                  icon: Icons.person,
                  onTap: () { gotoProfile(context);}
              ),
            ],
          ),
          //logout lsist tile
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MyListTile(title: "Logout", icon: Icons.logout,onTap: () => authService.signOut(context),),
          )
        ],
      ),
    );
  }
}
