import 'package:concept_project/modules/notification/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification App",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  NotificationService().showNotificationInStatusBar();
                },
                child: const Text(
                  "Ongoing Notification",
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  NotificationService().showHeadsUpNotification();
                },
                child: const Text(
                  "Heads Up Notification",
                )),
          ],
        ),
      ),
    );
  }
}
