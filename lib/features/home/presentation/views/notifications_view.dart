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
        actions: [],
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        tileColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Super Offer'.tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: PreferenceUtils.getBool(PrefKeys.darkTheme)
                    ? Colors.black
                    : Colors.white),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Text(
            'Get 60% off in our first booking'.tr,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          backgroundImage: AssetImage(
            "assets/images/home_3.jpeg",
          ),
        ),
        trailing: Text(
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.black),
          '${DateFormat.E().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}',
        ),
      ),
    );
  }
}
