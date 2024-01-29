import 'package:flutter/material.dart';
import 'package:innovation/dimensions/dimension_manager.dart';
import 'package:innovation/theme/app_color.dart';
import 'package:innovation/utils/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? textColor;
  final Color? labelColor;
  final Color? iconColor;
  final Color? fillColor;
  final bool? enableBorder;
  final String hint;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final dynamic validator;
  final int? maxLine;
  final dynamic onChanged;
  final dynamic onSaved;
  final bool isPassword;
  final bool isEnabled;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  const CustomTextFormField({
    super.key,
    this.textColor,
    this.iconColor,
    this.labelColor,
    this.fillColor,
    this.enableBorder = true,
    required this.hint,
    this.prefixIcon,
    required this.controller,
    required this.validator,
    this.maxLine,
    this.onChanged,
    this.onSaved,
    this.isPassword = false,
    this.isEnabled = true,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.focusBorderColor,
    this.errorBorderColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 6),
            child: Icon(
              widget.prefixIcon,
              color: AppColor.grey,
              size: 20,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              cursorColor: AppColor.primaryColor,
              obscureText: widget.isPassword ? isObscure : false,
              maxLines: widget.maxLine ?? 1,
              enabled: widget.isEnabled,
              style: TextStyle(color: widget.textColor),
              decoration: InputDecoration(
                fillColor: widget.fillColor ?? AppColor.swatch,
                filled: widget.fillColor == null ? false : true,
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.symmetric(
                    horizontal:
                        widget.maxLine != null ? DM.width10 : DM.width10,
                    vertical: DM.width10 + DM.width5),
                hintText: widget.hint,
                hintStyle: subHint.copyWith(color: AppColor.grey),
                enabledBorder: widget.enableBorder!
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.enabledBorderColor ?? AppColor.swatch,
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    : null,
                floatingLabelStyle: mainBody.copyWith(
                    color: widget.labelColor ?? AppColor.black),
                focusedBorder: widget.enableBorder!
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.focusBorderColor ??
                                AppColor.primaryColor,
                            width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    : null,
                focusedErrorBorder: widget.enableBorder!
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.errorBorderColor ?? Colors.red,
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    : null,
                errorBorder: widget.enableBorder!
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.errorBorderColor ?? Colors.red,
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    : null,
                errorStyle: mainBody.copyWith(
                    color: widget.errorBorderColor ?? Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
