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
  /// The [child] is the widget to apply the spin animation.
  const WidgetSpin({
    super.key,
    this.spinCount = 1,
    this.is3D = false,
    this.spinAxis = SpinAxis.y,
    this.alignment = Alignment.center,
    this.repeat = false,
    this.duration = const Duration(seconds: 1),
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

  /// The widget to apply the spin animation.
  final Widget child;

  // The optional custom animation controller
  final AnimationController? controller;

  @override
  State<WidgetSpin> createState() => _WidgetSpinState();
}

class _WidgetSpinState extends State<WidgetSpin>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.duration,
      );

      if (widget.repeat) {
        _animationController.repeat();
      } else {
        _animationController.forward();
      }
    } else {
      _animationController = widget.controller!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          Matrix4 matrix = Matrix4.identity();
          double animationValue = (_animationController.value * 2) * widget.spinCount;

          if (widget.spinAxis == SpinAxis.x) {
            matrix = Matrix4.identity()
              ..rotateX(
                animationValue * pi,
              );
          }

          if (widget.spinAxis == SpinAxis.z) {
            matrix = Matrix4.identity()
              ..rotateZ(
                animationValue * pi,
              );
          }

          if (widget.spinAxis == SpinAxis.y) {
            matrix = Matrix4.identity()
              ..rotateY(
                animationValue * pi,
              );
          }

          if (widget.is3D) {
            matrix.setEntry(3, 2, 0.001);
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
    _animationController.dispose();
    super.dispose();
  }
}