import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/token_info_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/auth_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class AuthRepository {
  Future<Either<String, TokenInfoModel>> login({
    required String name,
    required String code,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: AuthEndpoints.login,
        fields: {
          'name': name,
          'code': code,
        },
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.POST,
        ),
        requestType: RequestType.POST,
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
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

  Future<Either<String, bool>> register({
    required String name,
    required String phone,
    required int collegeId,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: AuthEndpoints.register,
        fields: {
          'name': name,
          'phone': phone,
          'college_id': collegeId.toString(),
        },
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.POST,
        ),
        requestType: RequestType.POST,
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
