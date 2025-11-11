import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core/theme/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isDisabled;
  final bool isLoading;
  final double borderRadius;
  final List<Color>? gradientColors;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double elevation;
  final bool showShadow;

  const ButtonWidget({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isDisabled = false,
    this.isLoading = false,
    this.borderRadius = 12,
    this.gradientColors,
    this.backgroundColor,
    this.textColor,
    this.height = 48,
    this.elevation = 4,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveGradient =
        gradientColors ??
        [AppColor.primary1, AppColor.primary2]; // default gradient
    final effectiveGradientDisabled =
        gradientColors ?? [Colors.grey.shade400, Colors.grey.shade400];
    final effectiveTextColor = textColor ?? Colors.white;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: showShadow ? elevation : 0,
      shadowColor: Colors.black26,
      child: Ink(
        decoration: BoxDecoration(
          gradient: isDisabled || isLoading
              ? LinearGradient(colors: effectiveGradientDisabled)
              : backgroundColor == null
              ? LinearGradient(colors: effectiveGradient)
              : null,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Colors.white24, // ✅ efek wave
          highlightColor: Colors.white10,
          onTap: isDisabled || isLoading ? null : onPressed,
          child: Container(
            height: height,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 30,
                  ),
                ] else ...[
                  if (icon != null) ...[
                    Icon(icon, color: effectiveTextColor, size: 20),
                    const SizedBox(width: 8),
                  ],
                  if (label != null) ...[
                    Text(
                      label!,
                      style: TextStyle(
                        color: effectiveTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
