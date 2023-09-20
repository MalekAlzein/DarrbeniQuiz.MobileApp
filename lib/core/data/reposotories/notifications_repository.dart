import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/notification_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/notification_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class NotificationsRepository {

  Future<Either<String, List<NotificationModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: EndpoinNotifictionts.getAllNotifiction,
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
        body: {},
        params: {},
      ).then(
            (response) {
          CommonResponseModel<List<dynamic>> commonResponse =
          CommonResponseModel.fromJson(response);

          if (commonResponse.getStatus) {
            List<NotificationModel> resultList = [];

            commonResponse.data!.forEach(
                  (element) {
                resultList.add(NotificationModel.fromJson(element));
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