import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';

class CustomEditTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  final InputDecoration? decoration;
  final Function(String?) onSave;
  final Function()? onTapShowHidePassword;
  final Function(String?)? onChange;
  final String? Function(String?)? validator ;
  int maxLines;
  int maxLength;
  Widget? suffixIcon;
  bool readOnly;
  Widget? prefixIcon;
  CustomEditTextFormField(
      {Key? key,
        required this.hint,
        required this.onSave,
        required this.inputType,
        this.validator,this.controller,
        this.readOnly = false,
        this.onChange,
        this.obscureText = false,
        this.decoration,
        this.maxLines = 1,
        this.maxLength = 100,
        this.isHiddenPassword = false,
        this.prefixIcon,
        this.obscuringCharacter = " ",
        this.onTapShowHidePassword,this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSave,
      validator: validator,
      cursorColor: Colors.black.withOpacity(.1),
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChange,
      readOnly: readOnly,
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      obscureText: obscureText && isHiddenPassword,
      obscuringCharacter: obscuringCharacter,
      style: TextStyles.textMedium.copyWith(color: Color(ColorCode.black),fontWeight: FontWeight.w300,fontSize: 20,fontFamily: 'CAIRO'),
      decoration: decoration??InputDecoration(
        hintText: hint,counterText: '',
        hintStyle: TextStyles.textXSmall.copyWith(color: Color(ColorCode.secondryGray),fontWeight: FontWeight.w300,fontSize: 16,fontFamily: 'CAIRO'),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),borderSide:  BorderSide(color: Color(ColorCode.thirdGray), width: 1),),
        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),borderSide:   BorderSide(color: Color(ColorCode.thirdGray), width: 1),),
        focusedBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),borderSide:  BorderSide(color: Color(ColorCode.thirdGray), width: 1),),
        errorBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),borderSide:  BorderSide(color: Colors.red, width: 1),),
        focusedErrorBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),borderSide:  BorderSide(color: Colors.red, width: 1),),
        disabledBorder:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)),borderSide:  BorderSide(color: Color(ColorCode.thirdGray), width: 1),),
        fillColor:Color(ColorCode.thirdGray),
        filled: true,
        contentPadding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        prefixIcon: prefixIcon,
      ),
    );
  }
}