import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/main_view/important_questions_view/important_questions_controller.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/utils.dart';

class ImportantQuestionsView extends StatefulWidget {
  const ImportantQuestionsView({Key? key}) : super(key: key);

  @override
  State<ImportantQuestionsView> createState() => _ImportantQuestionsViewState();
}

class _ImportantQuestionsViewState extends State<ImportantQuestionsView> {
  @override
  Widget build(BuildContext context) {
    ImportantQuestionsController controller =
        Get.put(ImportantQuestionsController());

    return RefreshIndicator(
      onRefresh: () {
        return controller.getImportantQuestions();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenHeight(80), vertical: screenHeight(30)),
        child: ListView(
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    height: 50,
                    color: AppColors.darkGreyColorTextField,
                    child: InkWell(
                      onTap: () {
                        Get.to((MainView()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: controller.importantQuestions[index].data![0]
                                    .questionContent ??
                                '',
                            textType: TextStyleType.SMALL,
                          ),
                          InkWell(
                            child: SvgPicture.asset("assets/svgs/ic_arrow.svg"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return 20.ph;
                },
                itemCount: controller.importantQuestions.length)
          ],
        ),
      ),
    );
  }
}
