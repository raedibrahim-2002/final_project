import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/features/setting/views/settings_screen.dart';

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
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              accountEmail: Text(
                "raed.ibrahim@gmail.com",
                style: Theme.of(context).textTheme.bodySmall,
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
            SwitchListTile(
              title: Row(
                children: [
                  Icon(CupertinoIcons.sun_min_fill), // أيقونة الشمس
                  SizedBox(width: 8), // ترك مسافة بين الأيقونة والنص
                  Text(
                    AppString.theme,
                    style: Theme.of(context).textTheme.titleMedium,
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
                    AppString.notifications,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              value: true,
              onChanged: (bool? value) {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.settingsString,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingsScreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.aboutUs,
                    style: Theme.of(context).textTheme.titleMedium,
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
