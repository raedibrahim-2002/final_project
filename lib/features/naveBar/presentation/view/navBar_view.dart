import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Container(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              "Remon Ramzy",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            accountEmail: Text(
              "remonramzy@gmail.com",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            currentAccountPicture: Container(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/pana.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            onTap: () {},
          ),
          Row(
            children: [
              Icon(CupertinoIcons.sun_min),
              SwitchListTile(
                title: Text(
                  'Theme',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                value: true,
                onChanged: (bool? value) {},
              ),
            ],
          ),
          Row(
            children: [
              Icon(CupertinoIcons.bell_fill),
              SwitchListTile(
                title: Text(
                  'Notifications',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                value: false,
                onChanged: (bool? value) {},
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text(
              "Invite friends",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "About Us",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
            onTap: () {},
          )
        ],
      ),
      )

    );
  }
}
