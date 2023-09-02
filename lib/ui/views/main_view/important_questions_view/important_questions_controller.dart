import 'package:flutter_templete/core/data/models/apis/impotant_model.dart';
import 'package:flutter_templete/core/data/reposotories/important_questions_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../shared/custom_widgets/custom_toast.dart';

class ImportantQuestionsController extends BaseController {
  RxList<ImportantModel> importantQuestions = <ImportantModel>[].obs;

  @override
  void onInit() {
    getImportantQuestions();
    super.onInit();
  }

  getImportantQuestions() {
    runFutureFunctionWithLoading(
        function: ImportantRepository().getImportantQuestions().then((value) =>
            value.fold(
                (l) => CustomToast.showMessage(
                    message: 'error', messageType: MessageType.REJECTED),
                (r) => importantQuestions.addAll(r))));
  }

  removeFromImportants(int id) {
    runFutureFunctionWithLoading(
        function: ImportantRepository()
            .removeFromImportants(questionID: id)
            .then((value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => CustomToast.showMessage(
                    message: 'removed successfully',
                    messageType: MessageType.SUCCESS))));
  }

  addToImportants(int id) {
    runFutureFunctionWithLoading(
        function: ImportantRepository().addToImportants(questionID: id).then(
            (value) => value.fold(
                (l) => CustomToast.showMessage(message: l),
                (r) => CustomToast.showMessage(
                    message: 'added successfully',
                    messageType: MessageType.SUCCESS))));
  }
}
