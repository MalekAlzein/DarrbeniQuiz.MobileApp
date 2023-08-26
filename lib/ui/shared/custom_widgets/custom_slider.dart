import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/slider_model.dart';
import 'package:flutter_templete/core/enums/url_type.dart';
import 'package:flutter_templete/core/utils/url_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_controller.dart';
import 'package:get/get.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
    required this.homeController,
    required this.silderList,
  });

  final HomeController homeController;
  final List<SilderModel> silderList;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  RxInt _current = 0.obs;
  // final CarouselController _controller = CarouselController();
  // final List<String> imgList = [
  //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  // ];
  // int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            CarouselSlider(
              items: List.generate(
                widget.homeController.silderList.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      UrlLauncherUtil().startLaunchUrl(
                        url: Uri.parse(
                            widget.homeController.silderList[index].link!),
                        type: UrlType.WEB,
                      );
                      // widget.homeController.silderList[index].link;
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          widget.homeController.silderList[index].imageUrl ??
                              "",
                    ),
                  );
                },
              ),
              //carouselController: _controller,
              options: CarouselOptions(
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeFactor: 0.9,
                  onPageChanged: (index, reason) {
                    _current.value = index;
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  widget.homeController.silderList.asMap().entries.map((entry) {
                return Container(
                  width: screenWidth(50),
                  height: screenWidth(50),
                  margin: EdgeInsets.symmetric(
                    vertical: screenWidth(30),
                    horizontal: screenWidth(70),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.darkPurpleColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.0),
                    border: Border.all(
                      color: AppColors.darkPurpleColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
