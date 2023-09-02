
import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/profile_model.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/endpoints/profile_endpoints.dart';
import '../network/network_config.dart';

class ProfileRepository {
  Future<Either<String, ProfileModel>> getProfileInfo() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: ProfileEndpoints.profileInfo,
        headers: NetworkConfig.getHeaders(needAuth: true,requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(ProfileModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, dynamic>> logout() async {
    try {
      return NetworkUtil.sendRequest(
        requestType:  RequestType.POST,
        url: ProfileEndpoints.logout,
        headers: NetworkConfig.getHeaders(needAuth: true,requestType:  RequestType.POST),
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.data );
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, dynamic>> updateProfileInfo ({
  required String name,
    required String phone
}) async {
    try {
      return NetworkUtil.sendRequest(
        requestType:  RequestType.PUT,
        url: ProfileEndpoints.profileUpdate,
        headers: NetworkConfig.getHeaders(needAuth: true,requestType:  RequestType.PUT),
        body: {"name":name,
          "mobile_phone":phone}
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.data );
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}