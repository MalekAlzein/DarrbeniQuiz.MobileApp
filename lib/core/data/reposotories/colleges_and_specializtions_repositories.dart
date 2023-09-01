import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/colleges_and_specialization_endpoint.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class CollegesAndSpecializtionsRepositories {
  static Future<Either<String, List<SpecializationModel>>>
      getAllSpecializtions() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: SpecializtionAndCollegesEndpoints.allSpeci,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);
        List<SpecializationModel> result = [];
        if (commonResponse.getStatus && commonResponse.data["data"]["status"]) {
          commonResponse.data.forEach((element) {
            result.add(SpecializationModel.fromJson(element));
          });
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
