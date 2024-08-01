import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';

showDatePickerFN(BuildContext context,DateTime? dateTime) async{
  return showDatePicker(
      cancelText: AppStrings.cancel,
      confirmText: AppStrings.confirm,
      useRootNavigator: true,
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              onBackground: Color(ColorCode.black),
              onPrimary: Color(ColorCode.black),
              primary: Color(ColorCode.yellow),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(ColorCode.semiBlack),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      context: context,
      initialDate: dateTime ??DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
}


showDatePickerFNForInvoice(BuildContext context,DateTime? dateTime,bool state) async{
  return showDatePicker(
      cancelText: AppStrings.cancel,
      confirmText: AppStrings.confirm,
      useRootNavigator: true,
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              onBackground: Color(ColorCode.black),
              onPrimary: Color(ColorCode.black),
              primary: Color(ColorCode.yellow),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(ColorCode.semiBlack),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      context: context,
      initialDate: dateTime ??DateTime.now(),
      firstDate:state?  DateTime(2000):DateTime.now(),
      lastDate: !state?  DateTime(2100):DateTime.now());
}
