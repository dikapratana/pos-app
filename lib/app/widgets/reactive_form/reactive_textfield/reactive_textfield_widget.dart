import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../text/text_widget.dart';

class ReactiveTextfieldWidget extends StatefulWidget {
  final String formControlName;
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
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Map<String, String Function(Object)>? validationMessages;

  const ReactiveTextfieldWidget({
    super.key,
    required this.formControlName,
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
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.validationMessages,
  });

  @override
  State<ReactiveTextfieldWidget> createState() =>
      _ReactiveTextfieldWidgetState();
}

class _ReactiveTextfieldWidgetState extends State<ReactiveTextfieldWidget> {
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = widget.borderColor ?? Colors.grey.shade400;
    final focusedColor = widget.focusedBorderColor ?? theme.colorScheme.primary;

    final form = ReactiveForm.of(context);
    final control = (form is FormGroup)
        ? form.control(widget.formControlName)
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          TextWidget(widget.label!, fontWeight: FontWeight.w500, fontSize: 14),
          const SizedBox(height: 6),
        ],
        ReactiveTextField<String>(
          formControlName: widget.formControlName,
          obscureText: _obscure,
          readOnly: widget.readOnly,
          style: widget.textStyle ?? const TextStyle(fontSize: 14),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          validationMessages: widget.validationMessages,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hint,
            hintStyle:
                widget.hintStyle ??
                TextStyle(color: Colors.grey.shade500, fontSize: 12),
            filled: widget.filled,
            fillColor: widget.fillColor ?? Colors.white,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0.0,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0.0,
            ),
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
                if (widget.showClearButton &&
                    (control?.value?.toString().isNotEmpty ?? false))
                  IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    onPressed: () => control?.reset(value: ''),
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
