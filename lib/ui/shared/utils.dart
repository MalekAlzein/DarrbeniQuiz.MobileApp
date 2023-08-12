import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:get/get.dart';

double width = Get.size.shortestSide;
double height = Get.size.longestSide;
Size size = Get.size;

double screenWidth(double percent) {
  return width / percent;
}

double screenHeight(double percent) {
  return height / percent;
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
          decoration: BoxDecoration(
              color: AppColors.mainback.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          width: screenWidth(4),
          height: screenHeight(4),
          child: SpinKitCircle());
    });

void showAlertDialoug({
  String? title,
  required String? middleText,
  required Function? onCancel,
  required Function? onConfirm,
}) {
  Get.defaultDialog(
    title: title ?? "",
    middleText: middleText ?? "",
    cancel: CustomButton(
      buttonTypeEnum: ButtonTypeEnum.NORMAL,
      onPressed: () {
        if (onCancel != null) onCancel();
      },
      width: screenWidth(3),
      text: tr("key_no"),
      backgroundColor: AppColors.mainRedColor,
    ),
    confirm: CustomButton(
      buttonTypeEnum: ButtonTypeEnum.NORMAL,
      onPressed: () {
        if (onConfirm != null) onConfirm();
      },
      width: screenWidth(3),
      text: tr("key_yes"),
    ),
    onCancel: () {}, onConfirm: () {},

    // content:
  );
  // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

// void showImagePickerBottomSheet({
//   required FileTypeModel fileTypeModel,
//   required Function(FileTypeModel) onSelected,
// }) {
//   Get.bottomSheet(
//     CustomPopupWithBlurWidget(
//       customBlurChildType: CustomBlurChildType.BOTTOMSHEET,
//       child: Container(
//         // width: screenWidthPercent(1),
//         decoration: BoxDecoration(
//           color: AppColors.whiteColor,
//           borderRadius: BorderRadiusDirectional.only(
//             topStart: Radius.circular(20),
//             topEnd: Radius.circular(20),
//           ),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(
//                 Icons.camera_alt,
//                 color: AppColors.darkPurpleColor,
//               ),
//               title: CustomText(
//                 textType: TextStyleType.SUBTITLE,
//                 text: tr('image_picker_camera'),
//                 textAlign: TextAlign.start,
//                 textColor: AppColors.darkGreyColor,
//               ),
//               onTap: () {
//                 FileUtil.pickFile(FileTypeEnum.CAMERA).then(
//                   (value) => onSelected(value),
//                 );
//                 Get.back();
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.image,
//                 color: AppColors.darkPurpleColor,
//               ),
//               title: CustomText(
//                 textType: TextStyleType.SUBTITLE,
//                 text: tr('image_picker_gallery'),
//                 textAlign: TextAlign.start,
//                 textColor: AppColors.darkGreyColor,
//               ),
//               onTap: () {
//                 FileUtil.pickFile(FileTypeEnum.GALLERY).then(
//                   (value) => onSelected(value),
//                 );
//                 Get.back();
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

void showAlertDialougForVistorUser({
  String? title,
  required String? middleText,
  required Function? onCancel,
  required Function? onConfirm,
}) {
  Get.defaultDialog(
    title: title ?? "",
    middleText: middleText ?? "",
    cancel: CustomButton(
      buttonTypeEnum: ButtonTypeEnum.NORMAL,
      onPressed: () {
        if (onCancel != null) onCancel();
      },
      width: screenWidth(3),
      text: tr("key_no"),
      backgroundColor: AppColors.mainRedColor,
    ),
    confirm: CustomButton(
      buttonTypeEnum: ButtonTypeEnum.NORMAL,
      onPressed: () {
        if (onConfirm != null) onConfirm();
      },
      width: screenWidth(3),
      text: tr("key_yes"),
    ),
    onCancel: () {}, onConfirm: () {},

    // content:
  );
  // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}