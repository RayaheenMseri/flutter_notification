import 'package:flutter/material.dart';

import 'notification_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          NotiService().showNotification(
            title: "Hello",
            body: "Click here",
          );
        }, child: const Text("Send Notification"),),
      ),
    );
  }
}