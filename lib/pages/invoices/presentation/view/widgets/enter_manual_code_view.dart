
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class EnterManualCodeView extends StatelessWidget {

  EnterManualCodeView({Key? key,}) : super(key: key);

  TextEditingController textEditingController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(
            controller: textEditingController,
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.all(8),
              labelText: AppStrings.enterTheBarcode,

              labelStyle: TextStyle(
                  color: Color(ColorCode.semiBlack),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),

            ),
            onSave: (text) {},
            hint: '',
            inputType: TextInputType.text,
            label: AppStrings.enterTheBarcode,
          ),
          SizedBox(
            height: 32,
          ),
          CustomButtonContainer(
            CustomButton(
              CustomText(AppStrings.barcodeConfirmation,
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp)),
                  () {
                if(textEditingController.text.isNotEmpty){
                  Get.back(result: textEditingController.text);

                }
                  },
              backGroundColor: const Color(ColorCode.yellow),
            ),
            width: Get.width,
            height: 48.h,
          ),

        ],
      ),
    );
  }
}
