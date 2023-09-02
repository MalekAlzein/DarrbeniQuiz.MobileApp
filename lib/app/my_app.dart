import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templete/core/enums/connectivity_status.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:flutter_templete/ui/views/splash_screen/spalsh_screen_view.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../ui/views/login_view/login_view.dart';

late BuildContext appContext;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    appContext = context;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return StreamProvider<ConnectivityStatus>(
      initialData: ConnectivityStatus.ONLINE,
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      child: GetMaterialApp(
        textDirection: languageService.getLocale() == Locale('ar', 'SA')
            ? TextDirection.rtl
            : TextDirection.ltr,
        defaultTransition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 12),
        title: 'Flutter Demo',
        builder: BotToastInit(),
        locale: languageService.getLocale(),
        fallbackLocale: languageService.getLocale(),
        translations: AppTranslation(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        theme: ThemeData(
          fontFamily: 'Alexandria',
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.whiteColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.transparent.withOpacity(0),
          ),
        ),
        home: SplashScreenView(),
      ),
    );
  }
}
