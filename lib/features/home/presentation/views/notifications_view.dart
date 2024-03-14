import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  final List<CustomNotification> notifications = const [
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                child: const Text(
                  'Clear all',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                onTap: () {},
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
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Super Offer',
            style: TextStyle(fontSize: 20),
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Text(
            'Get 60% off in our first booking',
            style: TextStyle(color: Colors.grey, fontSize: 15),
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
