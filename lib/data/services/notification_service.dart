import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
      autoCancel: true,
      color: Color(0xFF5DC6F3),
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
}
