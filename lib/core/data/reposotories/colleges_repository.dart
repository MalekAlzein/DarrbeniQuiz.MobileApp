import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/colleges_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/specialization_endpoints.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class CollegeRepository {
  Future<Either<String, List<CollegeModel>>> getAllColleges() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: SpecializationEndpoints.allCollages,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.GET,
        ),
        body: {},
        params: {},
      ).then(
        (response) {
          CommonResponseModel<Map<String, dynamic>> commonResponse =
              CommonResponseModel.fromJson(response);

          if (commonResponse.getStatus) {
            List<CollegeModel> resultList = [];
            resultList
                .add(CollegeModel(data: [Data(id: 0, collageName: "الكل")]));

            commonResponse.data!['categories'].forEach(
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
