import 'package:flutter_templete/core/data/models/apis/aboutus_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

import '../../../core/data/reposotories/uboutus_repositories.dart';
import '../../../core/enums/message_type.dart';

class AboutController extends BaseController {

  Rx<AboutUsModel> aboutModel = AboutUsModel().obs;

  @override
  void onInit() {
    getAboutUS();
    super.onInit();
  }


  void getAboutUS () {
    runFutureFunctionWithLoading(
        function: AboutUsRepositories().aboutUs().then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l , messageType: MessageType.REJECTED);
            }, (r) {
            aboutModel.value = r;
          });
        })
    );
  }

  // RxList<String> textShow = <String>[].obs;
  // RxBool errorGet = false.obs;
  // String errorText = 'الانترنيت لديك ضعيف الرجاء التأكد منه';
  // getAboutUS() async {
  //   await UboutUsRepositories.aboutUS().then((value) {
  //     value.fold((l) {
  //       errorGet.value = true;
  //       textShow.value = ['error'];
  //       CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
  //     }, (r) {
  //       for (var contentText in r) {
  //         textShow.add(contentText['content']);
  //       }
  //     });
  //   });
  // }
}
