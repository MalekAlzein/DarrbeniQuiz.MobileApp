import 'package:flutter_templete/core/data/network/endpoints/specialization_endpoints.dart';
import 'package:flutter_templete/core/data/reposotories/Home_repository.dart';
import 'package:flutter_templete/core/data/reposotories/colleges_and_specializtions_repositories.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      getCollege();
    });
    super.onInit();
  }

  void getCollege() {
    CollegesAndSpecializtionsRepositories.getAllSpecializtions().then((value) {
      value.fold((l) {
        // isLoding.value = false;
        CustomToast.showMessage(
          messageType: MessageType.REJECTED,
          message: l,
        );
      }, (r) {
        storage.setSpecializationsList(r);
        storage.isLoggedIn
            ? Get.off(() => MainView())
            : Get.off(() => LoginView());
      });
    });
  }
}
