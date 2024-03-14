import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  final List<CustomNotification> notifactions = const [
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification(),
    CustomNotification()
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
        itemBuilder: (context, index) => notifactions[index],
        itemCount: notifactions.length,
      ),
    );
  }
}

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Color(0xFF1D2046),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        tileColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Super Offer',
            style: TextStyle(fontSize: 20),
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Get 60% off in our first booking',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 40,
          backgroundImage: AssetImage('assets/images/Backgrounddd.png'),
        ),
        trailing: Text('{DateFormat.E().format(DateTime.now(),)}''{DateFormat.jm().format(DateTime.now(),)}'),
      ),
    );
  }
}