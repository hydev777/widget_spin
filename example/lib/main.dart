import 'package:flutter/material.dart';
import 'package:widget_spin/widget_spin.dart';

void main() {
  runApp(const WidgetSpinExample());
}

class WidgetSpinExample extends StatefulWidget {
  const WidgetSpinExample({super.key});

  @override
  State<WidgetSpinExample> createState() => _WidgetSpinExampleState();
}

class _WidgetSpinExampleState extends State<WidgetSpinExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 6),
  )..repeat();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetSpin(
                duration: Duration(seconds: 60),
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text('This is a test'),
                ),
              ),
              WidgetSpin(
                controller: _animationController,
                spinAxis: SpinAxis.x,
                is3D: true,
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('This is a test 2'),
                ),
              ),
              WidgetSpin(
                controller: _animationController,
                spinAxis: SpinAxis.x,
                alignment: Alignment.topCenter,
                duration: Duration(seconds: 10),
                curve: Curves.easeInToLinear,
                spinCount: 2,
                is3D: true,
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Text('This is a test 3'),
                ),
              ),
              WidgetSpin(
                spinCount: 10,
                repeat: true,
                curve: Curves.elasticIn,
                duration: Duration(seconds: 4),
                spinAxis: SpinAxis.z,
                alignment: Alignment.center,
                child: Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('This is a test 4'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
