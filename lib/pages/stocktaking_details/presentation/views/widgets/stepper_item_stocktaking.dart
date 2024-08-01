import 'package:flutter/material.dart';

import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/stteper_cell.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';


class StepperItemStocktaking extends StatelessWidget {
  StepperItemStocktaking({Key? key, required this.currentindex})
      : super(key: key);

  int currentindex;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<StepperData> stepperData= [
      StepperData(
          title: StepperText(AppStrings.startInventory,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(currentindex > 0
                    ? ColorCode.yellow
                    : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Center(
              child: currentindex > 0
                  ? Icon(
                Icons.check,
                color: Color(ColorCode.semiBlack),
              )
                  : SizedBox(),
            ),
          )),
      StepperData(
          title: StepperText(AppStrings.submitToMatch,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(currentindex > 1
                    ? ColorCode.yellow
                    : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: currentindex > 1
                ? Icon(
              Icons.check,
              color: Color(ColorCode.semiBlack),
            )
                : SizedBox(),
          )),
      StepperData(
          title: StepperText(AppStrings.adoptionInventoryResult,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(currentindex > 2
                    ? ColorCode.yellow
                    : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: currentindex > 2
                ? Icon(
              Icons.check,
              color: Color(ColorCode.semiBlack),
            )
                : SizedBox(),
          )),
      StepperData(
          title: StepperText(AppStrings.stockAdjustment,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(currentindex > 3
                    ? ColorCode.yellow
                    : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: currentindex > 3
                ? Icon(
              Icons.check,
              color: Color(ColorCode.semiBlack),
            )
                : SizedBox(),
          )),
      StepperData(
          title: StepperText(AppStrings.completed,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(currentindex >= 4
                    ? ColorCode.yellow
                    : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: currentindex >= 4
                ? Icon(
              Icons.check,
              color: Color(ColorCode.semiBlack),
            )
                : SizedBox(),
          )),

    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: AnotherStepper(
        stepperList: stepperData,
        stepperDirection: Axis.horizontal,
        iconWidth: 40,
        iconHeight: 40,
        activeBarColor: Color(ColorCode.yellow),
        inActiveBarColor: Color(ColorCode.gray6),
        inverted: true,
        verticalGap: 30,
        activeIndex: currentindex,
        barThickness: 2,
      ),
    );
  }
}

