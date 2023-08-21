import 'package:flutter/material.dart';

class CustomGrideView extends StatelessWidget {
  final List<Widget> children;

  CustomGrideView({required this.children});

  @override
  Widget build(BuildContext context) {
    if (children.length <= 4) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: children);
    } else {
      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children.sublist(0, 4)),
          CustomGrideView(children: children.sublist(4)),
        ],
      );
    }
  }
}
