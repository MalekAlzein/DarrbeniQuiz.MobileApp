import 'package:flutter/material.dart';

import '../utils.dart';

class CustomChipList extends StatelessWidget {
  const CustomChipList(
      {super.key, this.direction = Axis.horizontal, required this.children});
  final Axis? direction;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(10)),
      child: Wrap(
        direction: direction!,
        children: children,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: screenWidth(20),
        spacing: screenWidth(20),
        alignment: WrapAlignment.center,
      ),
    );
  }
}
