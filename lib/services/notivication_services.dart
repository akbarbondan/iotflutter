part of 'services.dart';

class NotivicationServices {
  static void scheduleAlarm(int id, String subtitle,
      {String title = "Peringatan"}) async {
    var scheduledNotificationDateTime = DateTime.now();
    final sound = "notification_sound.wav";

    var androidPlatfromChanel = AndroidNotificationDetails('notification',
        'notification', 'Keadaan Mesin Tetas sedang tidak normal',
        importance: Importance.Max,
         enableVibration: false);
    var platfromChannelSpecifics =
        NotificationDetails(androidPlatfromChanel, null);

    await flutterLocalNotificationsPlugin.schedule(id, title, subtitle,
        scheduledNotificationDateTime, platfromChannelSpecifics);
  }
}

// sound: RawResourceAndroidNotificationSound(sound.split('.').first),