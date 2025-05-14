import 'package:flutter/material.dart';

class ReminderDetailPage extends StatelessWidget {
  final String? payload;

  const ReminderDetailPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reminder Details")),
      body: Center(
        child: Text(payload ?? "No data", style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
