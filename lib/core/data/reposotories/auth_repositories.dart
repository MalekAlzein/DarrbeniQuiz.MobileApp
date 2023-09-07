import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/token_info_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';

import 'package:flutter_templete/core/data/network/endpoints/auth_endpoints.dart';
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
        url: AuthEndpoints.register,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
      ).then((response) {
        if (response == null) {
          return Left("الرجاء التحقق من الانترنت");
        }
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus &&
            response['response']['status'] == true) {
          return Right(true);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TokenInfoModel>> login({
    required String name,
    required String loginCode,
    required String fcm_token
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: AuthEndpoints.login,
        fields: {'name': name, 'login_code': loginCode,'fcm_token':fcm_token},
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.POST,
        ),
        requestType: RequestType.POST,
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfoModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
