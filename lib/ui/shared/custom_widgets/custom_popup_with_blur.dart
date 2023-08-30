import 'package:flutter/cupertino.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_blur.dart';

class CustomPopupWithBlurWidget extends StatelessWidget {
  const CustomPopupWithBlurWidget({
    super.key,
    required this.child,
    required this.customBlurChildType,
  });
  final CustomBlurChildType customBlurChildType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: CustomBlurWidget(),
        ),
        if (customBlurChildType == CustomBlurChildType.BOTTOMSHEET) ...[
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: child,
          )
        ],
        if (customBlurChildType == CustomBlurChildType.DRAWER) ...[
          PositionedDirectional(
            top: 0,
            bottom: 0,
            start: 0,
            child: child,
          ),
        ],
        if (customBlurChildType == CustomBlurChildType.DIALOUG) ...[
          Center(child: child),
        ],
      ],
    );
  }
}
