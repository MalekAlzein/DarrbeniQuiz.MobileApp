import 'package:flutter_templete/core/data/models/apis/colleges_model.dart';
import 'package:flutter_templete/core/data/models/apis/slider_model.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/data/models/apis/subject_model.dart';
import 'package:flutter_templete/core/data/reposotories/colleges_and_specializtions_repositories.dart';
import 'package:flutter_templete/core/data/reposotories/home_repository.dart';

import 'package:flutter_templete/core/data/reposotories/silder_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class HomePageController extends BaseController {
  RxList<SliderModel> sliderList = <SliderModel>[].obs;
  RxList<SpecializationsModel> specializationsList =
      <SpecializationsModel>[].obs;
  RxList<SpecializationsModel> filteredSpecializationsList =
      <SpecializationsModel>[].obs;
  RxList<SubjectModel> subjects = <SubjectModel>[].obs;
  RxList<CollegesModel> collegeList = <CollegesModel>[].obs;
  RxList<String> selectedColleges = <String>[].obs;
  RxString selectedCollege = "الكل".obs;
  RxInt selectedCollegeId = 0.obs;
  bool get isSubjectsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.SUBJECTS);
  int subbedSpecialization = 0;
  RxBool searchMode = false.obs;

  @override
  void onInit() {
    specializationsList.value = storage.getSpecializationsList();
    if (storage.isLoggedIn)
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
            sliderList.addAll(r);
          });
        },
      ),
    );
  }

  Future getAllColleges() {
    return runFutureFunctionWithLoading(
      function: CollegesAndSpecializtionsRepositories().getAllColleges().then(
        (value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            collegeList.clear();
            collegeList.addAll(r);
            getSpecializationspByCollege(collegeId: 0);
          });
        },
      ),
    );
  }

  Future<void> getSpecializationspByCollege({required int collegeId}) async {
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

  Future<void> searchSpecializationspByQuery({
    required String? query,
  }) async {
    //filteredspecializationsList.clear();
    if (query == null || query.isEmpty) {
      searchMode.value = false;
      filteredSpecializationsList.value = specializationsList.value;
    } else {
      searchMode.value = true;
      runFutureFunctionWithLoading(
        function:
            CollegesAndSpecializtionsRepositories.searchSpecializtionsByName(
          specializationName: query,
        ).then(
          (value) {
            return value.fold(
              (l) {
                return CustomToast.showMessage(
                  message: l,
                  messageType: MessageType.WARNING,
                );
              },
              (r) {
                filteredSpecializationsList.value = r;
              },
            );
          },
        ),
      );
    }
  }

  Future<void> getMasterSubjects() async {
    return runFutureFunctionWithLoading(
        operationType: OperationType.SUBJECTS,
        function: HomeRepository().getSubjects(master: true).then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l), (r) {
              subjects.clear();
              subjects.addAll(r);
            })));
  }

  Future<void> getGraduationSubjects() async {
    return runFutureFunctionWithLoading(
        operationType: OperationType.SUBJECTS,
        function: HomeRepository().getSubjects(graduation: true).then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l), (r) {
              subjects.clear();
              subjects.addAll(r);
            })));
  }

  Future<void> getSubjects({required int specialID}) async {
    return runFutureFunctionWithLoading(
        operationType: OperationType.SUBJECTS,
        function: HomeRepository().getSubjects(specialID: specialID).then(
            (value) =>
                value.fold((l) => CustomToast.showMessage(message: l), (r) {
                  subjects.clear();
                  subjects.addAll(r);
                })));
  }
}
