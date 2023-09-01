import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import '../../../core/data/reposotories/uboutus_repositories.dart';
import '../../../core/enums/message_type.dart';

import '../main_view/main_view.dart';

class AboutController extends GetxController {
  @override
  void onInit() {
    getAboutUS();
    super.onInit();
  }
  RxList<String> textShow=<String>[].obs;
  RxBool errorGet=false.obs;
  String errorText='الانترنيت لديك ضعيف الرجاء التأكد منه';
  getAboutUS() async{
   await UboutUsRepositories.aboutUS().then((value) {
      value.fold((l) {
        errorGet.value=true;
        textShow.value=['error'];
        CustomToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        for(var contentText in r){
          textShow.add(contentText['content']);
        }
      });
    });
  }
}
