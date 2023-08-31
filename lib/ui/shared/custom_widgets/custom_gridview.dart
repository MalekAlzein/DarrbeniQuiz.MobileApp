import 'package:flutter/material.dart';

class CustomGrideView extends StatelessWidget {
  final List<Widget> children;
  final int? lenghtGrid;

  CustomGrideView({required this.children, this.lenghtGrid});
//
  @override
  Widget build(BuildContext context) {
    if (children.length <= (lenghtGrid ?? 4)) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: children);
    } else {
      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children.sublist(0, lenghtGrid ?? 4)),
          CustomGrideView(children: children.sublist(lenghtGrid ?? 4)),
        ],
      );
    }
  }
}
