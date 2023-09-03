import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/apis/slider_model.dart';
import 'package:get/get.dart';
import '../colors.dart';
import '../utils.dart';

class CustomSlider extends StatefulWidget {
  final List<SliderModel> items;
  final double? imageHeight;
  final Function? onTap;
  const CustomSlider({
    super.key,
    required this.items,
    this.imageHeight,
    this.onTap,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  RxInt currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.items.map((item) {
            return Container(
              child: Center(
                child: InkWell(
                  onTap: () {
                    if (widget.onTap != null) widget.onTap!();
                  },
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl ?? "",
                    fit: BoxFit.cover,
                    width: screenWidth(0.9),
                  ),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: widget.imageHeight ?? screenWidth(2.7),
            reverse: true,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
          ),
        ),
        SizedBox(height: screenWidth(26)),
        Obx(
          () {
            print(currentIndex);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.map((item) {
                int index = widget.items.indexOf(item);
                return Container(
                  width: screenWidth(45),
                  height: screenWidth(45),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth(65)),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: currentIndex.value == index
                        ? AppColors.darkPurpleColor
                        : AppColors.darkGreyColorTextField,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
