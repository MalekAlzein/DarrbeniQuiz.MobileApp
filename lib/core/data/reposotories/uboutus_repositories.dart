import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/aboutus_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/profile_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../network/network_config.dart';

class AboutUsRepositories {
  Future<Either<String,AboutUsModel>> aboutUs() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProfileEndpoints.aboutUs,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<Map<String,dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(AboutUsModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}
