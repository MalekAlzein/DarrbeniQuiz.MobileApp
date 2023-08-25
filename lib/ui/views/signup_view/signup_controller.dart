import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/college_model.dart';
import 'package:flutter_templete/core/data/reposotories/auth_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SignupController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController specializationIdController = TextEditingController();
  RxInt collegeId = 1.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxInt selectedValue = 0.obs;
  RxList<CollegeModel> collegeList = <CollegeModel>[].obs;

  @override
  void onInit() {
    collegeList.value = storage.getCollege();
    super.onInit();
  }

  // List<CollegeModel> collegeList = [
  //   CollegeModel(id: 1, name: "firstfirstfirst"),
  //   CollegeModel(id: 2, name: "secondsecondsecond"),
  //   CollegeModel(id: 3, name: "thirdthirdthird"),
  //   CollegeModel(id: 4, name: "fourthfourthfourth"),
  //   CollegeModel(id: 5, name: "fifthfifthfifth"),
  //   CollegeModel(id: 6, name: "sixthsixthsixth"),
  // ];

  void register() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
        function: AuthRepository()
            .register(
          name: usernameController.text,
          phone: mobileController.text,
          collegeId: collegeId.value,
        )
            .then(
          (value) {
            value.fold((l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            }, (r) {
              CustomToast.showMessage(
                message: 'everything ok',
                messageType: MessageType.SUCCESS,
              );
              Get.off(() => LoginView());
            });
          },
        ),
      );
    }
  }
}
