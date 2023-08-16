import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templete/core/enums/connectivity_status.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/views/splash_screen/spalsh_screen_view.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    globalContext = context;
    return StreamProvider<ConnectivityStatus>(
      initialData: ConnectivityStatus.ONLINE,
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      child: GetMaterialApp(
        defaultTransition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 12),
        title: 'Flutter Demo',
        builder: BotToastInit(),
        locale: getLocale(),
        fallbackLocale: getLocale(),
        translations: AppTranslation(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        theme: ThemeData(
          fontFamily: 'Alexandria',
          primarySwatch: Colors.blue,
          fontFamily: 'Alexandria',
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

BuildContext? globalContext;

Locale getLocale() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else if (storage.getAppLanguage() == 'tr') {
    return Locale('tr', 'TR');
  } else {
    return Locale('en', 'US');
  }
}
