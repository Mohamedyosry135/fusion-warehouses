import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/controllers/purchase_management_controller.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/view/widgets/state_filter_bottomsheet.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:fusion_warehouses/widgets/date_picker_fn.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterWidget extends GetView<PurchaseManagementController> {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Align(
            alignment: Alignment.center,
            child: CustomText(
              AppStrings.filter,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack)
              ),
            ),
          ),
          const SizedBox(height: 8,),

          const Divider(
            color: Color(ColorCode.gray5),
          ),

          StateFilterWidget(),
          const SizedBox(height: 12,),
 

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              AppStrings.date,
            ),
          ),
          CustomTextFieldContainer(
            CustomTextFormField(
              onSave: (text) {},
              hint: AppStrings.from,
              inputType: TextInputType.text,
              label: AppStrings.from,
              enable: true,
              controller: controller.fromFilterDate,
              suffixIcon: AppSVGAssets.getWidget(AppSVGAssets.date),
              onTap: ()async{
                controller.fromDate = await showDatePickerFN(context,controller.fromDate);
                if(controller.fromDate != null){
                  controller.fromFilter = ((controller.fromDate!.millisecondsSinceEpoch /1000) + controller.fromDate!.timeZoneOffset.inSeconds).toString();

                  controller.fromFilterDate.text = DateFormat('EEEE, MMM d, yyyy',AuthService.to.language).format(controller.fromDate!);
                }


              },
            ),
          ),
          const SizedBox(height: 8,),

          CustomTextFieldContainer(
            CustomTextFormField(
              onSave: (text) {},
              hint: AppStrings.to,
              inputType: TextInputType.text,
              label: AppStrings.to,
              enable: true,
              controller: controller.toFilterDate,
              suffixIcon: AppSVGAssets.getWidget(AppSVGAssets.date),
              onTap: ()async{
                controller.toDate   = await showDatePickerFN(context,controller.toDate);
                if(controller.toDate !=null){
                  controller.toFilter = ((controller.toDate!.millisecondsSinceEpoch /1000) + controller.toDate!.timeZoneOffset.inSeconds).toString();

                  controller.toFilterDate.text = DateFormat('EEEE, MMM d, yyyy',AuthService.to.language).format(controller.toDate!);
                }

              },
            ),
          ),

          const SizedBox(
            height: 32,
          ),

          CustomButtonContainer(
            CustomButton(
              CustomText(AppStrings.confirm,
                  textStyle: TextStyles.textMedium.copyWith(
                      color: const Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp)),
                  () {
                controller.page = 1;
                controller.getExternalPurchaseOrders(controller.page,controller.barCode.text);
                Get.back();

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
