import 'package:flutter/material.dart';

class CustomGrideView extends StatelessWidget {
  final List<Widget> children;
  final int? lengthGrid;

  CustomGrideView({required this.children, this.lengthGrid});

  @override
  Widget build(BuildContext context) {
    if (children.length <= (lengthGrid ?? 4)) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: children);
    } else {
      return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children.sublist(0, lengthGrid ?? 4)),
          CustomGrideView(children: children.sublist(lengthGrid ?? 4)),
        ],
      );
    }
  }
}
