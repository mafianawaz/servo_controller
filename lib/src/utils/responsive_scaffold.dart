
import 'package:flutter/material.dart';
import 'package:servo_controller/src/utils/responsive.dart';

import '../widget/custom_appbar.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget child;

  const ResponsiveScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final r = context.responsive; // your existing responsive class
    double maxWidth;

    if (r.isMobile) {
      maxWidth = r.wp(90);
    } else if (r.isTablet) {
      maxWidth = r.wp(190);
    } else {
      maxWidth = double.infinity; // fixed width for large desktops/laptops
    }

    final content = SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          minHeight: r.hp(100), // fill screen vertically
        ),
        child: child,
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(),
      body:  SafeArea(child: content),
    );
  }
}
