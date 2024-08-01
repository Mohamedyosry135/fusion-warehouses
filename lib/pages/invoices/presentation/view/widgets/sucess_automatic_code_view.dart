
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class SucessCodeView extends StatelessWidget {
  String? sucessname;
  String ?buttomname;
final WarehouseOrderItems orderItems;
Function()? onTap;
  SucessCodeView({Key? key, required this.orderItems,this.sucessname,this.buttomname, this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
      AppSVGAssets.getWidget(AppSVGAssets.okay,
         ),
            SizedBox(width: 8,),
            CustomText(sucessname!,
                textStyle: TextStyles.textMedium.copyWith(
                    color: Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp)),

          ],),
          SizedBox(height: 24,)
          ,
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(AppStrings.numOfProducts,
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp)),
              CustomText(orderItems.name ??"",
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp)),


          ],),
          Divider(),
          SizedBox(height: 8,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(AppStrings.barcode,
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp)),
              CustomText(orderItems.code ??"",
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp)),


            ],),
          Divider(),
          SizedBox(height: 8,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(AppStrings.quantity,
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp)),
              CustomText("${orderItems.quantity ??0}",
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp)),


            ],),
          SizedBox(height: 24,),




          CustomButtonContainer(
            CustomButton(
              CustomText(buttomname!,
                  textStyle: TextStyles.textMedium.copyWith(
                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp)),
              onTap,
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
