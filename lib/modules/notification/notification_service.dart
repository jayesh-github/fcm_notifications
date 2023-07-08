import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    '12', // Replace with your own channel ID
    'Ongoing', // Replace with your own channel name
    description:
        'Status Bar Notification', // Replace with your own channel description
    importance: Importance.high,
  );
  Future<void> init() async {
    debugPrint("Int 3");
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@drawable/space_logo");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null,
      macOS: null,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.requestPermission();
  }

  Future<void> showHeadsUpNotification() async {
    debugPrint("SHOw");
    const channelId = '12345'; // Replace with your own channel ID
    const channelName = 'Incoming'; // Replace with your own channel name
    const channelDescription =
        'This is a Notification'; // Replace with your own channel description

    // Create the AndroidNotificationDetails object with heads-up settings
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      actions: [
        AndroidNotificationAction(
          'cancel',
          'Cancel',
          cancelNotification: true,
          showsUserInterface: true,
        ),
      ],
      ticker: 'ticker',
      enableVibration: true,
      styleInformation: DefaultStyleInformation(true, true),
    );

    // Create a notification
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      123, // Notification ID (can be any unique integer value)
      'Heads-up Notification',
      'This is a heads-up notification!',
      notificationDetails,
    );
  }

  Future<void> showNotificationInStatusBar() async {
    const int notificationId = 0;
    const String notificationTitle = 'Notification in Status Bar';
    const String notificationText =
        'This notification appears only in the status bar';

    // Create the AndroidNotificationDetails object for the notification
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: Importance.high,
      priority: Priority.high,
      fullScreenIntent: true,
      ongoing:
          false, // Set the notification to open the app in full-screen mode
    );

    // Create a notification
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      notificationTitle,
      notificationText,
      notificationDetails,
    );
  }
}
