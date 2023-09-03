import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/app/my_app.dart';
import 'package:flutter_templete/app/my_app_controller.dart';
import 'package:flutter_templete/core/data/reposotories/shared_preferences_repository.dart';
import 'package:flutter_templete/core/services/cart_services.dart';
import 'package:flutter_templete/core/services/connectivity_service.dart';
import 'package:flutter_templete/core/services/language_service.dart';
import 'package:flutter_templete/core/services/notification_service.dart';
import 'package:flutter_templete/core/services/package_info_service.dart';
import 'package:flutter_templete/ui/views/main_view/home_page_view/home_page_controller.dart';
import 'package:flutter_templete/firebase_options.dart';
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
  Get.put(HomePageController());

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }
  runApp(const MyApp());
}
