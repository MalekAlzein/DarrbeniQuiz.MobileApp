import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/category_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/category_endpoints.dart';
import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class CategoryRepository {
  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: CategoryEndpoints.allCategory,
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
            List<CategoryModel> resultList = [];
            resultList.add(CategoryModel(id: 0, name: "الكل", uuid: "all"));

            commonResponse.data!['categories'].forEach(
              (element) {
                resultList.add(CategoryModel.fromJson(element));
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
