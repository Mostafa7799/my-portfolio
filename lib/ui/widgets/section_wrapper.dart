import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  const SectionWrapper({
    super.key,
    required this.child,
    this.background,
  });

  final Widget child;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width >= 1200
        ? 120.0
        : width >= 900
            ? 72.0
            : 20.0;

    return Container(
      width: double.infinity,
      color: background,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 56),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
