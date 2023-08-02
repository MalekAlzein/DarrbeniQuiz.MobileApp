import 'package:flutter_templete/core/translation/languages/ar_langauge.dart';
import 'package:flutter_templete/core/translation/languages/en_language.dart';
import 'package:flutter_templete/core/translation/languages/tr_language.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // 'en_US':{'key_Login':'Login'},
        // 'ar_SA':{'key_Login':'تسجيل دخول'}
        'en_US': ENLanguage.map,
        'ar_SA': ARLanguage.map,
        'tr_TR': TRLanguage.map,
        //alt move row
        //alt shift copy mesage
        //alt
      };
}

tr(String key) => key.tr;
