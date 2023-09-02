import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';

class NetworkConfig {
  static String BASE_API = '/api/Darrebni/';

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
        "Authorization": "Bearer 47|P2qBzh4jJumFCtHffnMzgKL0aSwGhTje3g5Q0cNm}",
      if (requestType != RequestType.GET) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
