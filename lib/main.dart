import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:darrebni_exam/core/services/notification_service.dart';
import 'package:darrebni_exam/firebase_options.dart';
import 'package:darrebni_exam/ui/views/collage_view/collage_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:darrebni_exam/app/my_app.dart';

import 'package:darrebni_exam/core/data/repository/shared_prefrence_repository.dart';
import 'package:darrebni_exam/core/services/connectivity_service.dart';
import 'package:darrebni_exam/core/services/location_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Get.lazyPut(
    () => SharedPrefrenceRepository(),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(ConnectivityService());
//  Get.put(CartService());
  Get.put(Connectivity());
  Get.put(LocationService());
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }

  runApp(MyApp());
}
