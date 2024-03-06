import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountName: Text(
                "Raeid Ibrahim",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              accountEmail: Text(
                "raed.ibrahim@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              onTap: () {},

            ),
            //Icon(CupertinoIcons.sun_min),
            SwitchListTile(
              title: Text(
                'Theme',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              value: true,
              onChanged: (bool? value) {},
            ),
           // Icon(CupertinoIcons.bell_fill),
            SwitchListTile(
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              value: false,
              onChanged: (bool? value) {},
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text(
                "Invite friends",
                style: Theme.of(context).textTheme.bodySmall,
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
                    style: Theme.of(context).textTheme.bodySmall,
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
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
