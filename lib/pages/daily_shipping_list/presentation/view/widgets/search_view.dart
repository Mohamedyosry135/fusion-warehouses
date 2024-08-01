import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  SearchView({
    Key? key,
  }) : super(key: key);

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFieldContainer(
         CustomTextFormField(
              onSave: (text) {},
              hint: AppStrings.search,
           controller: textEditingController,
              inputType: TextInputType.text,
              label: AppStrings.search,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButtonContainer(
            CustomButton(
              CustomText(AppStrings.search,
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
          SizedBox(
            height: 24,
          ),
          CustomButtonContainer(
            decoration: BoxDecoration(
              border: Border.all(color: Color(ColorCode.semiBlack), width: 1),
              borderRadius: BorderRadius.circular(25),
            ),
            CustomButton(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppSVGAssets.getWidget(
                    AppSVGAssets.code,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(AppStrings.scanTheProductBarcode,
                      textStyle: TextStyles.textMedium.copyWith(
                          color: Color(ColorCode.semiBlack),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp)),
                ],
              ),
              () async{
                scanBarcode().then((value){
                  print(value);
                  Get.back(result: value =="-1" ? null:value);
                });
              },
              backGroundColor: const Color(ColorCode.white),
            ),
            width: Get.width,
            height: 48.h,
          ),
        ],
      ),
    );
  }
  Future<String> scanBarcode() async {
    // var result = await BarcodeScanner.scan(options:ScanOptions(strings:{"cancel":translator.translate('cancel'),"flash_on":translator.translate('flash_on'),"flash_off":translator.translate('flash_off')} ));
    // BarcodeScanner.scan(options:ScanOptions(strings:{"cancel":translator.translate('cancel'),"flash_on":translator.translate('flash_on'),"flash_off":translator.translate('flash_off')} ));
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", 'Cancel', true, ScanMode.DEFAULT);
    print("BarcodeScannerBarcodeScanner:: ${barcodeScanRes}");
    return barcodeScanRes;
  }
}
