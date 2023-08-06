

import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  PackageInfoService() {
    onInit();
  }
  late PackageInfo packageInfo;

  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;

  Future<void> onInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}
