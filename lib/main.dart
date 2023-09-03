import 'package:flutter/material.dart';
import 'package:flutter_templete/app/my_app.dart';
import 'package:flutter_templete/app/my_app_controller.dart';
import 'package:flutter_templete/core/data/reposotories/shared_preferences_repository.dart';
import 'package:flutter_templete/core/services/cart_services.dart';
import 'package:flutter_templete/core/services/connectivity_service.dart';
import 'package:flutter_templete/core/services/language_service.dart';
import 'package:flutter_templete/core/services/package_info_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }); 
  await Get.put(SharedPreferencesRepository());
  Get.put(CartService());
  Get.put(ConnectivityService());
  await Get.put(LanguageService());
  Get.put(PackageInfoService());
  Get.put(MyAppController());

  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   Get.put(NotificationService());
  // } catch (e) {
  //   print(e);
  // }

  runApp(const MyApp());
}
