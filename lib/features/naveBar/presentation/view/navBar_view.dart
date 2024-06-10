import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/about_us.dart';
import 'package:flutter_final_graduation_project/core/utils/assets.dart';
import 'package:flutter_final_graduation_project/core/utils/constans.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:flutter_final_graduation_project/features/profile/data/user_model.dart';
import 'package:flutter_final_graduation_project/features/setting/views/settings_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);
  @override
  _NavBarViewState createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  bool _isLoading = true;
  UserModel? _userModel;
  String? _error;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse("https://student.valuxapps.com/api/profile"),
      headers: {
        'Authorization': token!,
        'lang': 'en',
      },
    );
    final responseData = jsonDecode(response.body);

    if (responseData['status'] == true) {
      setState(() {
        _userModel = UserModel.fromJson(data: responseData['data']);
        _isLoading = false;
      });
    } else {
      setState(() {
        _error = responseData['message'];
        _isLoading = false;
      });
    }
  }

  bool valueNotification = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? Colors.black
                    : Colors.white),
            accountName: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                    ? Center(child: Text(_error!))
                    : Text(
                        _userModel?.name ?? "Unknown",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
            accountEmail: _error != null
                ? Center(child: Text(_error!))
                : Text(
                    _userModel?.email ?? "Unknown",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'assets/images/pana.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SwitchListTile(
            title: Row(
              children: [
                Icon(CupertinoIcons.bell_fill), // أيقونة الجرس
                SizedBox(width: 8), // ترك مسافة بين الأيقونة والنص
                Text(
                  "8".tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            value: valueNotification,
            onChanged: (bool value) {
              setState(() {
                valueNotification = value;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "3".tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingsScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "13".tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AboutUsPage();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
