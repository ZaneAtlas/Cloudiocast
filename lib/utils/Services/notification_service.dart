import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/logo');

  void initialiseNotification() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: _androidInitializationSettings,
        );
    
    await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings
    );
  }

  void sendNotification(String title, String body) async {

    AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
          'channelId',
          'channelName',
        importance: Importance.max,
        priority: Priority.high,
      );

    NotificationDetails notificationDetails =
      NotificationDetails(
        android: androidNotificationDetails,
      );
    _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails,
    );
  }

  void scheduleNotification(String title, String body) async {

    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails =
    NotificationDetails(
      android: androidNotificationDetails,
    );
    _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      title,
      body,
      RepeatInterval.daily,
      notificationDetails,
    );
  }

  void stopNotifications() async {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}