import 'package:apitest/myapp.dart';
import 'package:apitest/utils/notifaction_handle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
// Plugin must be initialized before using
  //await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await setupFlutterNotifications();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  firebaseMessagingForgroundHandler();
  print('FCM TOKEN: ${await FirebaseMessaging.instance.getToken()}');
  // Initialize Hive
  await Hive.initFlutter();

  runApp(ProviderScope(child: MyApp()));
}
