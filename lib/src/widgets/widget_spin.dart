import 'dart:math' show pi;
import 'package:flutter/material.dart';

import '../enums/enums.dart';

/// A animation widget to apply spin animation
/// to a widget.

class WidgetSpin extends StatefulWidget {
  /// Creates a [WidgetSpin] with default values.
  ///
  /// The [spinCount] is the number of spins the widget will have per duration cicle.
  ///
  /// The [is3D] is if the widget will have perspective.
  ///
  /// The [spinAxis] is the axis (x, y or z) in chich the spin will be applied to the widget.
  ///
  /// The [alignment] is the aligment of the spin.
  ///
  /// The [repeat] is if the animation spin will be repeated.
  ///
  /// The [duration] is the duration of the spinCount.
  ///
  /// The [curve] is the curve animation of the spin
  ///
  /// The [controller] is the animation controller to control the spin widget
  ///
  /// The [child] is the widget to apply the spin animation.
  const WidgetSpin({
    super.key,
    this.spinCount = 1,
    this.is3D = false,
    this.spinAxis = SpinAxis.y,
    this.alignment = Alignment.center,
    this.repeat = false,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.linear,
    this.controller,
    required this.child,
  });

  /// The number of spins the widget will have per duration cicle.
  final int spinCount;

  /// If the widget will have perspective
  final bool is3D;

  /// The axis (x, y or z) in chich the spin will be applied to the widget.
  final SpinAxis spinAxis;

  /// The aligment of the spin.
  final Alignment alignment;

  /// If the animation spin will be repeated.
  final bool repeat;

  /// The duration of the spinCount.
  final Duration duration;

  /// The curve animation of the spin
  final Curve curve;

  /// The optional custom animation controller
  final AnimationController? controller;

  /// The widget to apply the spin animation.
  final Widget child;

  @override
  State<WidgetSpin> createState() => _WidgetSpinState();
}

class _WidgetSpinState extends State<WidgetSpin>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animationValue =
      Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: animationController,
      curve: widget.curve,
    ),
  );
  late Matrix4 matrix;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      animationController = AnimationController(
        vsync: this,
        duration: widget.duration,
      );

      if (widget.repeat) {
        animationController.repeat();
      } else {
        animationController.forward();
      }
    } else {
      animationController = widget.controller!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          if (widget.is3D) {
            matrix = Matrix4.identity()
            ..setEntry(3, 2, 0.001);
          } else {
            matrix = Matrix4.identity();
          }

          double rotationValue =
              ((animationValue.value * 2) * widget.spinCount) * pi;

          if (widget.spinAxis == SpinAxis.x) {
            matrix = matrix..rotateX(rotationValue);
          }

          if (widget.spinAxis == SpinAxis.z) {
            matrix = matrix..rotateZ(rotationValue);
          }

          if (widget.spinAxis == SpinAxis.y) {
            matrix = matrix..rotateY(rotationValue);
          }

          return Transform(
            alignment: widget.alignment,
            transform: matrix,
            child: widget.child,
          );
        });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
