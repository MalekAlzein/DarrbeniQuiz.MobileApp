import 'package:dartz/dartz.dart';
import 'package:new_quiz/core/data/models/apis/logout_model.dart';
import 'package:new_quiz/core/data/models/apis/show_profile_model.dart';
import 'package:new_quiz/core/data/network/endpoints/profile_endpoints.dart';
import 'package:new_quiz/core/data/repositories/shared_preference_repositories.dart';
import 'package:new_quiz/core/enums/request_type.dart';

import '../../utilies/network_utily.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class profileRepository {
  Future<Either<String, showProfileModel>> showProfile() async {
    try {
      return NetworkUtil.sendRequest(
        type: requestType.GET,
        url: profileEndpoints.showProfile,
        headers: NetworkConfig.getHeaders(needAuth: true),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(showProfileModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, logoutModel>> logout() async {
    try {
      return NetworkUtil.sendRequest(
        type: requestType.GET,
        url: profileEndpoints.logout,
        headers: NetworkConfig.getHeaders(needAuth: true),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(logoutModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}