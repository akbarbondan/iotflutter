import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:skripsi/services/services.dart';
import 'package:skripsi/ui/page/pages.dart';

import 'model/models.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialiAndroid = AndroidInitializationSettings('ic_launcher');
  var initializationSettings = InitializationSettings(initialiAndroid, null);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload ' + payload);
    }
  });
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DatabaseReference _dhtRef = FirebaseDatabase.instance.reference().child('Monitoring');
  @override
  void initState()  {
    super.initState();

     _dhtRef.once().then((DataSnapshot snapshot) {
      int suhu = snapshot.value['suhu']['data'];
      int kelembaban = snapshot.value['kelembaban']['data'];
      LogServices.simpanLog(Log(suhu: suhu, kelembaban: kelembaban));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScren());
  }
}

//  
