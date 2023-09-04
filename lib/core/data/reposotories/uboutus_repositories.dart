import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/profile_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../network/network_config.dart';

class UboutUsRepositories {
  static Future<Either<String, List>> aboutUS() async {
    try {
      return NetworkUtil.sendRequest(
              type: RequestType.GET,
              url: ProfileEndpoints.aboutUs,
              headers: NetworkConfig.getHeaders(requestType: RequestType.GET))
          .then((respons) {
        if (respons != null) {
          CommonResponseModel<dynamic> commonResponse =
              CommonResponseModel.fromJson(respons);
          if (commonResponse.getStatus &&
              commonResponse.data['status'] == true) {
            return Right(commonResponse.data['data']);
          } else {
            (commonResponse.data['message']);
            return Left(commonResponse.data['message'] ?? '');
          }
        } else {
          return const Left('الرجاء التأكد من الأنترنت');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
