import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var operationType = OperationType.NONE.obs;
  RxList<OperationType> operationTypeList = <OperationType>[].obs;
  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  bool get isLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.NONE);

  // bool get isCategoryLoading =>
  //     requestStatus == RequestStatus.LOADING &&
  //     operationTypeList.contains(OperationType.CATEGORY);

  // bool get isMealLoading =>
  //     requestStatus == RequestStatus.LOADING &&
  //     operationTypeList.contains(OperationType.MEAL);

  set setOperationType(OperationType value) {
    operationType.value = value;
  }

  Future runFutureFunction({
    required Future function,
    // OperationType? type = OperationType.NONE
  }) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction({
    required Future function,
    OperationType? operationType = OperationType.NONE,
  }) async {
    checkConnection(() async {
      setRequestStatus = RequestStatus.LOADING;
      // setOperationType = type!;
      operationTypeList.add(operationType!);

      await function; //to replay
      setRequestStatus = RequestStatus.DEFAULT;
      // setOperationType = OperationType.NONE;
      operationTypeList.remove(operationType);
    });
  }

  Future runFullLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    // setRequestStatus = RequestStatus.LOADING;
    // setOperationType = type!;
    checkConnection(() async {
      customLoader();
      await function; //to replay
      BotToast.closeAllLoading();
    });
  }
}
//2 fun
