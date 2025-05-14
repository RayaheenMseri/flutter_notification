import 'package:flutter/material.dart';
import 'notification_service.dart';

class ReminderInputPage extends StatefulWidget {
  const ReminderInputPage({super.key});

  @override
  State<ReminderInputPage> createState() => _ReminderInputPageState();
}

class _ReminderInputPageState extends State<ReminderInputPage> {
  final _titleController = TextEditingController();
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Set Reminder")),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    _selectedTime = time;
                  });
                }
              },
              child: const Text("Select Time"),
            ),
            const SizedBox(height: 8),
            Text(
              _selectedTime == null
                  ? "No time selected"
                  : "Selected: ${_selectedTime!.format(context)}",
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                final now = DateTime.now();
                final selectedDateTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  _selectedTime!.hour,
                  _selectedTime!.minute,
                );
                final payload = _titleController.text;

                await NotiService().scheduleNotification(
                  id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                  title: "Reminder",
                  body: payload,
                  scheduledTime: selectedDateTime,
                  payload: payload,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Reminder Scheduled")),
                );

                _titleController.clear();
                setState(() => _selectedTime = null);
              },
              child: const Text("Set Reminder"),
            ),
          ],
        ),
      ),
    );
  }
}
