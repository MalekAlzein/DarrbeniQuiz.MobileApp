import 'dart:ui';

import 'package:flutter_templete/core/utils/general_utils.dart';


class LanguageService {
  String appLanguage = storage.getAppLanguage();

  void refreshAppLanguage() {
    appLanguage = storage.getAppLanguage();
  }

  Locale getLocale() {
    refreshAppLanguage();
    if (appLanguage == 'ar') {
      return Locale('ar', 'SA');
    } else if (appLanguage == 'en') {
      return Locale('en', 'US');
    } else {
      return Locale('tr', 'TR');
    }
  }

  // Future<void> setLanguageApi({
  //   required String language,
  // }) async {
  //   await AccountRepository().userSetLanguage(language: language).then((value) {
  //     value.fold((l) {
  //       CustomToasts.showMessage(
  //         message: '$l',
  //         messageType: MessageType.errorMessage,
  //       );
  //     }, (r) {
  //       storage.setAppLanguage(langCode: language);
  //       appLanguage = storage.getAppLanguage();
  //     });
  //   });
  // }
}
