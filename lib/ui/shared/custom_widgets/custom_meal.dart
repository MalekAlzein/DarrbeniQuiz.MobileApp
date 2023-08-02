import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomMeal extends StatelessWidget {
  const CustomMeal({
    super.key,
    required this.imageUrl,
    required this.text,
    this.textColor,
  });
  final String imageUrl;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenHieght(3),
          width: screenWidth(1),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            // imageUrl: mealList[index].images!.length > 0
            //     ? getFullImageUrl(mealList[index].images![0])
            //     : '',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        (screenWidth(30)).ph,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(22),
          ),
          child: CustomText(
            textAlign: TextAlign.start,
            text: text,
            // text: mealList[index].name ?? '',
            textColor: textColor ?? AppColors.mainGrey,
            fontSize: screenWidth(20),
          ),
        ),
        (screenWidth(30)).ph,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(2),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/star.png',
                color: AppColors.mainOrangeColor,
                width: screenWidth(18),
                height: screenWidth(18),
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: ' 4.9 ',
                textColor: AppColors.mainOrangeColor,
                // fontSize: ,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: '(124 ratings) Café',
                textColor: AppColors.mainlightgrey,
                // fontSize: ,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: ' . ',
                textColor: AppColors.mainOrangeColor,
                // fontSize: ,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: 'Western Food',
                textColor: AppColors.mainlightgrey,
                // fontSize: ,
              )
            ],
          ),
        )
      ],
    );
  }
}
