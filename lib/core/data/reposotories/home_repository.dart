import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/colleges_model.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/data/models/apis/subject_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/specialization_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class HomeRepository {
  Future<Either<String, List<SpecializationsModel>>> getAllSpecialization(
      String get) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: get,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<SpecializationsModel> result = [];
          commonResponse.data!.forEach(
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

  Future<Either<String, List<CollegesModel>>> getAllColleges(String get) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: get,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<CollegesModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(CollegesModel.fromJson(element));
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

  Future<Either<String, List<SubjectModel>>> getSubjects(
      {bool? graduation = false, bool? master = false, int? specialID}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: master!
            ? SpecializationEndpoints.showMaster
            : graduation!
                ? SpecializationEndpoints.showGraduation
                : SpecializationEndpoints.showSubject + specialID.toString(),
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<SubjectModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(SubjectModel.fromJson(element));
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
