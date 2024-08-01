import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get_utils/get_utils.dart';

class StteperItem extends StatefulWidget {
  StteperItem({Key? key,required this.currentindex}) : super(key: key);

  int currentindex;

  @override
  State<StteperItem> createState() => _StteperItemState();
}

class _StteperItemState extends State<StteperItem> {
  late List<StepperData> stepperData ;

  @override
  void initState() {
    // TODO: implement initState
    stepperData =[
      StepperData(
          title: StepperText(
              AppStrings.pending,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
                color: Color(widget.currentindex >= 0 ?ColorCode.yellow : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Center(
              child:widget.currentindex >= 0 ?Icon(Icons.check,color: Color(ColorCode.semiBlack),) :SizedBox(),
            ),
          )),
      StepperData(
          title: StepperText(
              AppStrings.processing,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
                color: Color(widget.currentindex >=1 ?ColorCode.yellow : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: widget.currentindex >= 1 ?Icon(Icons.check,color: Color(ColorCode.semiBlack),) :SizedBox(),
          )),
      StepperData(
          title: StepperText(
              AppStrings.purchased,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
                color: Color(widget.currentindex >=2 ?ColorCode.yellow : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: widget.currentindex >= 2 ?Icon(Icons.check,color: Color(ColorCode.semiBlack),) :SizedBox(),
          )),
      StepperData(
          title: StepperText(
              AppStrings.completed,
              textStyle: TextStyles.textXSmall.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
                color: Color(widget.currentindex >= 3 ?ColorCode.yellow : ColorCode.gray6),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: widget.currentindex >= 3 ?Icon(Icons.check,color: Color(ColorCode.semiBlack),) :SizedBox(),
          )),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


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
        activeIndex: widget.currentindex,
        barThickness: 2,
      ),
    );
    // return Container(
    //   height: 110,
    //   child: Stepper(
    //       elevation: 0,
    //       currentStep: currentindex,
    //       type: StepperType.horizontal,
    //
    //       steps: [
    //         Step(
    //             state: StepState.complete,
    //             isActive: currentindex >= 0,
    //             title: Text(''),
    //             label: CustomText(AppStrings.pending.tr,
    //                 textStyle: TextStyles.textXSmall.copyWith(
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.w500,
    //                     color: const Color(ColorCode.semiBlack))),
    //             content: Container()),
    //         Step(
    //             state: StepState.complete,
    //             isActive: currentindex >= 1,
    //             title: Text(''),
    //
    //             label: CustomText(AppStrings.processing.tr,
    //                 textStyle: TextStyles.textXSmall.copyWith(
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.w500,
    //                     color: const Color(ColorCode.semiBlack))),
    //             content: Container()),
    //         Step(
    //             state: StepState.complete,
    //
    //             isActive: currentindex >= 2,
    //             title: Text(''),
    //             label: CustomText(AppStrings.purchased.tr,
    //                 textStyle: TextStyles.textXSmall.copyWith(
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.w500,
    //                     color: const Color(ColorCode.semiBlack))),
    //             content: Container()),
    //         Step(
    //             state: StepState.complete,
    //
    //             isActive: currentindex >= 3,
    //             label: CustomText(AppStrings.completed,
    //                 textStyle: TextStyles.textXSmall.copyWith(
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.w500,
    //                     color: const Color(ColorCode.semiBlack))),
    //             content: Container(),
    //             title: Text('')),
    //       ]),
    // );
  }
}
