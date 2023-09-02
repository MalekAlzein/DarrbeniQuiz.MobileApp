import 'package:flutter_templete/core/data/models/apis/colleges_model.dart';
import 'package:flutter_templete/core/data/models/apis/slider_model.dart';
import 'package:flutter_templete/core/data/reposotories/silder_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class HomePageController extends BaseController {
  RxList<SliderModel> silderList = <SliderModel>[].obs;
  RxList<SpecializationsModel> collegeList = <SpecializationsModel>[].obs;
  RxList<SpecializationsModel> filteredCollegeList =
      <SpecializationsModel>[].obs;
  RxList<SpecializationsModel> categoryList = <SpecializationsModel>[].obs;
  RxList<String> selectedCategories = <String>[].obs;
  RxString selectedCategory = "الكل".obs;

  @override
  void onInit() {
    collegeList.value = storage.getCollegeList();
    getAllSliders();
    getAllCategories();
    super.onInit();
  }

  bool subbedCollege({
    required int index,
  }) {
    return storage.getCollegeLogin()!.uuid == filteredCollegeList[index].uuid!;
    // return storage.getCollegeLogin()!.uuid == collegeList[index].uuid!;
  }

  void getAllSliders() {
    runFutureFunction(
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

  void getAllCategories() {
    runFutureFunction(
      function: CategoryRepository().getAllCategories().then(
        (value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            categoryList.addAll(r);
            getCollegesByCategory("all");
            CustomToast.showMessage(
              message: "Success",
              messageType: MessageType.SUCCESS,
            );
          });
        },
      ),
    );
  }

  Future<void> getCollegesByCategory(String categoryUUID) async {
    //filteredCollegeList.clear();
    if (categoryUUID == 'all') {
      filteredCollegeList.value = collegeList.value;
    } else {
      filteredCollegeList.value = collegeList.where((college) {
        return college.category?.uuid == categoryUUID;
      }).toList();
    }
  }
}
