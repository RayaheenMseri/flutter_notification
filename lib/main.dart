import 'package:flutter/material.dart';
import 'package:flutter_notification/ReminderInput.dart';
import 'DetailsPage.dart';
import 'home.dart';
import 'notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  NotiService().initNotification((payload) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => ReminderDetailPage(payload: payload),
      ),
    );
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: ReminderInputPage() ,
    );
  }
}
