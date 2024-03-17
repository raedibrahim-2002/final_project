import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';

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
                    AssetsStrings.homeString,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              onTap: () {},
            ),
            SwitchListTile(
              title: Row(
                children: [
                  Icon(CupertinoIcons.sun_min_fill), // أيقونة الشمس
                  SizedBox(width: 8), // ترك مسافة بين الأيقونة والنص
                  Text(
                    AssetsStrings.themeString,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              value: true,
              onChanged: (bool? value) {},
            ),
            SwitchListTile(
              title: Row(
                children: [
                  Icon(CupertinoIcons.bell_fill), // أيقونة الشمس
                  SizedBox(width: 8), // ترك مسافة بين الأيقونة والنص
                  Text(
                    AssetsStrings.notificationdString,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              value: true,
              onChanged: (bool? value) {},
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text(
                AssetsStrings.inviteFriendsString,
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
                    AssetsStrings.settingsString,
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
                    AssetsStrings.aboutUsString,
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
