
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';


class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  final String label;
  final InputDecoration? decoration;
  final Function(String?) onSave;
  final Function()? onTap;

  final Function(String?)? onChange;
  final Function(String?)? nextFocus;
  final Function()? onTapShowHidePassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int maxLines;
  int? maxlength;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool enable;
  List<TextInputFormatter>? inputFormatters;

  CustomTextFormField(
      {Key? key,
        required this.hint,
        required this.onSave,
        required this.inputType,
        required this.label,
        this.onChange,
        this.nextFocus,
        this.validator,
        this.controller,
        this.onTap,
        this.obscureText = false,
        this.decoration,
        this.focusNode,
        this.maxLines = 1,
        this.maxlength,
        this.enable = false,
        this.isHiddenPassword = false,
        this.obscuringCharacter = " ",
        this.inputFormatters,
        this.onTapShowHidePassword,
        this.textInputAction,
        this.suffixIcon,
        this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSave,
      onChanged: onChange,
      validator: validator,
      cursorColor: const Color(ColorCode.gray2),
      onTap: onTap,
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      // enabled: enable,
      readOnly: enable,
      focusNode: focusNode,
      maxLength: maxlength,
      inputFormatters: inputFormatters ?? [],
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText && isHiddenPassword,
      obscuringCharacter: obscuringCharacter,
      textInputAction: textInputAction,
      onFieldSubmitted: nextFocus,
      style: TextStyles.textMedium.copyWith(
        color: const Color(ColorCode.black),
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
      decoration: decoration ??
          InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.textMedium.copyWith(
              color: const Color(ColorCode.black),
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            counterText: "",
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(ColorCode.gray),width: 1),
            ),

            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(ColorCode.gray),width: 1),
            ),
            disabledBorder:  const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(ColorCode.gray),width: 1),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14).r,
            prefixIcon: prefixIcon,
            suffixIcon: obscureText
                ? GestureDetector(
                onTap: onTapShowHidePassword,
                child: isHiddenPassword
                    ? const Icon(
                  Icons.visibility_off,
                  size: 24,
                  color: Color(0xff808080),
                )
                    : const Icon(
                  Icons.visibility,
                  size: 24,
                  color: Color(0xff808080),
                ))//AppSVGAssets.getWidget(AppSVGAssets.showPassword))
                : suffixIcon,
          ),
    );
  }
}
