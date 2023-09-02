import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/impotant_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/important_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../network/network_config.dart';

class ImportantRepository {
  Future<Either<String, List<ImportantModel>>> getImportantQuestions() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: ImportanceEndpoints.getImportance,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        List<ImportantModel> questions = [];
        CommonResponseModel<Map<String, dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus) {
          for (var element in commonResponse.data!['data']) {
            questions.add(ImportantModel.fromJson(element));
          }
          return Right(questions);
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }

  Future<Either<String, bool>> removeFromImportants(
      {required questionID}) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.DELETE,
        url: ImportanceEndpoints.deleteImportance + questionID,
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
        requestType: RequestType.POST,
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
