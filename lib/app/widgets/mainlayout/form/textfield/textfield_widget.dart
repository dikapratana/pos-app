import 'package:flutter/material.dart';

import '../../../text/text_widget.dart';

class TextfieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final String? hint;
  final bool isPassword;
  final bool readOnly;
  final bool enabled;
  final bool showClearButton;
  final bool filled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextfieldWidget({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hint,
    this.isPassword = false,
    this.readOnly = false,
    this.enabled = true,
    this.showClearButton = false,
    this.filled = true,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  late final TextEditingController _controller;
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
    _controller =
        widget.controller ??
        TextEditingController(text: widget.initialValue ?? '');
  }

  void _clear() {
    _controller.clear();
    widget.onChanged?.call('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = widget.borderColor ?? Colors.grey.shade400;
    final focusedColor = widget.focusedBorderColor ?? theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          TextWidget(widget.label!, fontWeight: FontWeight.w500, fontSize: 14),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: _controller,
          obscureText: _obscure,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          style: widget.textStyle ?? const TextStyle(fontSize: 14),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          validator: widget.validator,
          onChanged: (value) {
            widget.onChanged?.call(value);
            if (widget.showClearButton) setState(() {});
          },
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hint,
            hintStyle:
                widget.hintStyle ??
                TextStyle(color: Colors.grey.shade500, fontSize: 12),
            filled: widget.filled,
            fillColor: widget.fillColor ?? Colors.white,
            suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0.0),
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0.0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 14, right: 4),
              child: widget.prefixIcon,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.isPassword)
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 14),
                    child: InkWell(
                      child: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      onTap: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                if (widget.showClearButton && _controller.text.isNotEmpty)
                  IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: _clear,
                  ),
                if (widget.suffixIcon != null) widget.suffixIcon!,
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: focusedColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 1.8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
