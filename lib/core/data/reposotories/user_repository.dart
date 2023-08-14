import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/token_info_model.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/endpoints/user_endpoints.dart';
import '../network/network_config.dart';

class UserRepository {
  Future<Either<String, TokenInfoModel>> login({
    required String name,
    required String loginCode,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndpoints.login,
        fields: {'name': name, 'login_code': loginCode},
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
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
    required String mobilePhone,
    required String specializationId,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        fields: {
          'name': name,
          'mobile_phone': mobilePhone,
          'specializationId': specializationId,
        },
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
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
