import 'dart:convert';

import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/data/models/apis/token_info_model.dart';
import 'package:flutter_templete/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  SharedPreferences globalSharedPreferences = Get.find();
  //!--- Keys ----
  String PREF_FIRST_LAUNCH = 'first_launch';
  String PREF_TOKEN = 'token';
  String PREF_APP_LANG = 'app_lang';
  String PREF_CART_LIST = 'cart_list';
  String PREF_SPECIALIZED_ID = "specialized_id";

  void setFirstLaunch(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LAUNCH,
      value: value,
    );
  }

  bool getFirstLaunch() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LAUNCH)) {
      return getPreference(key: PREF_FIRST_LAUNCH);
    } else {
      return true;
    }
  }

  bool get isLoggedIn => getTokenInfo() != null ? true : false;

  void setTokenInfo(TokenInfoModel value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()),
    );
  }

  TokenInfoModel? getTokenInfo() {
    if (globalSharedPreferences.containsKey(PREF_TOKEN)) {
      return TokenInfoModel.fromJson(
          jsonDecode(getPreference(key: PREF_TOKEN)));
    } else {
      return null;
    }
  }

  void clearTokenInfo() {
    globalSharedPreferences.clear();
  }

  void setAppLanguage(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPreferences.containsKey(PREF_APP_LANG)) {
      return getPreference(key: PREF_APP_LANG);
    } else {
      return AppConfig.defaultLanguage;
    }
  }

  //?--

  //!--- Main Function ----
  setPreference({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
      default:
        break;
    }
  }

  getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }
}
