import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print("Title ${message.notification?.title}");
    print("Body ${message.notification?.body}");
    print("Payload ${message.data}");
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token $fCMToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
