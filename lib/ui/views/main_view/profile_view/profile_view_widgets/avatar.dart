import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/file_type_enum.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_small_button.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_controller.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.controller,
  });
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        InkWell(
          // onTap: controller.avatar.value.path == null &&
          //         controller.userProfileModel.value.avatar == null
          //     ? () {
          //         showImagePickerBottomSheet(
          //             fileTypeModel: controller.avatar.value,
          //             onSelected: (value) {
          //               controller.avatar.value = value;
          //             });
          //       }
          //     : null,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // child: controller.avatar.value.type != FileTypeEnum.FILE &&
            //         controller.avatar.value.path != null
            //     ? Image.file(
            //         File(
            //           controller.avatar.value.path!,
            //         ),
            //         fit: BoxFit.cover,
            //       )
            //     : controller.userProfileModel.value.avatar != null &&
            //             controller.userProfileModel.value.avatar!.isNotEmpty
            //         ? CachedNetworkImage(
            //             imageUrl: controller.userProfileModel.value.avatar ??
            //                 controller.avatar.value.path ??
            //                 "",
            //             fit: BoxFit.cover,
            //           )
            //         : controller.avatar.value.path == null ||
            //                 controller.avatar.value.path!.isEmpty
            //             ? Icon(
            //                 Icons.image,
            //                 color: AppColors.darkPurpleColor,
            //               )
            //             : controller.avatar.value.type != FileTypeEnum.FILE
            //                 ? Image.file(
            //                     File(
            //                       // controller.avatar.value.path!,
            //                     ),
            //                     fit: BoxFit.cover,
            //                   )
            //                 : Icon(
            //                     Icons.file_copy,
            //                     color: AppColors.darkPurpleColor,
            //                   ),
            width: screenWidth(3.5),
            height: screenWidth(3.5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColors.normalCyanColor,
              ),
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Visibility(
          // visible: controller.editMode.value &&
          //     controller.userProfileModel.value.avatar != null,
          child: CustomSmallButton(
            imageName: "ic_edit",
            onTap: () {
              // controller.pickAvatar();
            },
            customSmallButtonTypeEnum: CustomSmallButtonTypeEnum.SMALL,
          ),
        )
      ],
    );
  }
}
