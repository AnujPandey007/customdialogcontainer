import 'package:flutter/material.dart';

class CustomDialogContainer extends StatelessWidget {
  final Color backgroundColor;
  final double elevation;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final ShapeBorder shape;
  final Widget child;

  const CustomDialogContainer({
    Key? key,
    required this.backgroundColor,
    required this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    required this.shape,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 0.0),
            child: Material(
              color: backgroundColor ,
              elevation: elevation,
              shape: shape,
              type: MaterialType.card,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}