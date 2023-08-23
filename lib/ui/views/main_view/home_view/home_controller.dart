import 'package:flutter_templete/core/data/models/apis/slider_model.dart';
import 'package:flutter_templete/core/data/reposotories/silder_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  RxList<SilderModel> silderList = <SilderModel>[].obs;
  @override
  void onInit() {
    getAllSliders();

    super.onInit();
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
}

// class GridItem {
//   final String imagePath;
//   final String text;

//   GridItem({required this.imagePath, required this.text});
// }

// Widget toWidget() {
//   return Column(
//     children: [
//       SvgPicture.asset(imagePath),
//       Text(text),
//     ],
//   );
// }
