import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/data/models/apis/specialization_model.dart';
import 'package:flutter_templete/core/enums/current_specialization_enum.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_blur.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_popup_with_blur.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/text_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/course_details_view/subject_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
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
        child: SpinKitCircle(
          color: AppColors.darkPurpleColor,
        ),
      );
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
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
//                 text: tr('Key_image_picker_camera'),
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
//                 text: tr('Key_image_picker_gallery'),
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

void showSpecializationBottomSheet({
  required bool specialization,
  required SpecializationsModel specializationsModel,
}) {
  Get.bottomSheet(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.BOTTOMSHEET,
      child: Container(
        // height: screenHeight(4),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth(25),
            vertical: screenWidth(15),
          ),
          child: Column(
            children: [
              CustomButton(
                  backgroundColor: AppColors.darkPurpleColor,
                  text: tr('Key_specialization_master'),
                  buttonTypeEnum: ButtonTypeEnum.NORMAL,
                  onPressed: () {
                    homeController.getMasterSubjects();
                    setCurrentAppMainColor(SpecializationEnum.MASTER);
                    Get.to(() => SubjectView(
                          master: true,
                        ));
                    isGraduate = false;
                  }),
              screenHeight(35).ph,
              CustomButton(
                  backgroundColor: AppColors.lightCyanColor,
                  text: tr('Key_specialization_graduation'),
                  buttonTypeEnum: ButtonTypeEnum.NORMAL,
                  onPressed: () {
                    setCurrentAppMainColor(SpecializationEnum.GRADUATION);

                    homeController.getGraduationSubjects();

                    Get.to(() => SubjectView(
                          grad: true,
                        ));
                    isGraduate = true;
                  })
            ],
          ),
        ),
      ),
    ),
  );
}

void showQuestionTypeBottomSheet() {
  Get.bottomSheet(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.BOTTOMSHEET,
      child: Container(
        height: screenHeight(4),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth(25),
            vertical: screenWidth(15),
          ),
          child: Column(
            children: [
              CustomButton(
                  backgroundColor: AppColors.darkPurpleColor,
                  text: tr('Key_previous_quiz'),
                  buttonTypeEnum: ButtonTypeEnum.NORMAL,
                  onPressed: () {
                    // Get.to(() => const PreviousQuizView());
                  }),
              screenHeight(35).ph,
              CustomButton(
                  backgroundColor: AppColors.lightCyanColor,
                  text: tr('Key_book_questions'),
                  buttonTypeEnum: ButtonTypeEnum.NORMAL,
                  onPressed: () {
                    // Get.to(() {
                    //   BookQuestionView();
                    // });
                  })
            ],
          ),
        ),
      ),
    ),
  );
}

void showSudscribeDialog({
  // required bool isLoading,
  // required Function? onTap,
  Widget? widget,
}) {
  // RxBool loading = isLoading.obs;
  Get.dialog(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.DIALOUG,
      child: Container(
        width: screenWidth(1.2),
        height: screenHeight(2.5),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.darkPurpleColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGreyColor,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(9), vertical: screenWidth(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screenWidth(20).pw,
                  CustomImages(
                    imageName: 'img_pop_up',
                    imageSize: screenHeight(6.4),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back(closeOverlays: true);
                    },
                    child: CustomImages(
                      imageName: 'ic_close',
                      imageSize: screenHeight(50),
                    ),
                  ),
                ],
              ),
              screenHeight(80).ph,
              Material(
                color: AppColors.whiteColor,
                child: CustomText(
                  textType: TextStyleType.SMALL,
                  text: tr("key_please_subscribe"),
                  textColor: AppColors.darkGreyColor,
                ),
              ),
              screenHeight(90).ph,
              CustomButton(
                fontSize: screenWidth(32),
                buttonTypeEnum: ButtonTypeEnum.NORMAL,
                height: screenWidth(9),
                onPressed: () {
                  Get.to(() => const MainView());
                },
                backgroundColor: AppColors.darkPurpleColor,
                text: tr('key_login'),
              ),
              screenHeight(90).ph,
              Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      fontSize: screenWidth(40),
                      textType: TextStyleType.CUSTOM,
                      text: tr('key_donot_have_account'),
                      textColor: AppColors.darkGreyColor,
                    ),
                    CustomTextButton(
                      textSize: screenWidth(40),
                      title: tr('key_create_account_now'),
                      onTap: () {
                        // Get.to(() => const SignupView());
                      },
                      textColor: AppColors.darkPurpleColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

//!--
void sendFeedBack({
  // required bool isLoading,
  // required Function? onTap,
  Widget? widget,
}) {
  // RxBool loading = isLoading.obs;
  Get.dialog(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.DIALOUG,
      child: Container(
          width: screenWidth(1.1),
          height: screenHeight(1.9),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.darkPurpleColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGreyColor,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadiusDirectional.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(20), vertical: screenHeight(55)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    screenWidth(20).pw,
                    CustomImages(
                      imageName: 'img_feedback',
                      imageSize: screenHeight(6.4),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back(closeOverlays: true);
                      },
                      child: CustomImages(
                        imageName: 'ic_close',
                        imageSize: screenHeight(40),
                      ),
                    ),
                  ],
                ),
                Material(
                  child: CustomTextFormField(
                    maxLines: 16,
                    maxHeight: screenHeight(4),
                    hintText: tr('Key_send_feed'),
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.mainlightgrey,
                  ),
                ),
                screenHeight(90).ph,
                CustomButton(
                  buttonTypeEnum: ButtonTypeEnum.SMALL,
                  height: screenWidth(10),
                  onPressed: () {},
                  backgroundColor: AppColors.darkPurpleColor,
                  text: tr('Key_send'),
                ),
              ],
            ),
          )),
    ),
  );
}

int getCollegeIndex({required int id}) {
  return storage.getSpecializationsList().indexWhere(
        (element) => element.id == id,
      );
}

String get getUserSelectedCollege {
  return storage
          .getSpecializationsList()[
              getCollegeIndex(id: homeController.subbedSpecialization)]
          .specializationName ??
      '';
}

setCurrentAppMainColor(SpecializationEnum currentSpecial) {
  switch (currentSpecial) {
    case SpecializationEnum.MASTER:
      AppConfig.mainColor = AppColors.darkPurpleColor;
      AppConfig.secondaryColor = AppColors.normalCyanColor;

      break;
    case SpecializationEnum.GRADUATION:
      AppConfig.secondaryColor = AppColors.darkPurpleColor;
      AppConfig.mainColor = AppColors.normalCyanColor;
      break;
  }
}
