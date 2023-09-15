import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/notification_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/notification_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_utils.dart';

class NotificationsRepository {

  Future<Either<String,NotificationModel>> getNotifications() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: EndpoinNotifictionts.getAllNotifiction,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);
        if (commonResponse.getStatus &&
            response['response']['status'] == true) {
          return Right(NotificationModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}