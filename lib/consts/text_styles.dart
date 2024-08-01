import 'package:fusion_warehouses/consts/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle  textXLarge = TextStyle(
      fontSize: 25.sp,
      color: const Color(ColorCode.black),
      fontWeight: FontWeight.w800,
      fontFamily: "CAIRO");
  static TextStyle textLarge = TextStyle(
      fontSize: 22.sp,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w700,
      height: 1.0454545454545454,
      fontFamily: "CAIRO");
  static const  textMedium = TextStyle(
      fontSize: 16,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w700,
      height: 1.5,
      fontFamily: "CAIRO");
  static TextStyle textSmall = const TextStyle(
      fontSize: 12,
      height: 1,
      color: Color(ColorCode.semiBlack),
      fontWeight: FontWeight.w700,
      fontFamily: "CAIRO");
  static TextStyle  textXSmall = TextStyle(
      fontSize: 11.sp,
      color: Color(ColorCode.black),
      fontWeight: FontWeight.w600,
      fontFamily: "CAIRO");

  static TextStyle bottomNavBarItemStyle =
      TextStyle(fontFamily: "CAIRO", height: 1, fontSize: 10.sp);
}
