import 'package:flutter_templete/core/data/models/apis/colleges_model.dart';
import 'package:flutter_templete/core/data/models/apis/slider_model.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/data/reposotories/colleges_and_specializtions_repositories.dart';

import 'package:flutter_templete/core/data/reposotories/silder_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class HomePageController extends BaseController {
  RxList<SliderModel> silderList = <SliderModel>[].obs;
  RxList<SpecializationsModel> specializationsList =
      <SpecializationsModel>[].obs;
  RxList<SpecializationsModel> filteredSpecializationsList =
      <SpecializationsModel>[].obs;
  RxList<CollegesModel> collegeList = <CollegesModel>[].obs;
  RxList<String> selectedColleges = <String>[].obs;
  RxString selectedCollege = "الكل".obs;
  RxInt selectedCollegeId = 0.obs;
  int subbedSpecialization = 0;

  @override
  void onInit() {
    specializationsList.value = storage.getSpecializationsList();
    subbedSpecialization = storage.getTokenInfo()!.specialization!.id!;
    getAllSliders();
    getAllColleges();
    super.onInit();
  }

  bool subbedCollege({
    required int index,
  }) {
    return storage.getTokenInfo()!.specialization!.id! ==
        filteredSpecializationsList[index].id;
    // return storage.getCollegeLogin()!.uuid == specializationsList[index].uuid!;
  }

  void getAllSliders() {
    runFutureFunctionWithLoading(
      function: SliderRepository().getAllSliders().then(
        (value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            silderList.addAll(r);
            CustomToast.showMessage(
              message: "Success",
              messageType: MessageType.SUCCESS,
            );
          });
        },
      ),
    );
  }

  void getAllColleges() {
    runFutureFunctionWithLoading(
      function: CollegesAndSpecializtionsRepositories().getAllColleges().then(
        (value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            collegeList.addAll(r);
            getSpecializationspByCollege(0);
            CustomToast.showMessage(
              message: "Success",
              messageType: MessageType.SUCCESS,
            );
          });
        },
      ),
    );
  }

  Future<void> getSpecializationspByCollege(int collegeId) async {
    //filteredspecializationsList.clear();
    if (collegeId == 0) {
      filteredSpecializationsList.value = specializationsList.value;
    } else {
      filteredSpecializationsList.value =
          specializationsList.where((specializations) {
        return specializations.collageId == collegeId;
      }).toList();
    }
  }
}
