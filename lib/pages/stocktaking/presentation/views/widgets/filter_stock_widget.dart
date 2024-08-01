import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/view/widgets/state_filter_bottomsheet.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/views/widgets/state_stock_filter_bottomsheet.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:fusion_warehouses/widgets/date_picker_fn.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterStockWidget extends GetView<StocktakingController> {
  const FilterStockWidget({Key? key}) : super(key: key);

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
                  color: const Color(ColorCode.semiBlack)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Color(ColorCode.gray5),
          ),
          StateStockFilterWidget(),
          const SizedBox(
            height: 8,
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
                print(controller.statusFilter);
                controller.getStockItems(
                    controller.page, controller.statusList[controller.statusFilter.value]!);
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
