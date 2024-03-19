import 'package:flutter/material.dart';
import 'package:flutter_final_graduation_project/core/utils/colors.dart';
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
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: clearAllNotifications, // Calling the clear function here
                child: Text(
                  'Clear all',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          )
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        tileColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Super Offer',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Text(
            'Get 60% off in our first booking',
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
          '${DateFormat.E().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}',
        ),
      ),
    );
  }
}
