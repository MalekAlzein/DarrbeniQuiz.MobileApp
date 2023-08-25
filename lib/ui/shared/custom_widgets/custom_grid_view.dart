import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({
    required this.children,
    this.length = 4,
  });

  final List<Widget> children;
  final int length;

  @override
  Widget build(BuildContext context) {
    if (children.length <= length) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: length == 3
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceAround,
            children: children.sublist(0, length),
          ),
          CustomGridView(
            length: length,
            children: children.sublist(length),
          ),
        ],
      );
    }
  }
}
