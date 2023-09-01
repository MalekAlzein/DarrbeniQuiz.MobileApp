import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';

import 'package:flutter_templete/core/data/network/endpoints/specialization_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class CollegesAndSpecializtionsRepositories {
  static Future<Either<String, SpecializationsModel>>
      getAllSpecializtions() async {
    try {
      return await NetworkUtil.sendMultipartRequest(
        type: RequestType.GET,
        requestType: RequestType.GET,
        url: SpecializationEndpoints.allSpecialization,
        headers: NetworkConfig.getHeaders(
          requestType: RequestType.GET,
          needAuth: false,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus && commonResponse.data["data"]["status"]) {
          return Right(SpecializationsModel.fromJson(commonResponse.data));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
