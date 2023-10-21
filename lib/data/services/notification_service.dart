import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

sealed class NotificationService {
  /// main object
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// ANDROID 13 and Higher
  static Future<bool?> getPermission() async {
    return await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  static Future<void> settings() async {
    details;

    /// android
    const initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    /// macos and ios
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});

    /// linux
    const initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  static void onDidReceiveNotificationResponse(NotificationResponse response) {}

  static NotificationDetails get details {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      fullScreenIntent: true,
      playSound: true,
      sound: RawResourceAndroidNotificationSound("notification"),
      category: AndroidNotificationCategory.message,
      enableVibration: true,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
      macOS: darwinNotificationDetails,
    );
    return notificationDetails;
  }

  static Future<void> sendNotification({
    required String title,
    required String description,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      Random().nextInt(1000),
      title,
      description,
      details,
      payload: 'Data',
    );
  }

  static Future<void> sendNotificationSchedule({
    required String title,
    required String description,
    required DateTime dateTime,
  }) async {
    tz.initializeTimeZones();
    var tzDateTime =
        tz.TZDateTime.from(dateTime, tz.getLocation('Asia/Tashkent'));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      description,
      tzDateTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> sendNotDuration(
      {required String title,
      required String description,
      required Duration duration}) async {
    tz.initializeTimeZones();
    var currentDateTime =
        tz.TZDateTime.now(tz.getLocation('Asia/Tashkent')).add(duration);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      description,
      currentDateTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
