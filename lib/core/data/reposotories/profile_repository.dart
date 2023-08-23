import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/profile_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/profile_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class ProfileRepository {
  Future<Either<String, ProfileModel>> myProfile() async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.GET,
        url: ProfileEndpoints.myProfile,
        fields: {},
        params: {},
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
        requestType: RequestType.GET,
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(ProfileModel.fromJson(
            commonResponse.data ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

//?--
  Future<Either<String, ProfileModel>> updateProfile({
    required String name,
    required String phone,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: ProfileEndpoints.updateProfile,
        fields: {
          'name': 'sami',
          'phone': '0888',
        },
        params: {},
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.POST,
        ),
        requestType: RequestType.POST,
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(ProfileModel.fromJson(
            commonResponse.data ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
