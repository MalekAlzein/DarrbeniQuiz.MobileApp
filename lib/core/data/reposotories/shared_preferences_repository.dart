import 'dart:convert';

import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/data/models/apis/profile_model.dart';
import 'package:flutter_templete/core/data/models/apis/token_info_model.dart';
import 'package:flutter_templete/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  SharedPreferences globalSharedPreferences = Get.find();

  //!--- Keys ----
  String PREF_FIRST_LOGIN = 'first_login';
  String PREF_TOKEN = 'token';
  String PREF_PROFILE_INFO = 'profile_info';
  String PREF_APP_LANG = 'app_lang';
  String PREF_CART_LIST = 'cart_list';
  String PREF_FCM_TOKEN = 'fcm_token';
  String PREF_SPECIALIZATION_LIST = 'specialization_list';
  // String PREF_COLLEGE_LOGIN = 'college_login';

  void setFirstLogin(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LOGIN,
      value: value,
    );
  }

  void setFcmToken(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_FCM_TOKEN,
      value: value,
    );
  }

  String getFcmToken() {
    if (globalSharedPreferences.containsKey(PREF_FCM_TOKEN)) {
      return getPreference(key: PREF_FCM_TOKEN);
    } else {
      return '';
    }
  }

  bool getFirstLogin() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LOGIN)) {
      return getPreference(key: PREF_FIRST_LOGIN);
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

  void setProfileInfo(ProfileModel value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_PROFILE_INFO,
      value: jsonEncode(value.toJson()),
    );
  }

  ProfileModel? getProfileInfo() {
    if (globalSharedPreferences.containsKey(PREF_PROFILE_INFO)) {
      return ProfileModel.fromJson(
          jsonDecode(getPreference(key: PREF_PROFILE_INFO)));
    } else {
      return null;
    }
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

  void setSpecializationsList(List<SpecializationsModel> list) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_SPECIALIZATION_LIST,
      value: SpecializationsModel.encode(list),
    );
  }

  List<SpecializationsModel> getSpecializationsList() {
    if (globalSharedPreferences.containsKey(PREF_SPECIALIZATION_LIST)) {
      return SpecializationsModel.decode(
          getPreference(key: PREF_SPECIALIZATION_LIST));
    } else {
      return [];
    }
  }

  // void setSpecializationsLogin(SpecializationsModel value) {
  //   setPreference(
  //     dataType: DataType.STRING,
  //     key: PREF_COLLEGE_LOGIN,
  //     value: jsonEncode(value.toJson()),
  //   );
  // }

  // SpecializationsModel? getSpecializationsLogin() {
  //   if (globalSharedPreferences.containsKey(PREF_COLLEGE_LOGIN)) {
  //     return SpecializationsModel.fromJson(
  //         jsonDecode(getPreference(key: PREF_COLLEGE_LOGIN)));
  //   } else {
  //     return null;
  //   }
  // }
  void removeFcmToken() {
    globalSharedPreferences.remove(PREF_FCM_TOKEN);
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
