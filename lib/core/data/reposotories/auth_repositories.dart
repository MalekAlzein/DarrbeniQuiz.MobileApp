import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';

import 'package:flutter_templete/core/data/network/endpoints/user_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class AuthRepositories {
  static Future<Either<String, bool>> register(
      {required String name,
      required String phone,
      required int speci_id}) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        fields: {
          "name": name,
          "mobile_phone": phone,
          "specialization_id": speci_id.toString()
        },
        requestType: RequestType.POST,
        url: UserEndpoints.register,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);
        String result = '';
        if (commonResponse.getStatus && commonResponse.data["data"]["status"]) {
          // result = commonResponse.data["data"]["login_code"];

          return Right(true);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
