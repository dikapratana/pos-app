import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Gradient? gradient;

  const TextWidget(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.inter(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
    );

    // ✅ jika tidak ada gradient, tampilkan Text biasa
    if (gradient == null) {
      return Text(
        text,
        style: textStyle,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      );
    }

    // ✅ jika ada gradient, pakai ShaderMask
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return gradient!.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        style: textStyle.copyWith(
          color: Colors.white,
        ), // warna diabaikan, pakai shader
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
