

import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';

class NetworkConfig {
  static String BASE_API = 'api/web/';

  static String getFullApiRoute(String apiRoute) {
    return BASE_API + apiRoute;
  }

  static Map<String, String> getHeaders({
    bool? needAuth = true,
    required RequestType requestType,
    Map<String, String>? extraHeaders = const {},
  }) {
    return {
      if (needAuth!)
        "Authorization": "Bearer ${storage.getTokenInfo()?.accessToken ?? ''}",
      if (requestType != RequestType.GET) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
