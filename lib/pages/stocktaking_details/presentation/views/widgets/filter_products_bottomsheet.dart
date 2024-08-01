import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/controllers/purchase_management_controller.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/view/widgets/state_filter_bottomsheet.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/brand_list_filter.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/categories_list_filter.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/classification_electronice_list_filter.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/stock_status_list_filter.dart';
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

class FilterProductsWidget extends GetView<StocktakingDetailsController> {
  const FilterProductsWidget({Key? key}) : super(key: key);

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

          CategoriesListFilter(),
          const SizedBox(height: 8,),
          ClassificationElectronicListFilter(),
          const SizedBox(height: 8,),
          BrandListFilter(),
          const SizedBox(height: 8,),
          StockStatusListFilter(),
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
                    if(controller.supportTicketTypeItemFilter == null){
                      controller.supportTicketTypeId = "";
                    }else{
                      controller.supportTicketTypeId = controller.supportTicketTypeItemFilter?.id.toString() ??"";
                    }

                    if(controller.categoryFilter == null){
                      controller.categoryFilterId = "";
                    }else{
                      controller.categoryFilterId = controller.categoryFilter?.id.toString() ??"";
                    }

                    if(controller.brandFilter == null){
                      controller.barndId = "";
                    }else{
                      controller.barndId = controller.brandFilter?.id.toString() ??"";
                    }

                    if(controller.statusFilter == null){
                      controller.availableFilter = "";
                    }else{
                      controller.availableFilter = controller.statusFilter?.key ??"";
                    }

                    controller
                        .getProductsOfStock(controller.id!,controller.page,10,controller.barCodeSearch,controller.categoryFilterId,controller.supportTicketTypeId,controller.availableFilter,controller.barndId);
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
