import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/shared_prefrences.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<CustomNotification> notifications = const [
    CustomNotification(),
  ];

  void clearAllNotifications() {
    setState(() {
      notifications = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PreferenceUtils.getBool(PrefKeys.darkTheme)
            ? Colors.black
            : Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('8'.tr,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? Colors.white
                    : Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: clearAllNotifications,
            color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                ? Colors.white
                : Colors.black,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => notifications[index],
        itemCount: notifications.length,
      ),
    );
  }
}

class CustomNotification extends StatelessWidget {
  const CustomNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: PreferenceUtils.getBool(PrefKeys.darkTheme)
            ? Colors.grey[850]
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Super Offer'.tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Get 60% off in our first booking'.tr,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                  ? Colors.white70
                  : Colors.black87,
            ),
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          backgroundImage: AssetImage("assets/images/home_3.jpeg"),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.E().format(DateTime.now()),
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? Colors.white70
                    : Colors.black54,
              ),
            ),
            Text(
              DateFormat.jm().format(DateTime.now()),
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? Colors.white70
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
