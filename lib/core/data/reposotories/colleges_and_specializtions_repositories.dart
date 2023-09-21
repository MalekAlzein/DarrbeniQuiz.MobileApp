import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/colleges_model.dart';
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
        if (response == null) {
          return Left("الرجاء التحقق من الانترنت");
        }
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus &&
            response['response']['status'] == true) {
          List<SpecializationsModel> result = [];
          commonResponse.data.forEach(
            (element) {
              result.add(SpecializationsModel.fromJson(element));
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

  Future<Either<String, List<CollegesModel>>> getAllColleges() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SpecializationEndpoints.allCollages,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.GET,
        ),
        body: {},
        params: {},
      ).then(
        (response) {
          CommonResponseModel<dynamic> commonResponse =
              CommonResponseModel.fromJson(response);

          if (commonResponse.getStatus) {
            List<CollegesModel> resultList = [];
            resultList.add(CollegesModel(id: 0, collageName: "الكل"));

            commonResponse.data.forEach(
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

  static Future<Either<String, List<SpecializationsModel>>>
      searchSpecializtionsByName({
    required String? specializationName,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
          requestType: RequestType.POST,
          type: RequestType.POST,
          url: SpecializationEndpoints.searchSpecialization,
          headers: NetworkConfig.getHeaders(
            requestType: RequestType.POST,
            needAuth: false,
          ),
          fields: {
            "specialization_name":
                specializationName != null ? specializationName.trim() : "",
          }).then((response) {
        if (response == null) {
          return Left("الرجاء التحقق من الانترنت");
        }
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus &&
            response['response']['status'] == true) {
          List<SpecializationsModel> result = [];
          commonResponse.data.forEach(
            (element) {
              result.add(SpecializationsModel.fromJson(element));
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
