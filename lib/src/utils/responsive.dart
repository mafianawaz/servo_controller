import 'package:flutter/widgets.dart';

/// Responsive utility class
class Responsive {
  final BuildContext context;
  Responsive(this.context);

  double get _width => MediaQuery.of(context).size.width;
  double get _height => MediaQuery.of(context).size.height;

  /// Breakpoints
  bool get isMobile => _width < 600;
  bool get isTablet => _width >= 600 && _width < 1024;
  bool get isDesktop => _width >= 1024;

  /// Font scaling (base = 375px width)
  double sp(num size) => size * (_width / 375).clamp(0.8, 1.2);

  /// Dynamic padding/margin/icon size (base = 375px width)
  double dp(num size) => size * (_width / 375).clamp(0.8, 1.3);

  /// Width percentage of screen
  double wp(num percent) => _width * percent / 100;

  /// Height percentage of screen
  double hp(num percent) => _height * percent / 100;
}

/// Extensions for shorter usage
extension ResponsiveExt on BuildContext {
  Responsive get responsive => Responsive(this);
}
