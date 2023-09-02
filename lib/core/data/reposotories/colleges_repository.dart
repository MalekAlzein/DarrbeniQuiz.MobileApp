import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class CollegesRepository {
  Future<Either<String, List<CollegesModel>>> getAllCategories() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: CollegesEndpoints.allColleges,
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
            List<CollegesModel> resultList = [];
            resultList.add(CollegesModel(id: 0, name: "الكل", uuid: "all"));

            commonResponse.data!['categories'].forEach(
              (element) {
                resultList.add(CollegesModel.fromJson(element));
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
