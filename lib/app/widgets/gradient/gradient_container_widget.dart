import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class GradientContainerWidget extends StatelessWidget {
  final Widget? child;
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final double borderRadius;
  final double blurRadius;
  final Offset shadowOffset;
  final Color shadowColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? width;
  final double? height;
  final bool showShadow;
  final Border? border;
  final Color backgroundColor;
  final bool gradientBorder;
  final double borderWidth;

  const GradientContainerWidget({
    super.key,
    this.child,
    this.colors = const [AppColor.primary1, AppColor.primary2],
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.borderRadius = 16,
    this.blurRadius = 8,
    this.shadowOffset = const Offset(0, 8),
    this.shadowColor = const Color(0x1A000000),
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.width,
    this.height,
    this.showShadow = true,
    this.border,
    this.backgroundColor = Colors.white,
    this.gradientBorder = false,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    if (!gradientBorder) {
      // ✅ Normal gradient background (default)
      return Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors, begin: begin, end: end),
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: blurRadius,
                    offset: shadowOffset,
                  ),
                ]
              : [],
        ),
        child: Padding(padding: padding, child: child),
      );
    }

    // ✅ Gradient border only
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: blurRadius,
                  offset: shadowOffset,
                ),
              ]
            : [],
      ),
      child: CustomPaint(
        painter: _GradientBorderPainter(
          colors: colors,
          begin: begin,
          end: end,
          borderRadius: borderRadius,
          borderWidth: borderWidth,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            color: backgroundColor,
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final double borderRadius;
  final double borderWidth;

  _GradientBorderPainter({
    required this.colors,
    required this.begin,
    required this.end,
    required this.borderRadius,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientBorderPainter oldDelegate) {
    return oldDelegate.colors != colors ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.borderRadius != borderRadius;
  }
}
