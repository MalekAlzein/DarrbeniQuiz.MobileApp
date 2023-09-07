import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/important_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/apis/question_model.dart';
import '../network/network_config.dart';

class ImportantRepository {
  Future<Either<String, List<QuestionModel>>> getImportantQuestions() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ImportanceEndpoints.getImportance,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        // if (response == null) {
        //   return Left("الرجاء التحقق من الانترنت");
        // }
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus &&
            response['response']['status'] == true) {
          List<QuestionModel> result = [];
          commonResponse.data.forEach(
            (element) {
              result.add(QuestionModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> removeFromImportants(
      {required questionID}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        url: ImportanceEndpoints.deleteImportance + questionID.toString(),
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.DELETE),
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(true);
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> addToImportants({required questionID}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: ImportanceEndpoints.addImportance + questionID,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.POST),
      ).then((response) {
        CommonResponseModel<Map<String, dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(true);
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
