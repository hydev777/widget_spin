# Widget Spin

[![widget_spin](https://img.shields.io/pub/v/widget_spin?label=widget_spin)](https://pub.dev/packages/widget_spin)

Widget Spin is a Flutter package that enables you to effortlessly apply spinning animations to widgets along the X, Y, or Z axes. Customize spin duration, axis of rotation. Perfect for adding dynamic effects and interactivity to your UI!

## Preview

![widget_spin_preview_2](https://github.com/user-attachments/assets/32636929-1516-460f-a2fe-2c0148d58ada)

## How to use?

```dart
  WidgetSpin(
    repeat: true,
    child: Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
      child: Text('This is a test'),
    ),
  );
```
## Params

```dart
  WidgetSpin(
    controller: _animationController,
    spinAxis: SpinAxis.x,
    alignment: Alignment.topCenter,
    duration: Duration(seconds: 10),
    curve: Curves.elasticIn,
    spinCount: 2,
    is3D: true,
    child: Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
      ),
      child: Text('This is a test 2'),
    ),
  ),
```
## Examples

Check the example app in [example](https://github.com/hydev777/widget_spin/tree/main/example)

## Constributor

<table>
  <tr>
    <td align="center" style="vertical-align: top;"><a href="https://github.com/hydev777"><img src="https://avatars.githubusercontent.com/hydev777" width="100px;" alt=""/><br /><sub><b>Wilson Toribio</b></sub></a></td>
</table>
<br/>

## License
```
MIT License

Copyright (c) 2024 D-velopers

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

