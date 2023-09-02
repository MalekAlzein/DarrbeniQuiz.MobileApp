import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/slider_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/slider_endpoints.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class SliderRepository {
  Future<Either<String, List<SliderModel>>> getAllSliders() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SliderEndpoints.slider,
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
            List<SliderModel> resultList = [];

            commonResponse.data!["sliders"].forEach(
              (element) {
                resultList.add(SliderModel.fromJson(element));
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
