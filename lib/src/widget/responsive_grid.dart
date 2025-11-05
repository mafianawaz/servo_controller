import 'package:flutter/material.dart';


class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final int? mobileCrossAxisCount;
  final int? tabletCrossAxisCount;
  final int? desktopCrossAxisCount;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing = 20,
    this.mobileCrossAxisCount,
    this.tabletCrossAxisCount,
    this.desktopCrossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        int crossAxisCount;

        if (maxWidth < 600) {
          crossAxisCount = mobileCrossAxisCount ?? 1;
        } else if (maxWidth < 900) {
          crossAxisCount = tabletCrossAxisCount ?? 2;
        } else {
          crossAxisCount = desktopCrossAxisCount ?? 4;
        }

        double itemWidth =
            (maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children
              .map((child) => SizedBox(width: itemWidth, child: child))
              .toList(),
        );
      },
    );
  }
}
