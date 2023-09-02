import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key, this.activeColor, required this.svgName, this.firstText, this.secondText, this.thirdText, this.onTap}) ;

  final Color? activeColor;
  final String? svgName;
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final Function? onTap;


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(screenWidth(3)),
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          width: screenWidth(1),
          height: screenWidth(3),
          decoration: BoxDecoration(color: activeColor ?? AppColors.darkPurpleColor),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: screenWidth(20)),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: (){
                    onTap;
                  },
                  child: SvgPicture.asset(
                    'assets/svgs/${svgName??'ic_back'}.svg',
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: screenWidth(30)),
                if (firstText != null) ...[
                  // screenWidth(35).pw,
                  Center(
                    child: CustomText(
                      textType: TextStyleType.SUBTITLE,
                      text: firstText!,
                      textColor: AppColors.whiteColor,
                    ),
                  ),
                ],
                if (secondText != null) ...[
                  Center(
                    child: CustomText(
                      textType: TextStyleType.SUBTITLE,
                      text: " / ${secondText!}",
                      textColor: AppColors.whiteColor,
                    ),
                  ),
                ],
                if (thirdText != null) ...[
                  Center(
                    child: CustomText(
                      textType: TextStyleType.SUBTITLE,
                      text: " / ${thirdText!}",
                      textColor: AppColors.whiteColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child =>SizedBox();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(screenWidth(1), screenWidth(3));


}







class CustomClipPath extends CustomClipper<Path> {
  var radius = 8.0;
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9956692);
    path_0.cubicTo(
        size.width * 0.1023160,
        size.height * 0.6877908,
        size.width * 0.3315975,
        size.height * 0.7502392,
        size.width * 0.4827750,
        size.height * 0.7914154);
    path_0.lineTo(size.width * 0.4827800, size.height * 0.7914154);
    path_0.cubicTo(
        size.width * 0.4872275,
        size.height * 0.7926308,
        size.width * 0.4916075,
        size.height * 0.7938231,
        size.width * 0.4959150,
        size.height * 0.7949846);
    path_0.cubicTo(
        size.width * 0.5370950,
        size.height * 0.8061231,
        size.width * 0.5762375,
        size.height * 0.8183692,
        size.width * 0.6133025,
        size.height * 0.8299692);
    path_0.cubicTo(
        size.width * 0.7922475,
        size.height * 0.8859615,
        size.width * 0.9227175,
        size.height * 0.9267923,
        size.width,
        size.height * 0.7537508);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.9956692);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}