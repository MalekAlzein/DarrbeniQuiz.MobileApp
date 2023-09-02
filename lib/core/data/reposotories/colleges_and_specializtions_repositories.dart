import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';

import 'package:flutter_templete/core/data/network/endpoints/specialization_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class CollegesAndSpecializtionsRepositories {
  static Future<Either<String, List<SpecializationsModel>>>
      getAllSpecializtions() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SpecializationEndpoints.allSpecialization,
        headers: NetworkConfig.getHeaders(
          requestType: RequestType.GET,
          needAuth: false,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus &&response['response']['status']==true) {
          List<SpecializationsModel> result = [];
commonResponse.data.forEach(
                (element) {
              result.add(SpecializationsModel.fromJson(element));
            },
          );          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
