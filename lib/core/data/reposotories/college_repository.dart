import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/college_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/college_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class CollegeRepository {
  Future<Either<String, List<CollegeModel>>> getAllColleges() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: CollegeEndpoints.allCollege,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.GET,
        ),
        body: {},
        params: {},
      ).then(
        (response) {
          CommonResponseModel commonResponse =
              CommonResponseModel<dynamic>.fromJson(response);

          if (commonResponse.getStatus) {
            List<CollegeModel> resultList = [];

            commonResponse.data.forEach(
              (element) {
                resultList.add(CollegeModel.fromJson(element));
              },
            );

            return Right(resultList);
          } else {
            return Left(commonResponse.message ?? "");
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
