import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

import '../../enums/request_type.dart';
import '../models/apis/question_model.dart';
import '../models/apis/terms_model.dart';
import '../models/common_response.dart';
import '../network/endpoints/question_endpoints.dart';
import '../network/endpoints/terms_endpoints.dart';
import '../network/network_config.dart';

class TermsRepositories {
  static Future<Either<String, List<TermsModel>>> getTermsName(
      {required int subjectId}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: TermsEndpoints.Terms +
            subjectId.toString() +
            TermsEndpoints.TermsRest,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<TermsModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(TermsModel.fromJson(element));
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

  static Future<Either<String, List<TermsModel>>> getAllTermsName() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: TermsEndpoints.allTerms,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<TermsModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(TermsModel.fromJson(element));
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

  static Future<Either<String, List<QuestionModel>>> getYearQuestions(
      {required int termId, required int subjectId}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: QuestionEndpoints.questionByTermOfSubject +
            termId.toString() +
            QuestionEndpoints.SubjectByTerm +
            subjectId.toString(),
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<QuestionModel> result = [];
          commonResponse.data!.forEach(
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

  static Future<Either<String, List<QuestionModel>>> getAllYearQuestions({
    required int termId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: QuestionEndpoints.specializationTermsQuestions + termId.toString(),
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<QuestionModel> result = [];
          commonResponse.data!.forEach(
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
}
